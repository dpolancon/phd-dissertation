# ==============================================================================
# PHASE 9D: RESEARCHER-DRIVEN VAR SPECIFICATION SPACE
# Extended Lag Grid (k = 1..12), Serial-Admissibility Gates, IC Neighborhoods
# ==============================================================================

suppressPackageStartupMessages({
  library(dplyr)
  library(tibble)
  library(readr)
  library(stats)
  library(urca)
  library(vars)
  library(lmtest)
})

find_repo_root <- function() {
  candidates <- c(getwd(), "c:/ReposGitHub/Chapter3_RPEUP", file.path(getwd(), ".."))
  for (cand in candidates) {
    if (dir.exists(file.path(cand, "codes")) && dir.exists(file.path(cand, "data"))) {
      return(normalizePath(cand, winslash = "/"))
    }
  }
  stop("CRITICAL: Chapter 3 repository root could not be resolved.")
}

repo_root <- find_repo_root()
phase9d_dir <- file.path(repo_root, "paper", "Version7", "audits", "granger_canonicalization", "phase9d_ic_lag_space")
if (!dir.exists(phase9d_dir)) dir.create(phase9d_dir, recursive = TRUE)

# Ingestion
bcch_csv <- file.path(repo_root, "data", "monthly_data_set", "bcch_monthly", "bcch_historical_monthly_wide.csv")
imf_csv  <- file.path(repo_root, "data", "monthly_data_set", "imf_data", "dataset_2026-08-31T21_01_52.480676493Z_DEFAULT_INTEGRATION_IMF.STA_IL_13.0.1.csv")

if (!file.exists(bcch_csv)) stop("CRITICAL: BCCh monthly file missing at: ", bcch_csv)
if (!file.exists(imf_csv))  stop("CRITICAL: IMF reserves file missing at: ", imf_csv)

message("[1/7] Ingesting BCCh historical ledgers and IMF international reserve accounts...")
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

# Benchmark November 1970 for Prebisch Capacity to Import
base_idx    <- which(df_merged$date == as.Date("1970-11-01"))
p_cu_base   <- df_merged$copper_price_bml_usd_lb_1960_2026[base_idx]
exp_base    <- df_merged$exports[base_idx]
imp_base    <- df_merged$imports[base_idx]
us_wpi_base <- df_merged$us_ppi_all_commodities_1913_2026[base_idx]

# Structural Terms of Trade and Prebisch Capacity to Import
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

systems_info <- list(
  list(step = "Step 1: Master Nominal Core",
       vars = c("pi_t", "g_H"), sample = "full", N_orig = 251, k_star = 3, is_target = FALSE),
  list(step = "Step 2: Banking Bifurcation A (Credit Lead)",
       vars = c("pi_t", "g_M1", "g_H"), sample = "raw66", N_orig = 180, k_star = 1, is_target = FALSE),
  list(step = "Step 3: Banking Bifurcation B (Multiplier Deconstruction)",
       vars = c("pi_t", "g_H", "d_ln_m"), sample = "raw66", N_orig = 180, k_star = 1, is_target = FALSE),
  list(step = "Step 4: Unified Real Dual Economy",
       vars = c("pi_t", "g_H", "d_theta", "g_Manuf", "g_Mining"), sample = "full", N_orig = 251, k_star = 2, is_target = TRUE),
  list(step = "Step 5: Unified External Cost-Push Belt",
       vars = c("g_gold", "g_e", "d_theta", "g_H", "pi_t"), sample = "full", N_orig = 251, k_star = 1, is_target = TRUE),
  list(step = "Step 6: Unified Central Bank Solvency System",
       vars = c("g_SolvR_H", "g_gold", "g_e", "g_H", "pi_t"), sample = "full", N_orig = 251, k_star = 1, is_target = TRUE)
)

k_max <- 12

# ------------------------------------------------------------------------------
# 2. RESIDUAL MEMORY MAP BEFORE MODEL SELECTION (CANONICAL K*)
# ------------------------------------------------------------------------------
message("[2/7] Computing Residual ACF & PACF through lag 24 for canonical models...")

acf_pacf_list <- list()

for (sys in systems_info) {
  d_sample <- if (sys$sample == "raw66") raw66_df else df_full
  sub_mat <- na.omit(d_sample[, sys$vars])
  
  # Fit canonical model on full available sample
  v_canon <- VAR(sub_mat, p = sys$k_star, type = "const")
  res_mat <- resid(v_canon)
  
  for (eq_name in sys$vars) {
    e_vec <- res_mat[, eq_name]
    acf_vals <- as.numeric(acf(e_vec, lag.max = 24, plot = FALSE)$acf)
    pacf_vals <- c(NA_real_, as.numeric(pacf(e_vec, lag.max = 24, plot = FALSE)$acf))
    
    for (l in 1:24) {
      acf_pacf_list[[length(acf_pacf_list) + 1]] <- tibble(
        System    = sys$step,
        Canonical_k = sys$k_star,
        Equation  = eq_name,
        Lag_h     = l,
        ACF       = round(acf_vals[l + 1], 4),
        PACF      = round(pacf_vals[l + 1], 4),
        Signif_Bound = round(1.96 / sqrt(length(e_vec)), 4),
        Is_ACF_Sig   = (abs(acf_vals[l + 1]) > 1.96 / sqrt(length(e_vec))),
        Is_PACF_Sig  = (!is.na(pacf_vals[l + 1]) && abs(pacf_vals[l + 1]) > 1.96 / sqrt(length(e_vec)))
      )
    }
  }
}

acf_pacf_df <- bind_rows(acf_pacf_list)
write_csv(acf_pacf_df, file.path(phase9d_dir, "RESIDUAL_ACF_PACF.csv"))
message("  * Residual ACF/PACF exported.")

# ------------------------------------------------------------------------------
# 3. EXTENDED VAR GRID (k = 1..12) ON COMMON SAMPLE
# ------------------------------------------------------------------------------
message("[3/7] Estimating Extended VAR Grid (k=1..12) under Common-Sample Rule...")

extended_grid_list <- list()

for (sys in systems_info) {
  d_sample <- if (sys$sample == "raw66") raw66_df else df_full
  sub_mat <- na.omit(d_sample[, sys$vars])
  T_total <- nrow(sub_mat)
  K <- length(sys$vars)
  
  # Common sample effective observations: N_eff = T_total - k_max
  # For any lag k, feed sub_mat[(k_max - k + 1):T_total, ] so effective obs is always T_total - k_max
  common_sub_mat <- sub_mat[(k_max + 1):T_total, ]
  N_common_eff <- nrow(common_sub_mat)
  
  for (k in 1:k_max) {
    # Data window matching exactly common effective calendar observations
    d_k <- sub_mat[(k_max - k + 1):T_total, ]
    v_k <- VAR(d_k, p = k, type = "const")
    
    # Verify effective observation count
    if (v_k$obs != N_common_eff) {
      stop(sprintf("Common-sample alignment mismatch: v_k$obs=%d != %d", v_k$obs, N_common_eff))
    }
    
    # 1. Fit & Complexity
    loglik_val <- as.numeric(logLik(v_k))
    deviance_val <- -2 * loglik_val
    params_per_eq <- 1 + k * K
    total_params <- K * params_per_eq
    resid_df <- N_common_eff - params_per_eq
    
    # Residual covariance determinant (Sigma_u)
    sigma_u <- crossprod(resid(v_k)) / N_common_eff
    det_sigma <- det(sigma_u)
    ln_det_sigma <- log(det_sigma)
    
    # Standard ICs following VARselect specification:
    # AIC: ln|Sigma| + 2*K^2*k / T
    # HQ:  ln|Sigma| + 2*ln(ln(T))*K^2*k / T
    # SC:  ln|Sigma| + ln(T)*K^2*k / T
    # FPE: det(Sigma) * ((T + k*K + 1)/(T - k*K - 1))^K
    aic_val <- ln_det_sigma + (2 * (k * K^2)) / N_common_eff
    hq_val  <- ln_det_sigma + (2 * log(log(N_common_eff)) * (k * K^2)) / N_common_eff
    sc_val  <- ln_det_sigma + (log(N_common_eff) * (k * K^2)) / N_common_eff
    fpe_val <- tryCatch({
      det_sigma * (((N_common_eff + k * K + 1) / (N_common_eff - k * K - 1))^K)
    }, error = function(e) NA_real_)
    
    # 2. Dynamic Stability
    r_mod <- roots(v_k, modulus = TRUE)
    max_root <- max(r_mod)
    gate_a_stable <- (max_root < 1.0)
    
    # 3. Gate B: System-Level Whiteness (Breusch-Godfrey LM, q=4)
    bg_sys <- vars::serial.test(v_k, lags.bg = 4, type = "BG")
    bg_sys_stat <- as.numeric(bg_sys$serial$statistic)
    bg_sys_df   <- as.numeric(bg_sys$serial$parameter)
    bg_sys_pval <- as.numeric(bg_sys$serial$p.value)
    gate_b_pass <- (bg_sys_pval >= 0.05)
    
    # 4. Gate C: Equation-Level Whiteness (BG order=4 for each equation)
    all_eq_pass <- TRUE
    min_eq_pval <- 1.0
    for (eq_name in sys$vars) {
      eq_fit <- v_k$varresult[[eq_name]]
      eq_bg <- bgtest(eq_fit, order = 4, type = "Chisq")
      e_p <- as.numeric(eq_bg$p.value)
      if (e_p < min_eq_pval) min_eq_pval <- e_p
      if (e_p < 0.05) all_eq_pass <- FALSE
    }
    gate_c_pass <- all_eq_pass
    
    # Combined Serial Admissibility
    is_serial_admissible <- (gate_a_stable && gate_b_pass && gate_c_pass)
    
    # 5. Gate D: Longer-Horizon Portmanteau Screen (h=12, h=24)
    # lags.pt must be > k
    pt12_pval <- NA_real_
    pt12_pass <- FALSE
    if (12 > k) {
      pt12 <- tryCatch(vars::serial.test(v_k, lags.pt = 12, type = "PT.adjusted"),
                       error = function(e) list(serial = list(p.value = NA_real_)))
      pt12_pval <- as.numeric(pt12$serial$p.value)
      pt12_pass <- (!is.na(pt12_pval) && pt12_pval >= 0.05)
    }
    
    pt24_pval <- NA_real_
    pt24_pass <- FALSE
    if (24 > k) {
      pt24 <- tryCatch(vars::serial.test(v_k, lags.pt = 24, type = "PT.adjusted"),
                       error = function(e) list(serial = list(p.value = NA_real_)))
      pt24_pval <- as.numeric(pt24$serial$p.value)
      pt24_pass <- (!is.na(pt24_pval) && pt24_pval >= 0.05)
    }
    
    # Strong Serial Admissible requires passing Serial Admissible + Portmanteau screen (h=24)
    is_strong_serial_admissible <- (is_serial_admissible && !is.na(pt24_pval) && pt24_pval >= 0.05)
    
    extended_grid_list[[length(extended_grid_list) + 1]] <- tibble(
      System          = sys$step,
      K               = K,
      Lag_k           = k,
      Is_Canonical_k  = (k == sys$k_star),
      Is_Target_System= sys$is_target,
      N_orig          = sys$N_orig,
      N_common        = N_common_eff,
      Obs_Lost        = k_max,
      Deviance        = round(deviance_val, 3),
      LogLik          = round(loglik_val, 3),
      Total_Params    = total_params,
      Resid_DF        = resid_df,
      AIC             = round(aic_val, 4),
      BIC             = round(sc_val, 4),
      HQ              = round(hq_val, 4),
      FPE             = fpe_val,
      Max_Root        = round(max_root, 4),
      Gate_A_Stable   = gate_a_stable,
      Sys_BG_stat     = round(bg_sys_stat, 3),
      Sys_BG_df       = bg_sys_df,
      Sys_BG_pval     = round(bg_sys_pval, 4),
      Gate_B_Pass     = gate_b_pass,
      Min_Eq_BG_pval  = round(min_eq_pval, 4),
      Gate_C_Pass     = gate_c_pass,
      Serial_Admissible = is_serial_admissible,
      PT12_pval       = round(pt12_pval, 4),
      PT24_pval       = round(pt24_pval, 4),
      Strong_Serial_Admissible = is_strong_serial_admissible
    )
  }
}

extended_grid_df <- bind_rows(extended_grid_list)
write_csv(extended_grid_df, file.path(phase9d_dir, "VAR_EXTENDED_LAG_GRID.csv"))
message("  * Extended VAR Grid exported.")

# ------------------------------------------------------------------------------
# 4. SERIAL-ADMISSIBLE SETS & FIT-COMPLEXITY (PARETO) FRONTIER
# ------------------------------------------------------------------------------
message("[4/7] Constructing Serial-Admissible Sets and Pareto Fit-Complexity Frontier...")

serial_admissible_df <- extended_grid_df %>% filter(Serial_Admissible == TRUE)
strong_admissible_df <- extended_grid_df %>% filter(Strong_Serial_Admissible == TRUE)

write_csv(serial_admissible_df, file.path(phase9d_dir, "SERIAL_ADMISSIBLE_SET.csv"))
write_csv(strong_admissible_df, file.path(phase9d_dir, "STRONG_SERIAL_ADMISSIBLE_SET.csv"))

# Fit-Complexity Pareto Frontier (E_VAR) on SERIAL_ADMISSIBLE set
# Candidate lies on frontier if no other serial-admissible model has <= Deviance and <= Total_Params with at least one strict
pareto_list <- list()

for (s_name in unique(extended_grid_df$System)) {
  sub_adm <- serial_admissible_df %>% filter(System == s_name)
  if (nrow(sub_adm) == 0) next
  
  # A model is dominated if there exists another model with Deviance <= d_i and Params <= p_i with strict in one
  is_pareto <- rep(TRUE, nrow(sub_adm))
  for (i in 1:nrow(sub_adm)) {
    d_i <- sub_adm$Deviance[i]
    p_i <- sub_adm$Total_Params[i]
    for (j in 1:nrow(sub_adm)) {
      if (i == j) next
      d_j <- sub_adm$Deviance[j]
      p_j <- sub_adm$Total_Params[j]
      if (d_j <= d_i && p_j <= p_i && (d_j < d_i || p_j < p_i)) {
        is_pareto[i] <- FALSE
        break
      }
    }
  }
  pareto_list[[length(pareto_list) + 1]] <- sub_adm[is_pareto, ]
}

if (length(pareto_list) > 0) {
  pareto_df <- bind_rows(pareto_list)
} else {
  pareto_df <- tibble(System = character(), Lag_k = integer(), Deviance = numeric(), Total_Params = integer())
}
write_csv(pareto_df, file.path(phase9d_dir, "FIT_COMPLEXITY_FRONTIER.csv"))
message("  * Pareto Frontier exported.")

# ------------------------------------------------------------------------------
# 5. INFORMATION-CRITERION NEIGHBORHOODS
# ------------------------------------------------------------------------------
message("[5/7] Constructing Information-Criterion Neighborhoods (Best 20%)...")

ic_neigh_list <- list()

for (s_name in unique(extended_grid_df$System)) {
  sub_adm <- serial_admissible_df %>% filter(System == s_name)
  if (nrow(sub_adm) == 0) {
    ic_neigh_list[[length(ic_neigh_list) + 1]] <- tibble(
      System          = s_name,
      Admissible_Count= 0,
      AIC_Min_k       = NA_integer_,
      BIC_Min_k       = NA_integer_,
      HQ_Min_k        = NA_integer_,
      F_AIC_20        = "NONE",
      F_BIC_20        = "NONE",
      F_HQ_20         = "NONE",
      Intersection_20 = "NONE",
      Union_20        = "NONE",
      Overlap_E_VAR   = "NONE"
    )
    next
  }
  
  # Minima
  min_aic_k <- sub_adm$Lag_k[which.min(sub_adm$AIC)]
  min_bic_k <- sub_adm$Lag_k[which.min(sub_adm$BIC)]
  min_hq_k  <- sub_adm$Lag_k[which.min(sub_adm$HQ)]
  
  # 20% neighborhoods: models within best 20% of criterion range
  # range = max(IC) - min(IC); threshold = min(IC) + 0.20 * range
  calc_neigh <- function(vals, lags) {
    if (length(vals) == 1) return(lags)
    rng <- max(vals) - min(vals)
    thresh <- if (rng > 0) min(vals) + 0.20 * rng else min(vals)
    lags[vals <= thresh]
  }
  
  n_aic <- calc_neigh(sub_adm$AIC, sub_adm$Lag_k)
  n_bic <- calc_neigh(sub_adm$BIC, sub_adm$Lag_k)
  n_hq  <- calc_neigh(sub_adm$HQ,  sub_adm$Lag_k)
  
  inter_lags <- intersect(intersect(n_aic, n_bic), n_hq)
  union_lags <- sort(unique(c(n_aic, n_bic, n_hq)))
  
  pareto_lags <- if (nrow(pareto_df %>% filter(System == s_name)) > 0) {
    (pareto_df %>% filter(System == s_name))$Lag_k
  } else integer(0)
  
  overlap_e <- intersect(union_lags, pareto_lags)
  
  ic_neigh_list[[length(ic_neigh_list) + 1]] <- tibble(
    System          = s_name,
    Admissible_Count= nrow(sub_adm),
    AIC_Min_k       = min_aic_k,
    BIC_Min_k       = min_bic_k,
    HQ_Min_k        = min_hq_k,
    F_AIC_20        = paste(n_aic, collapse = ","),
    F_BIC_20        = paste(n_bic, collapse = ","),
    F_HQ_20         = paste(n_hq, collapse = ","),
    Intersection_20 = if (length(inter_lags) > 0) paste(inter_lags, collapse = ",") else "EMPTY",
    Union_20        = paste(union_lags, collapse = ","),
    Overlap_E_VAR   = if (length(overlap_e) > 0) paste(overlap_e, collapse = ",") else "NONE"
  )
}

ic_neigh_df <- bind_rows(ic_neigh_list)
write_csv(ic_neigh_df, file.path(phase9d_dir, "IC_NEIGHBORHOODS.csv"))
message("  * IC Neighborhoods exported.")

# ------------------------------------------------------------------------------
# 6. GRANGER-INFERENCE STABILITY MAP ACROSS ADMISSIBLE MODELS
# ------------------------------------------------------------------------------
message("[6/7] Evaluating Granger stability across Serial-Admissible models...")

# Define headline target relations for Systems 4, 5, 6
target_relations <- list(
  # System 4
  list(sys = "Step 4: Unified Real Dual Economy", cause = "g_H",       effect = "g_Manuf",   name = "Base Money -> Manufacturing"),
  list(sys = "Step 4: Unified Real Dual Economy", cause = "g_Manuf",   effect = "g_H",       name = "Manufacturing -> Base Money"),
  list(sys = "Step 4: Unified Real Dual Economy", cause = "g_H",       effect = "g_Mining",  name = "Base Money -> Mining"),
  list(sys = "Step 4: Unified Real Dual Economy", cause = "g_Mining",  effect = "g_H",       name = "Mining -> Base Money"),
  list(sys = "Step 4: Unified Real Dual Economy", cause = "g_Manuf",   effect = "pi_t",      name = "Manufacturing -> CPI Inflation"),
  list(sys = "Step 4: Unified Real Dual Economy", cause = "d_theta",   effect = "g_Manuf",   name = "Import Imbalance -> Manufacturing"),
  
  # System 5
  list(sys = "Step 5: Unified External Cost-Push Belt", cause = "pi_t",    effect = "g_gold",    name = "Inflation -> World Gold"),
  list(sys = "Step 5: Unified External Cost-Push Belt", cause = "g_H",     effect = "g_gold",    name = "Base Money -> World Gold"),
  list(sys = "Step 5: Unified External Cost-Push Belt", cause = "d_theta", effect = "pi_t",      name = "Import Imbalance -> CPI Inflation"),
  list(sys = "Step 5: Unified External Cost-Push Belt", cause = "g_e",     effect = "pi_t",      name = "Exchange Rate -> CPI Inflation"),
  list(sys = "Step 5: Unified External Cost-Push Belt", cause = "pi_t",    effect = "g_e",       name = "CPI Inflation -> Exchange Rate"),
  list(sys = "Step 5: Unified External Cost-Push Belt", cause = "g_e",     effect = "g_H",       name = "Exchange Rate -> Base Money"),
  
  # System 6
  list(sys = "Step 6: Unified Central Bank Solvency System", cause = "g_SolvR_H", effect = "g_H",       name = "Solvency Depletion -> Base Money"),
  list(sys = "Step 6: Unified Central Bank Solvency System", cause = "g_H",       effect = "g_SolvR_H", name = "Base Money -> Solvency"),
  list(sys = "Step 6: Unified Central Bank Solvency System", cause = "pi_t",      effect = "g_SolvR_H", name = "CPI Inflation -> Solvency")
)

# Helper function to compute bivariate Granger F-test over common sample
calc_granger_common <- function(data, cause_var, effect_var, p) {
  sub_data <- na.omit(data[, c(effect_var, cause_var)])
  T_total <- nrow(sub_data)
  
  # Common estimation sample matching k_max = 12
  d_k <- sub_data[(k_max - p + 1):T_total, ]
  N_eff <- nrow(d_k) - p
  
  y <- d_k[[effect_var]][(p + 1):nrow(d_k)]
  
  X_u <- matrix(1, nrow = length(y), ncol = 1)
  for (i in 1:p) X_u <- cbind(X_u, d_k[[effect_var]][(p + 1 - i):(nrow(d_k) - i)])
  for (i in 1:p) X_u <- cbind(X_u, d_k[[cause_var]][(p + 1 - i):(nrow(d_k) - i)])
  
  cols_rest <- c(1, 1 + (1:p))
  X_r <- X_u[, cols_rest, drop = FALSE]
  
  fit_u <- lm.fit(X_u, y)
  fit_r <- lm.fit(X_r, y)
  
  rss_u <- sum(fit_u$residuals^2)
  rss_r <- sum(fit_r$residuals^2)
  
  df_num <- p
  df_den <- length(y) - ncol(X_u)
  
  f_stat <- ((rss_r - rss_u) / df_num) / (rss_u / df_den)
  p_val  <- pf(f_stat, df_num, df_den, lower.tail = FALSE)
  
  cause_indices <- 1 + p + (1:p)
  sum_beta <- sum(fit_u$coefficients[cause_indices])
  
  tibble(F_stat = f_stat, p_val = p_val, sum_beta = sum_beta)
}

granger_stability_list <- list()

for (rel in target_relations) {
  sub_adm <- serial_admissible_df %>% filter(System == rel$sys)
  sys_obj <- (systems_info[sapply(systems_info, function(x) x$step == rel$sys)])[[1]]
  d_sample <- if (sys_obj$sample == "raw66") raw66_df else df_full
  
  # If no serial admissible models exist
  if (nrow(sub_adm) == 0) {
    granger_stability_list[[length(granger_stability_list) + 1]] <- tibble(
      System          = rel$sys,
      Relation        = rel$name,
      Lag_k           = NA_integer_,
      Is_Admissible   = FALSE,
      F_stat          = NA_real_,
      p_value         = NA_real_,
      Sum_Beta        = NA_real_,
      Sign            = NA_character_,
      Signif_Class    = "NOT_EVALUABLE",
      Stability_Class = "NOT_EVALUABLE"
    )
    next
  }
  
  # For each admissible lag
  for (k_adm in sub_adm$Lag_k) {
    g_res <- calc_granger_common(d_sample, rel$cause, rel$effect, k_adm)
    sig_class <- if (g_res$p_val < 0.01) "p < 0.01" else if (g_res$p_val < 0.05) "p < 0.05" else if (g_res$p_val < 0.10) "p < 0.10" else "n.s."
    sgn <- if (g_res$sum_beta > 0) "+" else "-"
    
    granger_stability_list[[length(granger_stability_list) + 1]] <- tibble(
      System          = rel$sys,
      Relation        = rel$name,
      Lag_k           = k_adm,
      Is_Admissible   = TRUE,
      F_stat          = round(g_res$F_stat, 3),
      p_value         = round(g_res$p_val, 4),
      Sum_Beta        = round(g_res$sum_beta, 4),
      Sign            = sgn,
      Signif_Class    = sig_class,
      Stability_Class = "EVALUATED"
    )
  }
}

granger_stability_df <- bind_rows(granger_stability_list)
write_csv(granger_stability_df, file.path(phase9d_dir, "GRANGER_ADMISSIBLE_STABILITY.csv"))
message("  * Granger Admissible Stability exported.")

message("[7/7] Phase 9D computation completed successfully.")
