# ==============================================================================
# Script: paper/Version7/audits/ty_demotion/run_ty_demotion_comparison.R
# Purpose: Isolated Econometric Comparison Engine for Phase 8 Demotion Audit
#          Evaluates Stationary VAR Baseline (d=0) vs. Toda-Yamamoto (d=1)
#          Strictly isolated from production scripts and paper assets.
# ==============================================================================

suppressPackageStartupMessages({
  library(dplyr)
  library(tibble)
  library(readr)
  library(stats)
  library(urca)
  library(vars)
})

# 1. PATH RESOLUTION
repo_root <- "c:/ReposGitHub/Chapter3_RPEUP"
audit_dir <- file.path(repo_root, "paper", "Version7", "audits", "ty_demotion")
if (!dir.exists(audit_dir)) dir.create(audit_dir, recursive = TRUE)

message("[INFO] Running isolated Toda-Yamamoto vs. Stationary VAR comparison...")

# 2. DATA INGESTION & HARMONIZATION (Exact replica of production setup)
bcch_csv <- file.path(repo_root, "data", "monthly_data_set", "bcch_monthly", "bcch_historical_monthly_wide.csv")
imf_csv  <- file.path(repo_root, "data", "monthly_data_set", "imf_data", "dataset_2026-08-31T21_01_52.480676493Z_DEFAULT_INTEGRATION_IMF.STA_IL_13.0.1.csv")

df_bcch <- read.csv(bcch_csv, stringsAsFactors = FALSE)
df_bcch$date <- as.Date(df_bcch$date)

df_imf_raw <- read.csv(imf_csv, stringsAsFactors = FALSE, check.names = FALSE)
res_row <- df_imf_raw %>% filter(SERIES_CODE == "CHL.TRGNV_REVS.USD.M")
imf_cols <- grep("^[0-9]{4}-M[0-9]{2}$", colnames(df_imf_raw), value = TRUE)
clean_dates <- as.Date(paste0(sub("-M", "-", imf_cols), "-01"))

imf_long <- data.frame(
  date = clean_dates,
  IR_usd = as.numeric(res_row[1, imf_cols])
) %>% filter(!is.na(date))

df_merged <- df_bcch %>%
  left_join(imf_long, by = "date") %>%
  filter(date >= as.Date("1960-01-01") & date <= as.Date("1980-12-01")) %>%
  arrange(date)

# Clean April 1973 customs strike outlier in imports (linear interpolation)
idx_apr73 <- which(df_merged$date == as.Date("1973-04-01"))
if (length(idx_apr73) > 0) {
  mar_val <- df_merged$imports[df_merged$date == as.Date("1973-03-01")]
  may_val <- df_merged$imports[df_merged$date == as.Date("1973-05-01")]
  df_merged$imports[idx_apr73] <- (mar_val + may_val) / 2
}

# Variable construction
base_idx    <- which(df_merged$date == as.Date("1970-11-01"))
p_cu_base   <- df_merged$copper_price_bml_usd_lb_1960_2026[base_idx]
exp_base    <- df_merged$exports[base_idx]
imp_base    <- df_merged$imports[base_idx]
us_wpi_base <- df_merged$us_ppi_all_commodities_1913_2026[base_idx]

df_merged$tot_cu  <- (df_merged$copper_price_bml_usd_lb_1960_2026 / p_cu_base) / (df_merged$us_ppi_all_commodities_1913_2026 / us_wpi_base) * 100
df_merged$cap_imp <- (df_merged$exports / exp_base) * (df_merged$tot_cu / 100) * 100
df_merged$eff_imp <- (df_merged$imports / imp_base) * 100
df_merged$theta   <- (df_merged$eff_imp / df_merged$cap_imp) * 100

e_usd <- df_merged$usd_exchange_rate_observed_1960_2026

df_full <- df_merged %>%
  mutate(
    pi_t       = ipc_monthly_var_pct_1928_2026,
    H          = monetary_base_emision_1960_2026,
    g_H        = c(NA, diff(log(H))) * 100,
    M1         = m1_money_supply_1965_2026,
    g_M1       = c(NA, diff(log(M1))) * 100,
    m_t        = M1 / H,
    d_ln_m     = c(NA, diff(log(m_t))) * 100,
    g_Manuf    = c(NA, diff(log(manuf))) * 100,
    g_Mining   = c(NA, diff(log(mining))) * 100,
    g_gold     = c(NA, diff(log(gold_price_usd_oz_1960_2026))) * 100,
    d_theta    = c(NA, diff(log(theta))) * 100,
    g_e        = c(NA, diff(log(e_usd))) * 100,
    SolvR_H    = (e_usd * IR_usd) / (H * 1000),
    g_SolvR_H  = c(NA, diff(log(SolvR_H))) * 100
  )

raw66_df <- df_full %>% filter(date >= as.Date("1966-01-01"))

# 3. CORE ESTIMATOR FUNCTION (Handles both d_max = 1 [TY] and d_max = 0 [Stationary VAR])
run_granger_calc <- function(data, cause_var, effect_var, p, d_max = 0) {
  sub_data <- na.omit(data[, c(effect_var, cause_var)])
  N <- nrow(sub_data)
  p_tot <- p + d_max
  
  if (N <= (2 * p_tot + 5)) {
    return(tibble(
      cause = cause_var, effect = effect_var, lag = p, d_max = d_max,
      F_stat = NA_real_, chisq = NA_real_, p_value = NA_real_,
      sum_beta = NA_real_, se_sum = NA_real_, t_sum = NA_real_, N = N
    ))
  }
  
  y <- sub_data[[effect_var]][(p_tot + 1):N]
  
  X_u <- matrix(1, nrow = N - p_tot, ncol = 1)
  for (i in 1:p_tot) X_u <- cbind(X_u, sub_data[[effect_var]][(p_tot + 1 - i):(N - i)])
  for (i in 1:p_tot) X_u <- cbind(X_u, sub_data[[cause_var]][(p_tot + 1 - i):(N - i)])
  
  cols_rest <- c(1, 1 + (1:p_tot))
  if (d_max > 0) {
    cols_rest <- c(cols_rest, 1 + p_tot + ((p + 1):p_tot))
  }
  X_r <- X_u[, cols_rest, drop = FALSE]
  
  fit_u <- lm.fit(X_u, y)
  fit_r <- lm.fit(X_r, y)
  
  rss_u <- sum(fit_u$residuals^2)
  rss_r <- sum(fit_r$residuals^2)
  
  df_num <- p
  df_den <- length(y) - ncol(X_u)
  
  f_stat <- ((rss_r - rss_u) / df_num) / (rss_u / df_den)
  chisq_stat <- f_stat * df_num
  p_val  <- pf(f_stat, df_num, df_den, lower.tail = FALSE)
  
  cause_indices <- 1 + p_tot + (1:p)
  beta_k <- fit_u$coefficients[cause_indices]
  sum_beta <- sum(beta_k)
  
  s2 <- rss_u / df_den
  cov_mat <- tryCatch({
    s2 * solve(t(X_u) %*% X_u)[cause_indices, cause_indices, drop = FALSE]
  }, error = function(e) matrix(0, nrow = p, ncol = p))
  
  se_sum <- sqrt(max(0, sum(cov_mat)))
  t_sum  <- if (se_sum > 0) sum_beta / se_sum else NA_real_
  
  tibble(
    cause    = cause_var,
    effect   = effect_var,
    lag      = p,
    d_max    = d_max,
    F_stat   = f_stat,
    chisq    = chisq_stat,
    p_value  = p_val,
    sum_beta = sum_beta,
    se_sum   = se_sum,
    t_sum    = t_sum,
    N        = N,
    df_den   = df_den
  )
}

# 4. SYSTEM DEFINITIONS & PAIRS TO TEST
systems_info <- list(
  list(step = "Step 1: Master Nominal Core", vars = c("pi_t", "g_H"), sample = "full", N = 250, opt_k = 3),
  list(step = "Step 2: Banking Bifurcation A (Credit Lead)", vars = c("pi_t", "g_M1", "g_H"), sample = "raw66", N = 180, opt_k = 1),
  list(step = "Step 3: Banking Bifurcation B (Multiplier Deconstruction)", vars = c("pi_t", "g_H", "d_ln_m"), sample = "raw66", N = 180, opt_k = 1),
  list(step = "Step 4: Unified Real Dual Economy", vars = c("pi_t", "g_H", "d_theta", "g_Manuf", "g_Mining"), sample = "full", N = 250, opt_k = 2),
  list(step = "Step 5: Unified External Cost-Push Belt", vars = c("g_gold", "g_e", "d_theta", "g_H", "pi_t"), sample = "full", N = 250, opt_k = 1),
  list(step = "Step 6: Unified Central Bank Solvency System", vars = c("g_SolvR_H", "g_gold", "g_e", "g_H", "pi_t"), sample = "full", N = 250, opt_k = 1)
)

pairs_to_test <- list(
  # STEP 1: Nominal Core
  list(step = "Step 1: Master Nominal Core", dv = "g_H", indv = "pi_t", sample = "full", dir_arrow = "\\pi \\to g_H"),
  list(step = "Step 1: Master Nominal Core", dv = "pi_t", indv = "g_H", sample = "full", dir_arrow = "g_H \\to \\pi"),

  # STEP 2: Banking Bifurcation A
  list(step = "Step 2: Banking Bifurcation A (Credit Lead)", dv = "g_H", indv = "g_M1", sample = "raw66", dir_arrow = "M1 \\to H"),
  list(step = "Step 2: Banking Bifurcation A (Credit Lead)", dv = "g_M1", indv = "g_H", sample = "raw66", dir_arrow = "H \\to M1"),
  list(step = "Step 2: Banking Bifurcation A (Credit Lead)", dv = "g_M1", indv = "pi_t", sample = "raw66", dir_arrow = "\\pi \\to M1"),
  list(step = "Step 2: Banking Bifurcation A (Credit Lead)", dv = "pi_t", indv = "g_M1", sample = "raw66", dir_arrow = "M1 \\to \\pi"),

  # STEP 3: Banking Bifurcation B
  list(step = "Step 3: Banking Bifurcation B (Multiplier Deconstruction)", dv = "pi_t", indv = "d_ln_m", sample = "raw66", dir_arrow = "m \\to \\pi"),
  list(step = "Step 3: Banking Bifurcation B (Multiplier Deconstruction)", dv = "d_ln_m", indv = "pi_t", sample = "raw66", dir_arrow = "\\pi \\to m"),

  # STEP 4: Real Dual Economy
  list(step = "Step 4: Unified Real Dual Economy", dv = "g_Manuf", indv = "g_H", sample = "full", dir_arrow = "g_H \\to \\text{Manuf}"),
  list(step = "Step 4: Unified Real Dual Economy", dv = "g_H", indv = "g_Manuf", sample = "full", dir_arrow = "\\text{Manuf} \\to g_H"),
  list(step = "Step 4: Unified Real Dual Economy", dv = "g_Mining", indv = "g_H", sample = "full", dir_arrow = "g_H \\to \\text{Mining}"),
  list(step = "Step 4: Unified Real Dual Economy", dv = "g_H", indv = "g_Mining", sample = "full", dir_arrow = "\\text{Mining} \\to g_H"),
  list(step = "Step 4: Unified Real Dual Economy", dv = "g_Manuf", indv = "d_theta", sample = "full", dir_arrow = "\\Theta \\to \\text{Manuf}"),
  list(step = "Step 4: Unified Real Dual Economy", dv = "d_theta", indv = "g_Manuf", sample = "full", dir_arrow = "\\text{Manuf} \\to \\Theta"),
  list(step = "Step 4: Unified Real Dual Economy", dv = "g_Mining", indv = "d_theta", sample = "full", dir_arrow = "\\Theta \\to \\text{Mining}"),
  list(step = "Step 4: Unified Real Dual Economy", dv = "d_theta", indv = "g_Mining", sample = "full", dir_arrow = "\\text{Mining} \\to \\Theta"),
  list(step = "Step 4: Unified Real Dual Economy", dv = "g_Manuf", indv = "g_Mining", sample = "full", dir_arrow = "\\text{Mining} \\to \\text{Manuf}"),
  list(step = "Step 4: Unified Real Dual Economy", dv = "pi_t", indv = "g_Manuf", sample = "full", dir_arrow = "\\text{Manuf} \\to \\pi"),
  list(step = "Step 4: Unified Real Dual Economy", dv = "g_Manuf", indv = "pi_t", sample = "full", dir_arrow = "\\pi \\to \\text{Manuf}"),

  # STEP 5: External Cost-Push Belt
  list(step = "Step 5: Unified External Cost-Push Belt", dv = "g_gold", indv = "g_H", sample = "full", dir_arrow = "g_H \\to \\text{Gold}"),
  list(step = "Step 5: Unified External Cost-Push Belt", dv = "g_gold", indv = "pi_t", sample = "full", dir_arrow = "\\pi \\to \\text{Gold}"),
  list(step = "Step 5: Unified External Cost-Push Belt", dv = "g_gold", indv = "d_theta", sample = "full", dir_arrow = "\\Theta \\to \\text{Gold}"),
  list(step = "Step 5: Unified External Cost-Push Belt", dv = "g_gold", indv = "g_e", sample = "full", dir_arrow = "g_e \\to \\text{Gold}"),
  list(step = "Step 5: Unified External Cost-Push Belt", dv = "pi_t", indv = "g_gold", sample = "full", dir_arrow = "\\text{Gold} \\to \\pi"),
  list(step = "Step 5: Unified External Cost-Push Belt", dv = "d_theta", indv = "g_H", sample = "full", dir_arrow = "g_H \\to \\Theta"),
  list(step = "Step 5: Unified External Cost-Push Belt", dv = "g_H", indv = "d_theta", sample = "full", dir_arrow = "\\Theta \\to g_H"),
  list(step = "Step 5: Unified External Cost-Push Belt", dv = "pi_t", indv = "d_theta", sample = "full", dir_arrow = "\\Theta \\to \\pi"),
  list(step = "Step 5: Unified External Cost-Push Belt", dv = "d_theta", indv = "pi_t", sample = "full", dir_arrow = "\\pi \\to \\Theta"),
  list(step = "Step 5: Unified External Cost-Push Belt", dv = "pi_t", indv = "g_e", sample = "full", dir_arrow = "g_e \\to \\pi"),
  list(step = "Step 5: Unified External Cost-Push Belt", dv = "g_e", indv = "pi_t", sample = "full", dir_arrow = "\\pi \\to g_e"),
  list(step = "Step 5: Unified External Cost-Push Belt", dv = "g_H", indv = "g_e", sample = "full", dir_arrow = "g_e \\to g_H"),
  list(step = "Step 5: Unified External Cost-Push Belt", dv = "g_e", indv = "g_H", sample = "full", dir_arrow = "g_H \\to g_e"),

  # STEP 6: Central Bank Solvency System
  list(step = "Step 6: Unified Central Bank Solvency System", dv = "g_H", indv = "g_SolvR_H", sample = "full", dir_arrow = "\\text{SolvR}^H \\to g_H"),
  list(step = "Step 6: Unified Central Bank Solvency System", dv = "g_SolvR_H", indv = "g_H", sample = "full", dir_arrow = "g_H \\to \\text{SolvR}^H"),
  list(step = "Step 6: Unified Central Bank Solvency System", dv = "g_SolvR_H", indv = "pi_t", sample = "full", dir_arrow = "\\pi \\to \\text{SolvR}^H"),
  list(step = "Step 6: Unified Central Bank Solvency System", dv = "pi_t", indv = "g_SolvR_H", sample = "full", dir_arrow = "\\text{SolvR}^H \\to \\pi"),
  list(step = "Step 6: Unified Central Bank Solvency System", dv = "g_e", indv = "g_SolvR_H", sample = "full", dir_arrow = "\\text{SolvR}^H \\to g_e"),
  list(step = "Step 6: Unified Central Bank Solvency System", dv = "g_SolvR_H", indv = "g_e", sample = "full", dir_arrow = "g_e \\to \\text{SolvR}^H"),
  list(step = "Step 6: Unified Central Bank Solvency System", dv = "g_SolvR_H", indv = "g_gold", sample = "full", dir_arrow = "\\text{Gold} \\to \\text{SolvR}^H"),
  list(step = "Step 6: Unified Central Bank Solvency System", dv = "g_gold", indv = "g_SolvR_H", sample = "full", dir_arrow = "\\text{SolvR}^H \\to \\text{Gold}")
)

# 5. EXECUTE COMPARISON GRID
results_list <- list()

for (p_idx in seq_along(pairs_to_test)) {
  pair_item <- pairs_to_test[[p_idx]]
  d_sample <- if (pair_item$sample == "raw66") raw66_df else df_full
  
  # Find opt_k
  sys_match <- Find(function(x) x$step == pair_item$step, systems_info)
  opt_k <- sys_match$opt_k
  
  for (k in 1:4) {
    # 1. Toda-Yamamoto (d_max = 1)
    res_ty <- run_granger_calc(d_sample, pair_item$indv, pair_item$dv, k, d_max = 1)
    # Check overrides as in production to verify exact reproduction
    res_ty_f <- res_ty$F_stat
    res_ty_chisq <- res_ty$chisq
    res_ty_pval <- res_ty$p_value
    res_ty_beta <- res_ty$sum_beta
    
    # 2. Stationary VAR (d_max = 0)
    res_var <- run_granger_calc(d_sample, pair_item$indv, pair_item$dv, k, d_max = 0)
    
    # Classification at this lag
    is_opt <- (k == opt_k)
    
    # Determine status
    sig_ty  <- res_ty_pval < 0.05
    sig_var <- res_var$p_value < 0.05
    
    status <- if (sig_ty == sig_var) {
      if (sign(res_ty_beta) != sign(res_var$sum_beta) && sig_var) "SIGN_FLIP" else "UNCHANGED"
    } else if (sig_ty && !sig_var) {
      "SIGNIFICANCE_LOST"
    } else if (!sig_ty && sig_var) {
      "SIGNIFICANCE_GAINED"
    } else {
      "UNCHANGED"
    }
    
    results_list[[length(results_list) + 1]] <- tibble(
      Step           = pair_item$step,
      DV_Code        = pair_item$dv,
      INDV_Code      = pair_item$indv,
      Relation       = pair_item$dir_arrow,
      Lag_k          = k,
      Is_Opt_SBIC    = is_opt,
      # Toda-Yamamoto (d=1)
      TY_F_stat      = round(res_ty_f, 3),
      TY_Wald_chisq  = round(res_ty_chisq, 3),
      TY_p_value     = round(res_ty_pval, 5),
      TY_Sum_Beta    = round(res_ty_beta, 4),
      TY_SE_Sum      = round(res_ty$se_sum, 4),
      TY_t_Sum       = round(res_ty$t_sum, 3),
      TY_Sig_05      = sig_ty,
      # Stationary VAR (d=0)
      VAR_F_stat     = round(res_var$F_stat, 3),
      VAR_Wald_chisq = round(res_var$chisq, 3),
      VAR_p_value    = round(res_var$p_value, 5),
      VAR_Sum_Beta   = round(res_var$sum_beta, 4),
      VAR_SE_Sum     = round(res_var$se_sum, 4),
      VAR_t_Sum      = round(res_var$t_sum, 3),
      VAR_Sig_05     = sig_var,
      # Comparison Status
      Status         = status,
      Sample         = pair_item$sample,
      N_obs          = res_var$N
    )
  }
}

ty_vs_var_df <- bind_rows(results_list)
write_csv(ty_vs_var_df, file.path(audit_dir, "ty_vs_var_results.csv"))
message("[SUCCESS] Exported: ty_vs_var_results.csv")

# 6. LAG SELECTION AUDIT TABLE
lag_sel_raw <- read_csv(file.path(repo_root, "output", "tables_data", "granger_lag_selection.csv"), show_col_types = FALSE)
write_csv(lag_sel_raw, file.path(audit_dir, "ty_vs_var_lag_selection.csv"))
message("[SUCCESS] Exported: ty_vs_var_lag_selection.csv")

# 7. PARAMETER COST TABLE
param_cost_list <- list()
for (sys in systems_info) {
  N <- sys$N
  K <- length(sys$vars)
  k_star <- sys$opt_k
  
  # Parameters per equation: constant + K * k
  var_params_eq <- 1 + K * k_star
  ty_params_eq  <- 1 + K * (k_star + 1)
  extra_eq      <- ty_params_eq - var_params_eq
  rel_cost_eq   <- round((extra_eq / var_params_eq) * 100, 1)
  
  # Total system parameters:
  var_params_sys <- K * var_params_eq
  ty_params_sys  <- K * ty_params_eq
  extra_sys      <- ty_params_sys - var_params_sys
  
  param_cost_list[[length(param_cost_list) + 1]] <- tibble(
    System           = sys$step,
    N                = N,
    K                = K,
    k_star           = k_star,
    VAR_Params_Eq    = var_params_eq,
    TY_Params_Eq     = ty_params_eq,
    Extra_Params_Eq  = extra_eq,
    Rel_Cost_Pct_Eq  = rel_cost_eq,
    VAR_Params_Sys   = var_params_sys,
    TY_Params_Sys    = ty_params_sys,
    Extra_Params_Sys = extra_sys
  )
}
param_cost_df <- bind_rows(param_cost_list)
write_csv(param_cost_df, file.path(audit_dir, "ty_vs_var_parameter_cost.csv"))
message("[SUCCESS] Exported: ty_vs_var_parameter_cost.csv")

# 8. DIAGNOSTIC BATTERY ON STATIONARY VAR(k*)
message("[INFO] Computing multivariate VAR(k*) residual diagnostics...")
diag_list <- list()
for (sys in systems_info) {
  d_sample <- if (sys$sample == "raw66") raw66_df else df_full
  sub_mat <- na.omit(d_sample[, sys$vars])
  
  var_est <- VAR(sub_mat, p = sys$opt_k, type = "const")
  
  # Serial correlation LM test (Breusch-Godfrey)
  pt_test <- tryCatch(serial.test(var_est, lags.pt = 12, type = "PT.asymptotic"), error = function(e) NULL)
  bg_test <- tryCatch(serial.test(var_est, lags.bg = 4, type = "BG"), error = function(e) NULL)
  
  # ARCH test
  arch_test <- tryCatch(arch.test(var_est, lags.multi = 4), error = function(e) NULL)
  
  # Normality test
  norm_test <- tryCatch(normality.test(var_est), error = function(e) NULL)
  
  # Roots / Stability
  roots_vec <- roots(var_est)
  max_root  <- max(abs(roots_vec))
  is_stable <- max_root < 1.0
  
  diag_list[[length(diag_list) + 1]] <- tibble(
    System      = sys$step,
    K           = length(sys$vars),
    k_star      = sys$opt_k,
    Max_Root    = round(max_root, 4),
    Is_Stable   = is_stable,
    PT_p_val    = if (!is.null(pt_test)) round(as.numeric(pt_test$serial$p.value)[1], 4) else NA_real_,
    BG_p_val    = if (!is.null(bg_test)) round(as.numeric(bg_test$serial$p.value)[1], 4) else NA_real_,
    ARCH_p_val  = if (!is.null(arch_test)) round(as.numeric(arch_test$arch.mul$p.value)[1], 4) else NA_real_,
    JB_p_val    = if (!is.null(norm_test)) round(as.numeric(norm_test$jb.mul$JB$p.value)[1], 4) else NA_real_
  )
}
diag_df <- bind_rows(diag_list)
write_csv(diag_df, file.path(audit_dir, "stationary_var_diagnostics.csv"))
message("[SUCCESS] Exported: stationary_var_diagnostics.csv")

message("[INFO] Isolation comparison engine finished successfully.")
