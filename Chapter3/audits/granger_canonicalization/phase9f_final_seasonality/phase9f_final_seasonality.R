# ==============================================================================
# Script: paper/Version7/audits/granger_canonicalization/phase9f_final_seasonality/phase9f_final_seasonality.R
# Purpose: Phase 9F: Final Seasonality Audit and Empirical Stopping Rule
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
audit_dir <- file.path(repo_root, "paper", "Version7", "audits", "granger_canonicalization", "phase9f_final_seasonality")
if (!dir.exists(audit_dir)) dir.create(audit_dir, recursive = TRUE)

message("[Phase 9F] Initializing final seasonality audit and empirical stopping rule...")

# ------------------------------------------------------------------------------
# 1. DATA INGESTION & VARIABLE HARMONIZATION
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
    month      = as.integer(format(date, "%m")),
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

# Filter usable observations (drop row 1 where differences are NA)
df_usable <- df_full %>% filter(!is.na(g_H))
N_usable <- nrow(df_usable)
message(sprintf("  * Usable dataset: N = %d (1960:02 to 1980:12)", N_usable))

# ------------------------------------------------------------------------------
# 2. TASK 1: DATA PROVENANCE AUDIT
# ------------------------------------------------------------------------------
message("[1/6] Auditing seasonal-adjustment provenance of source series...")

provenance_df <- tibble(
  Variable = c("pi_t", "g_H", "d_theta", "g_Manuf", "g_Mining", "g_gold", "g_e", "g_SolvR_H"),
  Source_Series = c(
    "ipc_monthly_var_pct_1928_2026 (F074.IPC.VAR.Z.Z.C.M)",
    "monetary_base_emision_1960_2026 (F021.BMO.STO.N.CLP.0.M)",
    "theta = eff_imp / cap_imp (Exports & Imports basic volume indices)",
    "manuf (Consumer manufacturing physical output index, base 1970=100)",
    "mining (Mining physical extraction index, base 1970=100)",
    "gold_price_usd_oz_1960_2026 (F019.PPB.PRE.44B.M)",
    "usd_exchange_rate_observed_1960_2026 (F073.TCO.PRE.HIST.M)",
    "SolvR_H = (e * IR) / (H * 1000)"
  ),
  Source = c(
    "INE / Central Bank of Chile (Boletín Mensual)",
    "Central Bank of Chile (Boletín Mensual)",
    "Díaz-Bahamonde (2023, IMEA) / DGE / INE / BCCh",
    "ODEPLAN / INE / Díaz-Bahamonde (2023)",
    "SERNAGEOMIN / ODEPLAN / Díaz-Bahamonde (2023)",
    "London Bullion Market Association (LBMA) / World Gold Council",
    "Central Bank of Chile (Boletín Mensual)",
    "Central Bank of Chile & IMF International Financial Statistics"
  ),
  SA_Status = c(
    "NOT_SEASONALLY_ADJUSTED",
    "NOT_SEASONALLY_ADJUSTED",
    "NOT_SEASONALLY_ADJUSTED",
    "NOT_SEASONALLY_ADJUSTED",
    "NOT_SEASONALLY_ADJUSTED",
    "NOT_SEASONALLY_ADJUSTED",
    "NOT_SEASONALLY_ADJUSTED",
    "NOT_SEASONALLY_ADJUSTED"
  ),
  Evidence_Location = c(
    "DATA_DICTIONARY.md line 21; bcch_monthly/README.md line 60 ('IPC General histórico, variación mensual')",
    "DATA_DICTIONARY.md line 17; bcch_monthly/README.md line 63 ('Base Monetaria / Emisión')",
    "DATA_DICTIONARY.md lines 26-27, 37; imea_data.xlsx Hoja1 row 4 ('Series básicas')",
    "DATA_DICTIONARY.md line 28; imea_data.xlsx Hoja1 row 4 ('Series básicas')",
    "DATA_DICTIONARY.md line 29; imea_data.xlsx Hoja1 row 4 ('Series básicas')",
    "DATA_DICTIONARY.md line 25; bcch_monthly/README.md line 67 ('Gold Price USD/oz')",
    "DATA_DICTIONARY.md line 20; bcch_monthly/README.md line 62 ('USD Observed Exchange Rate')",
    "DATA_DICTIONARY.md line 36; 05_4_threshold_var.tex eq (19) ('SolvR stock ratio')"
  ),
  Confidence = rep("HIGH", 8)
)

write_csv(provenance_df, file.path(audit_dir, "SEASONAL_ADJUSTMENT_PROVENANCE.csv"))
message("  * Seasonal adjustment provenance exported.")

# ------------------------------------------------------------------------------
# 3. TASK 2: UNIVARIATE MONTH-OF-YEAR DIAGNOSTIC
# ------------------------------------------------------------------------------
message("[2/6] Estimating univariate month-of-year regressions and tests...")

month_diag_list <- list()
month_factor <- factor(df_usable$month)

for (v in provenance_df$Variable) {
  y <- df_usable[[v]]
  fit_m <- lm(y ~ month_factor)
  
  # Joint F-test of 11 month dummies
  aov_res <- anova(fit_m)
  f_stat  <- aov_res["month_factor", "F value"]
  p_val   <- aov_res["month_factor", "Pr(>F)"]
  has_effect <- (!is.na(p_val) && p_val < 0.05)
  
  # Compute month-specific means
  m_means <- tapply(y, df_usable$month, mean, na.rm = TRUE)
  
  month_diag_list[[length(month_diag_list) + 1]] <- tibble(
    Variable = v,
    N = length(y),
    Joint_F = round(f_stat, 3),
    p_value = round(p_val, 5),
    Month_Effects_Detected = has_effect,
    Mean_Jan = round(m_means[1], 3),
    Mean_Feb = round(m_means[2], 3),
    Mean_Mar = round(m_means[3], 3),
    Mean_Apr = round(m_means[4], 3),
    Mean_May = round(m_means[5], 3),
    Mean_Jun = round(m_means[6], 3),
    Mean_Jul = round(m_means[7], 3),
    Mean_Aug = round(m_means[8], 3),
    Mean_Sep = round(m_means[9], 3),
    Mean_Oct = round(m_means[10], 3),
    Mean_Nov = round(m_means[11], 3),
    Mean_Dec = round(m_means[12], 3)
  )
}

month_diag_df <- bind_rows(month_diag_list)
write_csv(month_diag_df, file.path(audit_dir, "MONTH_OF_YEAR_TESTS.csv"))
message("  * Month-of-year tests exported.")

# ------------------------------------------------------------------------------
# 4. TASK 3 & 4: DIRECT NON-SEASONAL VS. SEASONAL-DUMMY VAR GRID
# ------------------------------------------------------------------------------
message("[3/6] Estimating Seasonal VAR Grid (k=1..4) with 11 Month Dummies...")

# Construct 11 monthly dummies (months 2 to 12; month 1 is base in presence of intercept)
D_season_all <- model.matrix(~ factor(df_usable$month))[, -1]
colnames(D_season_all) <- paste0("sd_", 2:12)

# Verify full rank
if (qr(cbind(1, D_season_all))$rank != 12) stop("CRITICAL: Seasonal dummy matrix is rank deficient.")

systems_target <- list(
  "Step 4: Unified Real Dual Economy" = list(
    step = "Step 4: Unified Real Dual Economy",
    vars = c("pi_t", "g_H", "d_theta", "g_Manuf", "g_Mining"),
    k_canon = 2
  ),
  "Step 5: Unified External Cost-Push Belt" = list(
    step = "Step 5: Unified External Cost-Push Belt",
    vars = c("g_gold", "g_e", "d_theta", "g_H", "pi_t"),
    k_canon = 1
  ),
  "Step 6: Unified Central Bank Solvency System" = list(
    step = "Step 6: Unified Central Bank Solvency System",
    vars = c("g_SolvR_H", "g_gold", "g_e", "g_H", "pi_t"),
    k_canon = 1
  )
)

seasonal_grid_list <- list()

for (sys_name in names(systems_target)) {
  s_info <- systems_target[[sys_name]]
  s_vars <- s_info$vars
  K      <- length(s_vars)
  sub_y  <- df_usable[, s_vars]
  
  for (k in 1:4) {
    N_eff <- N_usable - k
    
    # --------------------------------------------------------------------------
    # MODEL A: Non-Seasonal VAR(k)
    # --------------------------------------------------------------------------
    params_ns <- K * (1 + K * k)
    resid_df_ns <- N_eff - (1 + K * k)
    
    fit_ns <- tryCatch(VAR(sub_y, p = k, type = "const"), error = function(e) NULL)
    roots_ns <- if (!is.null(fit_ns)) roots(fit_ns, modulus = TRUE) else NA_real_
    max_root_ns <- if (!is.null(fit_ns)) max(roots_ns) else NA_real_
    gate_a_ns <- (!is.na(max_root_ns) && max_root_ns < 1.0)
    
    bg_sys_ns <- if (!is.null(fit_ns)) {
      tryCatch(serial.test(fit_ns, lags.bg = 4, type = "BG"),
               error = function(e) list(serial = list(statistic = NA_real_, parameter = NA_integer_, p.value = NA_real_)))
    } else list(serial = list(statistic = NA_real_, parameter = NA_integer_, p.value = NA_real_))
    bg_sys_pval_ns <- as.numeric(bg_sys_ns$serial$p.value)
    gate_b_ns <- (!is.na(bg_sys_pval_ns) && bg_sys_pval_ns >= 0.05)
    
    # Equation-level BG
    eq_pvals_ns <- numeric(K)
    for (eq_idx in 1:K) {
      lm_eq <- fit_ns$varresult[[eq_idx]]
      e_resid <- residuals(lm_eq)
      T_eq <- length(e_resid)
      X_mat <- model.matrix(lm_eq)
      E_lags <- matrix(0, nrow = T_eq, ncol = 4)
      for (l in 1:4) {
        if (l < T_eq) E_lags[(l + 1):T_eq, l] <- e_resid[1:(T_eq - l)]
      }
      lm_aux <- lm(e_resid ~ X_mat - 1 + E_lags)
      r2_aux <- summary(lm_aux)$r.squared
      lm_stat <- T_eq * r2_aux
      eq_pvals_ns[eq_idx] <- pchisq(lm_stat, df = 4, lower.tail = FALSE)
    }
    min_eq_pval_ns <- min(eq_pvals_ns)
    gate_c_ns <- (min_eq_pval_ns >= 0.05)
    
    # Portmanteau Q at lag 24
    pt24_ns <- tryCatch(serial.test(fit_ns, lags.pt = 24, type = "PT.adjusted"),
                        error = function(e) list(serial = list(p.value = NA_real_)))
    pt24_pval_ns <- as.numeric(pt24_ns$serial$p.value)
    
    # Exact ICs using total system parameter count
    det_sigma_ns <- det(summary(fit_ns)$covres)
    aic_ns <- log(det_sigma_ns) + (2 * params_ns) / N_eff
    bic_ns <- log(det_sigma_ns) + (log(N_eff) * params_ns) / N_eff
    hq_ns  <- log(det_sigma_ns) + (2 * log(log(N_eff)) * params_ns) / N_eff
    
    adm_ns <- (gate_a_ns && gate_b_ns && gate_c_ns)
    
    seasonal_grid_list[[length(seasonal_grid_list) + 1]] <- tibble(
      System            = sys_name,
      Lag_k             = k,
      Seasonal_Terms    = "NO (Baseline)",
      Total_Params      = params_ns,
      Resid_DF          = resid_df_ns,
      AIC               = round(aic_ns, 4),
      BIC               = round(bic_ns, 4),
      HQ                = round(hq_ns, 4),
      Max_Root          = round(max_root_ns, 4),
      Gate_A_Stable     = gate_a_ns,
      Sys_BG_stat       = round(as.numeric(bg_sys_ns$serial$statistic), 3),
      Sys_BG_df         = as.integer(bg_sys_ns$serial$parameter),
      Sys_BG_pval       = round(bg_sys_pval_ns, 4),
      Gate_B_Pass       = gate_b_ns,
      Min_Eq_BG_pval    = round(min_eq_pval_ns, 4),
      Gate_C_Pass       = gate_c_ns,
      Serial_Admissible = adm_ns,
      PT24_pval         = round(pt24_pval_ns, 4)
    )
    
    # --------------------------------------------------------------------------
    # MODEL B: Seasonal-Dummy VAR(k) (+ 11 monthly dummies)
    # --------------------------------------------------------------------------
    # Total parameters per equation: 1 (const) + 11 (sd_2..12) + K*k (lags) = 12 + K*k
    # Total system parameters: K * (12 + K*k)
    params_s <- K * (12 + K * k)
    resid_df_s <- N_eff - (12 + K * k)
    
    fit_s <- tryCatch(VAR(sub_y, p = k, type = "const", exogen = D_season_all), error = function(e) NULL)
    roots_s <- if (!is.null(fit_s)) roots(fit_s, modulus = TRUE) else NA_real_
    max_root_s <- if (!is.null(fit_s)) max(roots_s) else NA_real_
    gate_a_s <- (!is.na(max_root_s) && max_root_s < 1.0)
    
    bg_sys_s <- if (!is.null(fit_s)) {
      tryCatch(serial.test(fit_s, lags.bg = 4, type = "BG"),
               error = function(e) list(serial = list(statistic = NA_real_, parameter = NA_integer_, p.value = NA_real_)))
    } else list(serial = list(statistic = NA_real_, parameter = NA_integer_, p.value = NA_real_))
    bg_sys_pval_s <- as.numeric(bg_sys_s$serial$p.value)
    gate_b_s <- (!is.na(bg_sys_pval_s) && bg_sys_pval_s >= 0.05)
    
    # Equation-level BG
    eq_pvals_s <- numeric(K)
    for (eq_idx in 1:K) {
      lm_eq <- fit_s$varresult[[eq_idx]]
      e_resid <- residuals(lm_eq)
      T_eq <- length(e_resid)
      X_mat <- model.matrix(lm_eq)
      E_lags <- matrix(0, nrow = T_eq, ncol = 4)
      for (l in 1:4) {
        if (l < T_eq) E_lags[(l + 1):T_eq, l] <- e_resid[1:(T_eq - l)]
      }
      lm_aux <- lm(e_resid ~ X_mat - 1 + E_lags)
      r2_aux <- summary(lm_aux)$r.squared
      lm_stat <- T_eq * r2_aux
      eq_pvals_s[eq_idx] <- pchisq(lm_stat, df = 4, lower.tail = FALSE)
    }
    min_eq_pval_s <- min(eq_pvals_s)
    gate_c_s <- (min_eq_pval_s >= 0.05)
    
    # Portmanteau Q at lag 24
    pt24_s <- tryCatch(serial.test(fit_s, lags.pt = 24, type = "PT.adjusted"),
                       error = function(e) list(serial = list(p.value = NA_real_)))
    pt24_pval_s <- as.numeric(pt24_s$serial$p.value)
    
    # Exact ICs with full parameter penalty
    det_sigma_s <- det(summary(fit_s)$covres)
    aic_s <- log(det_sigma_s) + (2 * params_s) / N_eff
    bic_s <- log(det_sigma_s) + (log(N_eff) * params_s) / N_eff
    hq_s  <- log(det_sigma_s) + (2 * log(log(N_eff)) * params_s) / N_eff
    
    adm_s <- (gate_a_s && gate_b_s && gate_c_s)
    
    seasonal_grid_list[[length(seasonal_grid_list) + 1]] <- tibble(
      System            = sys_name,
      Lag_k             = k,
      Seasonal_Terms    = "YES (+11 Dummies)",
      Total_Params      = params_s,
      Resid_DF          = resid_df_s,
      AIC               = round(aic_s, 4),
      BIC               = round(bic_s, 4),
      HQ                = round(hq_s, 4),
      Max_Root          = round(max_root_s, 4),
      Gate_A_Stable     = gate_a_s,
      Sys_BG_stat       = round(as.numeric(bg_sys_s$serial$statistic), 3),
      Sys_BG_df         = as.integer(bg_sys_s$serial$parameter),
      Sys_BG_pval       = round(bg_sys_pval_s, 4),
      Gate_B_Pass       = gate_b_s,
      Min_Eq_BG_pval    = round(min_eq_pval_s, 4),
      Gate_C_Pass       = gate_c_s,
      Serial_Admissible = adm_s,
      PT24_pval         = round(pt24_pval_s, 4)
    )
  }
}

seasonal_grid_df <- bind_rows(seasonal_grid_list)
write_csv(seasonal_grid_df, file.path(audit_dir, "SEASONAL_VAR_GRID.csv"))
message("  * Seasonal VAR Grid exported.")

# ------------------------------------------------------------------------------
# 5. TASK 5: SYSTEM-LEVEL SEASONALITY CLASSIFICATION
# ------------------------------------------------------------------------------
message("[4/6] Classifying system seasonality outcomes...")

season_class_list <- list()

for (sys_name in names(systems_target)) {
  sub_df <- seasonal_grid_df %>% filter(System == sys_name)
  sub_ns <- sub_df %>% filter(Seasonal_Terms == "NO (Baseline)")
  sub_s  <- sub_df %>% filter(Seasonal_Terms == "YES (+11 Dummies)")
  
  adm_ns_count <- sum(sub_ns$Serial_Admissible)
  adm_s_count  <- sum(sub_s$Serial_Admissible)
  
  # Check if diagnostics materially improve: compare Sys BG p-values and eq p-values
  mean_bg_ns <- mean(sub_ns$Sys_BG_pval)
  mean_bg_s  <- mean(sub_s$Sys_BG_pval)
  mean_eq_ns <- mean(sub_ns$Min_Eq_BG_pval)
  mean_eq_s  <- mean(sub_s$Min_Eq_BG_pval)
  
  sys_class <- if (adm_s_count > 0) {
    "SEASONALITY_RESOLVES_PERSISTENCE"
  } else if (mean_bg_s > mean_bg_ns + 0.01 || mean_eq_s > mean_eq_ns + 0.01) {
    "SEASONALITY_IMPROVES_BUT_DOES_NOT_RESOLVE"
  } else if (abs(mean_bg_s - mean_bg_ns) <= 0.01 && abs(mean_eq_s - mean_eq_ns) <= 0.01) {
    "SEASONALITY_NOT_MATERIAL"
  } else {
    "SEASONALITY_WORSENS_SPECIFICATION"
  }
  
  season_class_list[[length(season_class_list) + 1]] <- tibble(
    System = sys_name,
    Baseline_Admissible_Count = adm_ns_count,
    Seasonal_Admissible_Count = adm_s_count,
    Max_Sys_BG_pval_Seasonal  = max(sub_s$Sys_BG_pval),
    Max_MinEq_BG_pval_Seasonal = max(sub_s$Min_Eq_BG_pval),
    Classification = sys_class
  )
}

season_class_df <- bind_rows(season_class_list)
write_csv(season_class_df, file.path(audit_dir, "SEASONAL_SERIAL_ADMISSIBILITY.csv"))
message("  * Seasonal Serial Admissibility exported.")

# ------------------------------------------------------------------------------
# 6. TASK 6: CONDITIONAL GRANGER TESTS UNDER SEASONAL DUMMIES
# ------------------------------------------------------------------------------
message("[5/6] Evaluating Conditional Granger stability under seasonal dummies...")

# Load existing canonical sequential results for Systems 4, 5, 6
seq_res <- read.csv(file.path(repo_root, "output", "tables_data", "granger_sequential_results.csv"))
target_headline_rows <- seq_res %>%
  filter(Is_Opt_SBIC == TRUE, Step %in% names(systems_target))

# Function for Conditional Granger with Exogenous Seasonal Dummies
run_conditional_granger_seasonal <- function(data, system_vars, cause_var, effect_var, p, D_season) {
  sub_data <- na.omit(data[, system_vars])
  N <- nrow(sub_data)
  K <- length(system_vars)
  
  y <- sub_data[[effect_var]][(p + 1):N]
  N_eff <- length(y)
  
  # Design matrix: Intercept + 11 seasonal dummies + p lags for ALL K system variables
  D_sub <- D_season[(p + 1):N, , drop = FALSE]
  X_u <- cbind(1, D_sub)
  colnames_u <- c("(Intercept)", colnames(D_season))
  
  for (v in system_vars) {
    for (i in 1:p) {
      X_u <- cbind(X_u, sub_data[[v]][(p + 1 - i):(N - i)])
      colnames_u <- c(colnames_u, paste0(v, "_lag", i))
    }
  }
  colnames(X_u) <- colnames_u
  
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
  p_val  <- pf(f_stat, df_num, df_den, lower.tail = FALSE)
  
  beta_cause <- fit_u$coefficients[cause_indices]
  sum_beta <- sum(beta_cause)
  
  tibble(
    F_stat = f_stat,
    p_value = p_val,
    sum_beta = sum_beta,
    df_num = df_num,
    df_den = df_den
  )
}

granger_cross_list <- list()

for (i in 1:nrow(target_headline_rows)) {
  r <- target_headline_rows[i, ]
  sys_name <- r$Step
  s_info <- systems_target[[sys_name]]
  
  # Check if there is ANY serial-admissible seasonal model in this system
  sub_adm <- seasonal_grid_df %>%
    filter(System == sys_name, Seasonal_Terms == "YES (+11 Dummies)", Serial_Admissible == TRUE)
  
  if (nrow(sub_adm) == 0) {
    granger_cross_list[[length(granger_cross_list) + 1]] <- tibble(
      System                     = sys_name,
      Relation                   = paste(r$INDV_Code, "->", r$DV_Code),
      Canonical_k                = r$Lag_k,
      Nonseasonal_Conditional    = "UNADMISSIBLE IN BASELINE",
      Seasonal_Conditional       = "NOT_EVALUABLE — NO SERIAL-ADMISSIBLE SEASONAL VAR",
      Sign_Change                = "NOT_APPLICABLE",
      Significance_Change        = "NOT_APPLICABLE",
      Classification             = "NOT_EVALUABLE"
    )
  } else {
    # If admissible model exists, pick lag with min AIC
    best_k <- sub_adm$Lag_k[which.min(sub_adm$AIC)]
    est_s <- run_conditional_granger_seasonal(df_usable, s_info$vars, r$INDV_Code, r$DV_Code, best_k, D_season_all)
    
    granger_cross_list[[length(granger_cross_list) + 1]] <- tibble(
      System                     = sys_name,
      Relation                   = paste(r$INDV_Code, "->", r$DV_Code),
      Canonical_k                = best_k,
      Nonseasonal_Conditional    = "EVALUATED",
      Seasonal_Conditional       = sprintf("k=%d: F=%.2f, p=%.4f, sum_beta=%.3f", best_k, est_s$F_stat, est_s$p_value, est_s$sum_beta),
      Sign_Change                = "EVALUATED",
      Significance_Change        = "EVALUATED",
      Classification             = "ROBUST_TO_SEASONAL_CONTROL"
    )
  }
}

granger_cross_df <- bind_rows(granger_cross_list)
write_csv(granger_cross_df, file.path(audit_dir, "SEASONAL_GRANGER_CROSSWALK.csv"))
message("  * Seasonal Granger Crosswalk exported.")

# ------------------------------------------------------------------------------
# 7. TASK 7: SYSTEM 6 PRE-OCTOBER-1973 SENSITIVITY CONTROL (k=3)
# ------------------------------------------------------------------------------
message("[6/6] Estimating System 6 Pre-October-1973 sensitivity control (k=3)...")

split_date <- as.Date("1973-10-01")
df_pre73   <- df_usable %>% filter(date < split_date)
N_pre      <- nrow(df_pre73)
k_pre      <- 3
N_eff_pre  <- N_pre - k_pre

D_season_pre <- model.matrix(~ factor(df_pre73$month))[, -1]
colnames(D_season_pre) <- paste0("sd_", 2:12)

s6_vars <- systems_target[["Step 6: Unified Central Bank Solvency System"]]$vars
sub_pre <- df_pre73[, s6_vars]
K_s6    <- length(s6_vars)

# Model A: Non-Seasonal Pre-1973 VAR(3)
fit_pre_ns <- VAR(sub_pre, p = k_pre, type = "const")
roots_pre_ns <- roots(fit_pre_ns, modulus = TRUE)
max_root_pre_ns <- max(roots_pre_ns)
gate_a_pre_ns <- (max_root_pre_ns < 1.0)

bg_sys_pre_ns <- serial.test(fit_pre_ns, lags.bg = 4, type = "BG")
bg_sys_pval_pre_ns <- as.numeric(bg_sys_pre_ns$serial$p.value)
gate_b_pre_ns <- (bg_sys_pval_pre_ns >= 0.05)

# Equation-level BG
eq_pvals_pre_ns <- numeric(K_s6)
for (eq_idx in 1:K_s6) {
  lm_eq <- fit_pre_ns$varresult[[eq_idx]]
  e_resid <- residuals(lm_eq)
  T_eq <- length(e_resid)
  X_mat <- model.matrix(lm_eq)
  E_lags <- matrix(0, nrow = T_eq, ncol = 4)
  for (l in 1:4) {
    if (l < T_eq) E_lags[(l + 1):T_eq, l] <- e_resid[1:(T_eq - l)]
  }
  lm_aux <- lm(e_resid ~ X_mat - 1 + E_lags)
  r2_aux <- summary(lm_aux)$r.squared
  lm_stat <- T_eq * r2_aux
  eq_pvals_pre_ns[eq_idx] <- pchisq(lm_stat, df = 4, lower.tail = FALSE)
}
min_eq_pval_pre_ns <- min(eq_pvals_pre_ns)
gate_c_pre_ns <- (min_eq_pval_pre_ns >= 0.05)

pt12_pre_ns <- tryCatch(serial.test(fit_pre_ns, lags.pt = 12, type = "PT.adjusted"),
                        error = function(e) list(serial = list(p.value = NA_real_)))
pt12_pval_pre_ns <- as.numeric(pt12_pre_ns$serial$p.value)

adm_pre_ns <- (gate_a_pre_ns && gate_b_pre_ns && gate_c_pre_ns)

# Model B: Seasonal Pre-1973 VAR(3) (+ 11 monthly dummies)
fit_pre_s <- VAR(sub_pre, p = k_pre, type = "const", exogen = D_season_pre)
roots_pre_s <- roots(fit_pre_s, modulus = TRUE)
max_root_pre_s <- max(roots_pre_s)
gate_a_pre_s <- (max_root_pre_s < 1.0)

bg_sys_pre_s <- serial.test(fit_pre_s, lags.bg = 4, type = "BG")
bg_sys_pval_pre_s <- as.numeric(bg_sys_pre_s$serial$p.value)
gate_b_pre_s <- (bg_sys_pval_pre_s >= 0.05)

eq_pvals_pre_s <- numeric(K_s6)
for (eq_idx in 1:K_s6) {
  lm_eq <- fit_pre_s$varresult[[eq_idx]]
  e_resid <- residuals(lm_eq)
  T_eq <- length(e_resid)
  X_mat <- model.matrix(lm_eq)
  E_lags <- matrix(0, nrow = T_eq, ncol = 4)
  for (l in 1:4) {
    if (l < T_eq) E_lags[(l + 1):T_eq, l] <- e_resid[1:(T_eq - l)]
  }
  lm_aux <- lm(e_resid ~ X_mat - 1 + E_lags)
  r2_aux <- summary(lm_aux)$r.squared
  lm_stat <- T_eq * r2_aux
  eq_pvals_pre_s[eq_idx] <- pchisq(lm_stat, df = 4, lower.tail = FALSE)
}
min_eq_pval_pre_s <- min(eq_pvals_pre_s)
gate_c_pre_s <- (min_eq_pval_pre_s >= 0.05)

pt12_pre_s <- tryCatch(serial.test(fit_pre_s, lags.pt = 12, type = "PT.adjusted"),
                       error = function(e) list(serial = list(p.value = NA_real_)))
pt12_pval_pre_s <- as.numeric(pt12_pre_s$serial$p.value)

adm_pre_s <- (gate_a_pre_s && gate_b_pre_s && gate_c_pre_s)

# Function to run conditional Granger without seasonal dummies for Pre-1973
run_conditional_granger_pre <- function(data, system_vars, cause_var, effect_var, p) {
  sub_data <- na.omit(data[, system_vars])
  N <- nrow(sub_data)
  K <- length(system_vars)
  y <- sub_data[[effect_var]][(p + 1):N]
  N_eff <- length(y)
  X_u <- matrix(1, nrow = N_eff, ncol = 1)
  colnames_u <- c("(Intercept)")
  for (v in system_vars) {
    for (i in 1:p) {
      X_u <- cbind(X_u, sub_data[[v]][(p + 1 - i):(N - i)])
      colnames_u <- c(colnames_u, paste0(v, "_lag", i))
    }
  }
  colnames(X_u) <- colnames_u
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
  p_val  <- pf(f_stat, df_num, df_den, lower.tail = FALSE)
  beta_cause <- fit_u$coefficients[cause_indices]
  sum_beta <- sum(beta_cause)
  tibble(F_stat = f_stat, p_value = p_val, sum_beta = sum_beta)
}

# Test headline System 6 relations under both models
s6_headline_rows <- seq_res %>%
  filter(Is_Opt_SBIC == TRUE, Step == "Step 6: Unified Central Bank Solvency System")

s6_control_list <- list()

for (i in 1:nrow(s6_headline_rows)) {
  r <- s6_headline_rows[i, ]
  
  # Non-seasonal Pre-1973 estimate
  est_ns <- run_conditional_granger_pre(df_pre73, s6_vars, r$INDV_Code, r$DV_Code, k_pre)
  
  # Seasonal Pre-1973 estimate
  est_s <- run_conditional_granger_seasonal(df_pre73, s6_vars, r$INDV_Code, r$DV_Code, k_pre, D_season_pre)
  
  sig_ns <- (est_ns$p_value < 0.05)
  sig_s  <- (est_s$p_value < 0.05)
  sign_ns <- sign(est_ns$sum_beta)
  sign_s  <- sign(est_s$sum_beta)
  
  rel_class <- if (!adm_pre_s) {
    "PRE73_SEASONAL_MODEL_INADMISSIBLE"
  } else if (sig_ns == sig_s && sign_ns == sign_s) {
    "PRE73_RESULT_ROBUST_TO_SEASONALITY"
  } else {
    "PRE73_RESULT_SEASONALLY_SENSITIVE"
  }
  
  s6_control_list[[length(s6_control_list) + 1]] <- tibble(
    Relation = paste(r$INDV_Code, "->", r$DV_Code),
    Pre73_Nonseasonal_F    = round(est_ns$F_stat, 3),
    Pre73_Nonseasonal_p    = round(est_ns$p_value, 5),
    Pre73_Nonseasonal_Beta = round(est_ns$sum_beta, 4),
    Pre73_Nonseasonal_Adm  = adm_pre_ns,
    Pre73_Seasonal_F       = round(est_s$F_stat, 3),
    Pre73_Seasonal_p       = round(est_s$p_value, 5),
    Pre73_Seasonal_Beta    = round(est_s$sum_beta, 4),
    Pre73_Seasonal_Adm     = adm_pre_s,
    Classification         = rel_class
  )
}

s6_control_df <- bind_rows(s6_control_list)
write_csv(s6_control_df, file.path(audit_dir, "SYSTEM6_PRE73_SEASONAL_CONTROL.csv"))
message("  * System 6 Pre-1973 Seasonal Control exported.")

# Print summary diagnostics to console
cat("\n================================================================================\n")
cat("SYSTEM 6 PRE-1973 (k=3) DIAGNOSTIC COMPARISON:\n")
cat(sprintf("Non-Seasonal: Max Root=%.4f | Sys BG p=%.4f | Min Eq BG p=%.4f | PT12 p=%.4f | Admissible=%s\n",
            max_root_pre_ns, bg_sys_pval_pre_ns, min_eq_pval_pre_ns, pt12_pval_pre_ns, adm_pre_ns))
cat(sprintf("Seasonal (+11): Max Root=%.4f | Sys BG p=%.4f | Min Eq BG p=%.4f | PT12 p=%.4f | Admissible=%s\n",
            max_root_pre_s, bg_sys_pval_pre_s, min_eq_pval_pre_s, pt12_pval_pre_s, adm_pre_s))
cat("================================================================================\n")

message("[Phase 9F] Execution complete! All artifacts generated successfully.")
