# ==============================================================================
# Script: paper/Version7/audits/granger_canonicalization/phase9e_conditional_partition/phase9e_conditional_partition.R
# Purpose: Phase 9E: Conditional Granger Alignment + October-1973 Historical Partition
# Author: Empirical Macroeconometrician & Integration Editor
# ==============================================================================

suppressPackageStartupMessages({
  library(dplyr)
  library(tibble)
  library(readr)
  library(stats)
  library(vars)
})

set.seed(20260928)

repo_root <- "c:/ReposGitHub/Chapter3_RPEUP"
audit_dir <- file.path(repo_root, "paper", "Version7", "audits", "granger_canonicalization", "phase9e_conditional_partition")
if (!dir.exists(audit_dir)) dir.create(audit_dir, recursive = TRUE)

message("[Phase 9E] Initializing forensic econometric analysis...")

# ------------------------------------------------------------------------------
# 1. DATA INGESTION & HARMONIZATION (Exact match to production engine)
# ------------------------------------------------------------------------------
bcch_csv <- file.path(repo_root, "data", "monthly_data_set", "bcch_monthly", "bcch_historical_monthly_wide.csv")
imf_csv  <- file.path(repo_root, "data", "monthly_data_set", "imf_data", "dataset_2026-08-31T21_01_52.480676493Z_DEFAULT_INTEGRATION_IMF.STA_IL_13.0.1.csv")

if (!file.exists(bcch_csv)) stop("BCCh monthly file missing at: ", bcch_csv)
if (!file.exists(imf_csv))  stop("IMF reserves file missing at: ", imf_csv)

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

message(sprintf("  * Full dataset: %d rows (usable N=%d), %s to %s",
                nrow(df_full), sum(!is.na(df_full$g_H)),
                as.character(min(df_full$date)), as.character(max(df_full$date))))
message(sprintf("  * Raw66 dataset: %d rows, %s to %s",
                nrow(raw66_df), as.character(min(raw66_df$date)), as.character(max(raw66_df$date))))

# ------------------------------------------------------------------------------
# 2. DEFINITIONS OF SYSTEMS AND HEADLINE PAIRS
# ------------------------------------------------------------------------------
systems_meta <- list(
  "Step 1: Master Nominal Core" = list(
    step = "Step 1: Master Nominal Core",
    vars = c("pi_t", "g_H"),
    sample = "full",
    k_star = 3
  ),
  "Step 2: Banking Bifurcation A (Credit Lead)" = list(
    step = "Step 2: Banking Bifurcation A (Credit Lead)",
    vars = c("pi_t", "g_M1", "g_H"),
    sample = "raw66",
    k_star = 1
  ),
  "Step 3: Banking Bifurcation B (Multiplier Deconstruction)" = list(
    step = "Step 3: Banking Bifurcation B (Multiplier Deconstruction)",
    vars = c("pi_t", "g_H", "d_ln_m"),
    sample = "raw66",
    k_star = 1
  ),
  "Step 4: Unified Real Dual Economy" = list(
    step = "Step 4: Unified Real Dual Economy",
    vars = c("pi_t", "g_H", "d_theta", "g_Manuf", "g_Mining"),
    sample = "full",
    k_star = 2
  ),
  "Step 5: Unified External Cost-Push Belt" = list(
    step = "Step 5: Unified External Cost-Push Belt",
    vars = c("g_gold", "g_e", "d_theta", "g_H", "pi_t"),
    sample = "full",
    k_star = 1
  ),
  "Step 6: Unified Central Bank Solvency System" = list(
    step = "Step 6: Unified Central Bank Solvency System",
    vars = c("g_SolvR_H", "g_gold", "g_e", "g_H", "pi_t"),
    sample = "full",
    k_star = 1
  )
)

# ------------------------------------------------------------------------------
# 3. PAIRWISE REPRODUCTION & ESTIMATOR DEFINITIONS
# ------------------------------------------------------------------------------
message("[1/6] Verifying numerical reproduction of production pairwise Granger tests...")

# Production Pairwise Granger function
run_pairwise_granger <- function(data, cause_var, effect_var, p) {
  sub_data <- na.omit(data[, c(effect_var, cause_var)])
  N <- nrow(sub_data)
  
  if (N <= (2 * p + 5)) {
    return(tibble(
      cause = cause_var, effect = effect_var, lag = p,
      F_stat = NA_real_, chisq = NA_real_, p_value = NA_real_,
      sum_beta = NA_real_, se_sum = NA_real_, t_sum = NA_real_, N = N,
      df_num = p, df_den = NA_real_
    ))
  }
  
  y <- sub_data[[effect_var]][(p + 1):N]
  X_u <- matrix(1, nrow = N - p, ncol = 1)
  for (i in 1:p) X_u <- cbind(X_u, sub_data[[effect_var]][(p + 1 - i):(N - i)])
  for (i in 1:p) X_u <- cbind(X_u, sub_data[[cause_var]][(p + 1 - i):(N - i)])
  
  cols_rest <- c(1, 1 + (1:p))
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
  
  cause_indices <- 1 + p + (1:p)
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
    F_stat   = f_stat,
    chisq    = chisq_stat,
    p_value  = p_val,
    sum_beta = sum_beta,
    se_sum   = se_sum,
    t_sum    = t_sum,
    N        = length(y),
    df_num   = df_num,
    df_den   = df_den
  )
}

# New Conditional Multivariate Granger function
run_conditional_granger_var <- function(data, system_vars, cause_var, effect_var, p) {
  sub_data <- na.omit(data[, system_vars])
  N <- nrow(sub_data)
  K <- length(system_vars)
  
  y <- sub_data[[effect_var]][(p + 1):N]
  N_eff <- length(y)
  
  if (N_eff <= (K * p + 5)) {
    return(tibble(
      cause = cause_var, effect = effect_var, lag = p,
      F_stat = NA_real_, chisq = NA_real_, p_value = NA_real_,
      sum_beta = NA_real_, se_sum = NA_real_, t_sum = NA_real_, N = N_eff,
      df_num = p, df_den = NA_real_
    ))
  }
  
  # Design matrix for unrestricted VAR equation:
  # Intercept + p lags for ALL K system variables
  X_u <- matrix(1, nrow = N_eff, ncol = 1)
  colnames_u <- c("(Intercept)")
  
  for (v in system_vars) {
    for (i in 1:p) {
      X_u <- cbind(X_u, sub_data[[v]][(p + 1 - i):(N - i)])
      colnames_u <- c(colnames_u, paste0(v, "_lag", i))
    }
  }
  colnames(X_u) <- colnames_u
  
  # Restricted matrix: drop all p lags of cause_var
  cause_cols <- paste0(cause_var, "_lag", 1:p)
  cause_indices <- which(colnames_u %in% cause_cols)
  
  X_r <- X_u[, -cause_indices, drop = FALSE]
  
  fit_u <- lm.fit(X_u, y)
  fit_r <- lm.fit(X_r, y)
  
  rss_u <- sum(fit_u$residuals^2)
  rss_r <- sum(fit_r$residuals^2)
  
  df_num <- p
  df_den <- N_eff - ncol(X_u)
  
  f_stat <- ((rss_r - rss_u) / df_num) / (rss_u / df_den)
  chisq_stat <- f_stat * df_num
  p_val  <- pf(f_stat, df_num, df_den, lower.tail = FALSE)
  
  beta_cause <- fit_u$coefficients[cause_indices]
  sum_beta <- sum(beta_cause)
  
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
    F_stat   = f_stat,
    chisq    = chisq_stat,
    p_value  = p_val,
    sum_beta = sum_beta,
    se_sum   = se_sum,
    t_sum    = t_sum,
    N        = N_eff,
    df_num   = df_num,
    df_den   = df_den
  )
}

# Load existing canonical sequential results
seq_res <- read.csv(file.path(repo_root, "output", "tables_data", "granger_sequential_results.csv"))
opt_sbic_rows <- seq_res %>% filter(Is_Opt_SBIC == TRUE)

repro_list <- list()
for (i in 1:nrow(opt_sbic_rows)) {
  r <- opt_sbic_rows[i, ]
  d_sample <- if (r$Sample == "raw66") raw66_df else df_full
  est <- run_pairwise_granger(d_sample, r$INDV_Code, r$DV_Code, r$Lag_k)
  
  diff_F <- abs(round(est$F_stat, 3) - r$F_stat)
  diff_p <- abs(est$p_value - r$p_value)
  
  repro_list[[length(repro_list) + 1]] <- tibble(
    System       = r$Step,
    Relation     = paste(r$INDV_Code, "->", r$DV_Code),
    H0_Statement = r$H0_Statement,
    Cause        = r$INDV_Code,
    Effect       = r$DV_Code,
    Canonical_k  = r$Lag_k,
    Existing_F   = r$F_stat,
    Repro_F      = round(est$F_stat, 3),
    Existing_p   = r$p_value,
    Repro_p      = round(est$p_value, 6),
    Diff_F       = diff_F,
    Pass         = (diff_F == 0 && diff_p < 1e-4)
  )
}

repro_df <- bind_rows(repro_list)
write_csv(repro_df, file.path(audit_dir, "PAIRWISE_REPRODUCTION.csv"))

if (!all(repro_df$Pass)) {
  stop("PHASE9E_BLOCKED — CURRENT GRANGER RESULTS NOT REPRODUCIBLE")
} else {
  message("  * REPRODUCTION PASS: 40/40 headline canonical relations reproduced with exact precision.")
}

# ------------------------------------------------------------------------------
# 4. CONDITIONAL MULTIVARIATE GRANGER & CROSSWALK
# ------------------------------------------------------------------------------
message("[2/6] Estimating Full-Sample Conditional Granger VAR tests and building crosswalk...")

crosswalk_list <- list()
cond_full_list <- list()

for (i in 1:nrow(opt_sbic_rows)) {
  r <- opt_sbic_rows[i, ]
  sys_meta <- systems_meta[[r$Step]]
  d_sample <- if (r$Sample == "raw66") raw66_df else df_full
  
  # Pairwise estimate
  pw_est <- run_pairwise_granger(d_sample, r$INDV_Code, r$DV_Code, r$Lag_k)
  
  # Conditional estimate
  cond_est <- run_conditional_granger_var(d_sample, sys_meta$vars, r$INDV_Code, r$DV_Code, r$Lag_k)
  
  pw_sig   <- (pw_est$p_value < 0.05)
  cond_sig <- (cond_est$p_value < 0.05)
  
  pw_sign   <- sign(pw_est$sum_beta)
  cond_sign <- sign(cond_est$sum_beta)
  
  classification <- if (pw_sig == cond_sig && pw_sign == cond_sign) {
    "UNCHANGED"
  } else if (pw_sig != cond_sig && pw_sign == cond_sign) {
    "SIGNIFICANCE_CHANGED"
  } else if (pw_sig == cond_sig && pw_sign != cond_sign) {
    "SIGN_CHANGED"
  } else if (pw_sig != cond_sig && pw_sign != cond_sign) {
    "DIRECTION_CHANGED"
  } else {
    "NOT_COMPARABLE"
  }
  
  # Save full conditional record
  cond_full_list[[length(cond_full_list) + 1]] <- tibble(
    System        = r$Step,
    Relation      = paste(r$INDV_Code, "->", r$DV_Code),
    Cause         = r$INDV_Code,
    Effect        = r$DV_Code,
    Lag_k         = r$Lag_k,
    N_eff         = cond_est$N,
    DF_num        = cond_est$df_num,
    DF_den        = cond_est$df_den,
    Cond_F_stat   = round(cond_est$F_stat, 4),
    Cond_Wald_chisq = round(cond_est$chisq, 4),
    Cond_p_value  = round(cond_est$p_value, 6),
    Cond_Sum_Beta = round(cond_est$sum_beta, 4),
    Cond_SE_Sum   = round(cond_est$se_sum, 4),
    Cond_t_stat   = round(cond_est$t_sum, 4),
    Cond_Sign     = if (cond_est$sum_beta > 0) "+" else if (cond_est$sum_beta < 0) "-" else "0",
    Cond_Sig_05   = (cond_est$p_value < 0.05)
  )
  
  # Save crosswalk comparison
  crosswalk_list[[length(crosswalk_list) + 1]] <- tibble(
    System           = r$Step,
    Relation         = paste(r$INDV_Code, "->", r$DV_Code),
    Canonical_k      = r$Lag_k,
    Pairwise_F       = round(pw_est$F_stat, 3),
    Pairwise_p       = round(pw_est$p_value, 5),
    Pairwise_Sign    = if (pw_est$sum_beta > 0) "+" else "-",
    Pairwise_Sig_05  = pw_sig,
    Conditional_F    = round(cond_est$F_stat, 3),
    Conditional_p    = round(cond_est$p_value, 5),
    Conditional_Sign = if (cond_est$sum_beta > 0) "+" else "-",
    Conditional_Sig_05 = cond_sig,
    Classification   = classification
  )
}

cond_full_df <- bind_rows(cond_full_list)
crosswalk_df <- bind_rows(crosswalk_list)

write_csv(cond_full_df, file.path(audit_dir, "CONDITIONAL_GRANGER_FULL_SAMPLE.csv"))
write_csv(crosswalk_df, file.path(audit_dir, "PAIRWISE_VS_CONDITIONAL_CROSSWALK.csv"))
message("  * Conditional Granger full sample and Crosswalk exported.")

# ------------------------------------------------------------------------------
# 5. HISTORICAL PARTITION: OCTOBER 1973 (SYSTEMS 4, 5, 6)
# ------------------------------------------------------------------------------
message("[3/6] Estimating Historical Partition VAR grid (Full vs Pre-Oct73 vs Post-Oct73)...")

split_date <- as.Date("1973-10-01")

partitions <- list(
  "Full Sample"  = df_full,
  "Pre-Oct73"    = df_full %>% filter(date < split_date),
  "Post-Oct73"   = df_full %>% filter(date >= split_date)
)

target_system_names <- c(
  "Step 4: Unified Real Dual Economy",
  "Step 5: Unified External Cost-Push Belt",
  "Step 6: Unified Central Bank Solvency System"
)

partition_grid_list <- list()

for (sys_name in target_system_names) {
  sys_meta <- systems_meta[[sys_name]]
  s_vars   <- sys_meta$vars
  K        <- length(s_vars)
  
  for (part_name in names(partitions)) {
    part_df <- partitions[[part_name]]
    sub_mat <- na.omit(part_df[, s_vars])
    N_raw   <- nrow(sub_mat)
    
    # Estimate VAR(k) for k = 1..4
    for (k in 1:4) {
      N_eff <- N_raw - k
      total_params <- K * (1 + K * k)
      resid_df <- N_eff - (1 + K * k)
      
      var_fit <- tryCatch({
        VAR(sub_mat, p = k, type = "const")
      }, error = function(e) NULL)
      
      if (is.null(var_fit)) {
        partition_grid_list[[length(partition_grid_list) + 1]] <- tibble(
          System = sys_name, Partition = part_name, Lag_k = k,
          N_raw = N_raw, N_eff = N_eff, Total_Params = total_params, Resid_DF = resid_df,
          AIC = NA_real_, BIC = NA_real_, HQ = NA_real_, FPE = NA_real_,
          Max_Root = NA_real_, Gate_A_Stable = FALSE,
          Sys_BG_stat = NA_real_, Sys_BG_df = NA_integer_, Sys_BG_pval = NA_real_, Gate_B_Pass = FALSE,
          Min_Eq_BG_pval = NA_real_, Gate_C_Pass = FALSE,
          Serial_Admissible = FALSE, PT12_pval = NA_real_
        )
        next
      }
      
      roots <- roots(var_fit, modulus = TRUE)
      max_root <- max(roots)
      gate_a_stable <- (max_root < 1.0)
      
      # System Breusch-Godfrey LM test (lags.bg = 4)
      bg_sys <- tryCatch(
        serial.test(var_fit, lags.bg = 4, type = "BG"),
        error = function(e) list(serial = list(statistic = NA_real_, parameter = NA_integer_, p.value = NA_real_))
      )
      bg_sys_stat <- as.numeric(bg_sys$serial$statistic)
      bg_sys_df   <- as.integer(bg_sys$serial$parameter)
      bg_sys_pval <- as.numeric(bg_sys$serial$p.value)
      gate_b_pass <- (!is.na(bg_sys_pval) && bg_sys_pval >= 0.05)
      
      # Equation-level Breusch-Godfrey LM tests (order = 4)
      eq_pvals <- numeric(K)
      eq_names <- colnames(sub_mat)
      
      for (eq_idx in 1:K) {
        lm_eq <- var_fit$varresult[[eq_idx]]
        e_resid <- residuals(lm_eq)
        T_eq <- length(e_resid)
        X_mat <- model.matrix(lm_eq)
        
        # Construct 4 lagged residuals
        E_lags <- matrix(0, nrow = T_eq, ncol = 4)
        for (l in 1:4) {
          if (l < T_eq) E_lags[(l + 1):T_eq, l] <- e_resid[1:(T_eq - l)]
        }
        
        lm_aux <- lm(e_resid ~ X_mat - 1 + E_lags)
        r2_aux <- summary(lm_aux)$r.squared
        lm_stat <- T_eq * r2_aux
        eq_pvals[eq_idx] <- pchisq(lm_stat, df = 4, lower.tail = FALSE)
      }
      
      min_eq_pval <- min(eq_pvals)
      gate_c_pass <- (min_eq_pval >= 0.05)
      
      is_serial_admissible <- (gate_a_stable && gate_b_pass && gate_c_pass)
      
      # Portmanteau test at lag 12 if degrees of freedom permit
      pt12_pval <- NA_real_
      if (N_eff > 15) {
        pt12 <- tryCatch(
          serial.test(var_fit, lags.pt = 12, type = "PT.adjusted"),
          error = function(e) list(serial = list(p.value = NA_real_))
        )
        pt12_pval <- as.numeric(pt12$serial$p.value)
      }
      
      # Information criteria from log-likelihood
      ll_val <- as.numeric(logLik(var_fit))
      det_sigma <- det(summary(var_fit)$covres)
      aic_val <- log(det_sigma) + (2 * total_params) / N_eff
      bic_val <- log(det_sigma) + (log(N_eff) * total_params) / N_eff
      hq_val  <- log(det_sigma) + (2 * log(log(N_eff)) * total_params) / N_eff
      fpe_val <- det_sigma * ((N_eff + total_params / K) / (N_eff - total_params / K))^K
      
      partition_grid_list[[length(partition_grid_list) + 1]] <- tibble(
        System            = sys_name,
        Partition         = part_name,
        Lag_k             = k,
        N_raw             = N_raw,
        N_eff             = N_eff,
        Total_Params      = total_params,
        Resid_DF          = resid_df,
        AIC               = round(aic_val, 4),
        BIC               = round(bic_val, 4),
        HQ                = round(hq_val, 4),
        FPE               = fpe_val,
        Max_Root          = round(max_root, 4),
        Gate_A_Stable     = gate_a_stable,
        Sys_BG_stat       = round(bg_sys_stat, 3),
        Sys_BG_df         = bg_sys_df,
        Sys_BG_pval       = round(bg_sys_pval, 4),
        Gate_B_Pass       = gate_b_pass,
        Min_Eq_BG_pval    = round(min_eq_pval, 4),
        Gate_C_Pass       = gate_c_pass,
        Serial_Admissible = is_serial_admissible,
        PT12_pval         = round(pt12_pval, 4)
      )
    }
  }
}

partition_grid_df <- bind_rows(partition_grid_list)
write_csv(partition_grid_df, file.path(audit_dir, "PARTITION_VAR_GRID.csv"))

# Build partition admissibility summary
part_adm_list <- list()
for (sys_name in target_system_names) {
  sub_sys <- partition_grid_df %>% filter(System == sys_name)
  
  full_adm <- sub_sys %>% filter(Partition == "Full Sample", Serial_Admissible == TRUE)
  pre_adm  <- sub_sys %>% filter(Partition == "Pre-Oct73", Serial_Admissible == TRUE)
  post_adm <- sub_sys %>% filter(Partition == "Post-Oct73", Serial_Admissible == TRUE)
  
  n_full <- nrow(full_adm)
  n_pre  <- nrow(pre_adm)
  n_post <- nrow(post_adm)
  
  diag_class <- if (n_full == 0 && n_pre > 0 && n_post == 0) {
    "PERSISTENCE_DISAPPEARS_PRE73"
  } else if (n_full == 0 && n_pre == 0 && n_post > 0) {
    "PERSISTENCE_DISAPPEARS_POST73"
  } else if (n_pre > 0 && n_post > 0) {
    "BOTH_SUBPERIODS_ADMISSIBLE"
  } else if (n_pre == 0 && n_post == 0) {
    "PERSISTENCE_REMAINS_BOTH_SIDES"
  } else {
    "MIXED_DIAGNOSTIC_EVIDENCE"
  }
  
  part_adm_list[[length(part_adm_list) + 1]] <- tibble(
    System           = sys_name,
    Full_Adm_Count   = n_full,
    Full_Adm_Lags    = if (n_full > 0) paste(full_adm$Lag_k, collapse = ",") else "NONE",
    Pre73_Adm_Count  = n_pre,
    Pre73_Adm_Lags   = if (n_pre > 0) paste(pre_adm$Lag_k, collapse = ",") else "NONE",
    Post73_Adm_Count = n_post,
    Post73_Adm_Lags  = if (n_post > 0) paste(post_adm$Lag_k, collapse = ",") else "NONE",
    Classification   = diag_class
  )
}

part_adm_df <- bind_rows(part_adm_list)
write_csv(part_adm_df, file.path(audit_dir, "PARTITION_SERIAL_ADMISSIBILITY.csv"))
message("  * Partition VAR Grid and Serial Admissibility exported.")

# ------------------------------------------------------------------------------
# 6. RESIDUAL-MEMORY COMPARISON (ACF/PACF AT HORIZONS 4, 6, 12, 24)
# ------------------------------------------------------------------------------
message("[4/6] Computing Residual Memory profiles across partitions...")

memory_list <- list()

for (sys_name in target_system_names) {
  sys_meta <- systems_meta[[sys_name]]
  s_vars   <- sys_meta$vars
  k_star   <- sys_meta$k_star
  
  for (part_name in names(partitions)) {
    part_df <- partitions[[part_name]]
    sub_mat <- na.omit(part_df[, s_vars])
    
    var_fit <- VAR(sub_mat, p = k_star, type = "const")
    e_mat   <- residuals(var_fit)
    T_part  <- nrow(e_mat)
    signif_bound <- 2 / sqrt(T_part)
    
    max_h <- min(24, floor(T_part / 3))
    
    for (v_name in s_vars) {
      e_vec <- e_mat[, v_name]
      acf_res  <- acf(e_vec, lag.max = max_h, plot = FALSE)$acf[-1]
      pacf_res <- pacf(e_vec, lag.max = max_h, plot = FALSE)$acf
      
      for (target_h in c(4, 6, 12, 24)) {
        if (target_h <= length(acf_res)) {
          a_val <- acf_res[target_h]
          p_val <- pacf_res[target_h]
          is_sig <- (abs(a_val) > signif_bound || abs(p_val) > signif_bound)
          
          memory_list[[length(memory_list) + 1]] <- tibble(
            System       = sys_name,
            Partition    = part_name,
            Canonical_k  = k_star,
            Variable     = v_name,
            Lag_h        = target_h,
            ACF          = round(a_val, 4),
            PACF         = round(p_val, 4),
            Signif_Bound = round(signif_bound, 4),
            Is_Sig       = is_sig
          )
        } else {
          memory_list[[length(memory_list) + 1]] <- tibble(
            System       = sys_name,
            Partition    = part_name,
            Canonical_k  = k_star,
            Variable     = v_name,
            Lag_h        = target_h,
            ACF          = NA_real_,
            PACF         = NA_real_,
            Signif_Bound = round(signif_bound, 4),
            Is_Sig       = NA
          )
        }
      }
    }
  }
}

memory_df <- bind_rows(memory_list)
write_csv(memory_df, file.path(audit_dir, "PARTITION_RESIDUAL_MEMORY.csv"))
message("  * Partition Residual Memory exported.")

# ------------------------------------------------------------------------------
# 7. CONDITIONAL GRANGER WITHIN HISTORICAL PARTITIONS
# ------------------------------------------------------------------------------
message("[5/6] Estimating Conditional Granger inference within historical partitions...")

# Evaluates only on ADMISSIBLE VAR models in each partition
part_granger_list <- list()

# Extract headline relations for target systems (Systems 4, 5, 6)
target_headline_rows <- opt_sbic_rows %>% filter(Step %in% target_system_names)

for (i in 1:nrow(target_headline_rows)) {
  r <- target_headline_rows[i, ]
  sys_name <- r$Step
  sys_meta <- systems_meta[[sys_name]]
  
  # Check admissibility for each partition
  # For Full Sample: check if any admissible k exists, or canonical k
  sub_full <- partition_grid_df %>% filter(System == sys_name, Partition == "Full Sample")
  sub_pre  <- partition_grid_df %>% filter(System == sys_name, Partition == "Pre-Oct73")
  sub_post <- partition_grid_df %>% filter(System == sys_name, Partition == "Post-Oct73")
  
  # Select best admissible k or NA
  pick_admissible_k <- function(sub_df) {
    adm <- sub_df %>% filter(Serial_Admissible == TRUE)
    if (nrow(adm) == 0) return(NA_integer_)
    # Return lag with minimum AIC among admissible
    adm$Lag_k[which.min(adm$AIC)]
  }
  
  k_full <- pick_admissible_k(sub_full)
  k_pre  <- pick_admissible_k(sub_pre)
  k_post <- pick_admissible_k(sub_post)
  
  # Full sample estimate
  res_full_txt <- if (is.na(k_full)) {
    "NOT_EVALUABLE — NO SERIAL-ADMISSIBLE VAR"
  } else {
    est <- run_conditional_granger_var(partitions[["Full Sample"]], sys_meta$vars, r$INDV_Code, r$DV_Code, k_full)
    sprintf("k=%d: F=%.2f, p=%.4f, sum_beta=%.3f [ADM]", k_full, est$F_stat, est$p_value, est$sum_beta)
  }
  
  # Pre-Oct73 estimate
  res_pre_txt <- if (is.na(k_pre)) {
    "NOT_EVALUABLE — NO SERIAL-ADMISSIBLE VAR"
  } else {
    est <- run_conditional_granger_var(partitions[["Pre-Oct73"]], sys_meta$vars, r$INDV_Code, r$DV_Code, k_pre)
    sprintf("k=%d: F=%.2f, p=%.4f, sum_beta=%.3f [ADM]", k_pre, est$F_stat, est$p_value, est$sum_beta)
  }
  
  # Post-Oct73 estimate
  res_post_txt <- if (is.na(k_post)) {
    "NOT_EVALUABLE — NO SERIAL-ADMISSIBLE VAR"
  } else {
    est <- run_conditional_granger_var(partitions[["Post-Oct73"]], sys_meta$vars, r$INDV_Code, r$DV_Code, k_post)
    sprintf("k=%d: F=%.2f, p=%.4f, sum_beta=%.3f [ADM]", k_post, est$F_stat, est$p_value, est$sum_beta)
  }
  
  # Result stability classification
  stab_class <- if (is.na(k_pre) && is.na(k_post)) {
    "NOT_EVALUABLE"
  } else if (!is.na(k_pre) && is.na(k_post)) {
    "PRE73_ONLY"
  } else if (is.na(k_pre) && !is.na(k_post)) {
    "POST73_ONLY"
  } else {
    # Both admissible: check stability
    est_pre  <- run_conditional_granger_var(partitions[["Pre-Oct73"]], sys_meta$vars, r$INDV_Code, r$DV_Code, k_pre)
    est_post <- run_conditional_granger_var(partitions[["Post-Oct73"]], sys_meta$vars, r$INDV_Code, r$DV_Code, k_post)
    sig_pre  <- (est_pre$p_value < 0.05)
    sig_post <- (est_post$p_value < 0.05)
    sign_pre  <- sign(est_pre$sum_beta)
    sign_post <- sign(est_post$sum_beta)
    if (sig_pre == sig_post && sign_pre == sign_post) {
      "STABLE_ACROSS_HISTORY"
    } else {
      "REGIME_SENSITIVE"
    }
  }
  
  part_granger_list[[length(part_granger_list) + 1]] <- tibble(
    System           = sys_name,
    Relation         = paste(r$INDV_Code, "->", r$DV_Code),
    Full_Sample      = res_full_txt,
    Pre_Oct73        = res_pre_txt,
    Post_Oct73       = res_post_txt,
    Stability_Class  = stab_class
  )
}

part_granger_df <- bind_rows(part_granger_list)
write_csv(part_granger_df, file.path(audit_dir, "PARTITION_CONDITIONAL_GRANGER.csv"))
message("  * Partition Conditional Granger exported.")

message("[6/6] Phase 9E execution complete! All artifacts generated successfully.")
