# ==============================================================================
# PHASE 9C: VAR SERIAL-CORRELATION DIAGNOSTIC TRIAGE
# Replicable R Script for System- and Equation-Level Diagnostics
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
triage_dir <- file.path(repo_root, "paper", "Version7", "audits", "granger_canonicalization", "phase9c_diagnostic_triage")
if (!dir.exists(triage_dir)) dir.create(triage_dir, recursive = TRUE)

bcch_csv <- file.path(repo_root, "data", "monthly_data_set", "bcch_monthly", "bcch_historical_monthly_wide.csv")
imf_csv  <- file.path(repo_root, "data", "monthly_data_set", "imf_data", "dataset_2026-08-31T21_01_52.480676493Z_DEFAULT_INTEGRATION_IMF.STA_IL_13.0.1.csv")

if (!file.exists(bcch_csv)) stop("CRITICAL: BCCh monthly file missing at: ", bcch_csv)
if (!file.exists(imf_csv))  stop("CRITICAL: IMF reserves file missing at: ", imf_csv)

message("[1/5] Ingesting BCCh historical ledgers and IMF international reserve accounts...")
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
       vars = c("pi_t", "g_H"), sample = "full", N = 250, k_star = 3),
  list(step = "Step 2: Banking Bifurcation A (Credit Lead)",
       vars = c("pi_t", "g_M1", "g_H"), sample = "raw66", N = 180, k_star = 1),
  list(step = "Step 3: Banking Bifurcation B (Multiplier Deconstruction)",
       vars = c("pi_t", "g_H", "d_ln_m"), sample = "raw66", N = 180, k_star = 1),
  list(step = "Step 4: Unified Real Dual Economy",
       vars = c("pi_t", "g_H", "d_theta", "g_Manuf", "g_Mining"), sample = "full", N = 250, k_star = 2),
  list(step = "Step 5: Unified External Cost-Push Belt",
       vars = c("g_gold", "g_e", "d_theta", "g_H", "pi_t"), sample = "full", N = 250, k_star = 1),
  list(step = "Step 6: Unified Central Bank Solvency System",
       vars = c("g_SolvR_H", "g_gold", "g_e", "g_H", "pi_t"), sample = "full", N = 250, k_star = 1)
)

# Containers for diagnostic outputs
system_bg_list <- list()
equation_bg_list <- list()
portmanteau_list <- list()
stability_list <- list()
lag_diag_list <- list()

message("[INFO] Running comprehensive VAR diagnostic triage across Steps 1--6...")

for (sys in systems_info) {
  d_sample <- if (sys$sample == "raw66") raw66_df else df_full
  sub_mat <- na.omit(d_sample[, sys$vars])
  K <- length(sys$vars)
  
  v_sel <- VARselect(sub_mat, lag.max = 4, type = "const")
  sc_sel <- unname(v_sel$selection["SC(n)"])
  
  # Check canonical lag match
  if (sc_sel != sys$k_star) {
    stop(sprintf("CRITICAL: SBIC mismatch for %s. Expected k*=%d, got %d", sys$step, sys$k_star, sc_sel))
  }
  
  for (k in 1:4) {
    v_mod <- VAR(sub_mat, p = k, type = "const")
    obs_eff <- v_mod$obs
    num_params_per_eq <- ncol(v_mod$datamat) - K
    total_params <- num_params_per_eq * K
    res_df <- obs_eff - num_params_per_eq
    
    # 1. Multivariate Breusch-Godfrey LM test
    bg_sys <- vars::serial.test(v_mod, lags.bg = 4, type = "BG")
    bg_stat <- as.numeric(bg_sys$serial$statistic)
    bg_df   <- as.numeric(bg_sys$serial$parameter)
    bg_p    <- as.numeric(bg_sys$serial$p.value)
    
    system_bg_list[[length(system_bg_list) + 1]] <- tibble(
      System      = sys$step,
      K           = K,
      Lag_k       = k,
      Is_K_Star   = (k == sys$k_star),
      BG_stat     = round(bg_stat, 3),
      BG_df       = bg_df,
      BG_pval     = round(bg_p, 4),
      BG_pass_5pct = (bg_p >= 0.05)
    )
    
    # 2. Multivariate Portmanteau Tests (Adjusted & Asymptotic)
    pt_lags <- 16
    pt_adj <- tryCatch(vars::serial.test(v_mod, lags.pt = pt_lags, type = "PT.adjusted"),
                       error = function(e) list(serial = list(statistic = NA, parameter = NA, p.value = NA)))
    pt_asymp <- tryCatch(vars::serial.test(v_mod, lags.pt = pt_lags, type = "PT.asymptotic"),
                         error = function(e) list(serial = list(statistic = NA, parameter = NA, p.value = NA)))
    
    portmanteau_list[[length(portmanteau_list) + 1]] <- tibble(
      System          = sys$step,
      K               = K,
      Lag_k           = k,
      Is_K_Star       = (k == sys$k_star),
      PT_lags         = pt_lags,
      PT_adj_stat     = round(as.numeric(pt_adj$serial$statistic), 3),
      PT_adj_df       = as.numeric(pt_adj$serial$parameter),
      PT_adj_pval     = round(as.numeric(pt_adj$serial$p.value), 4),
      PT_adj_pass_5pct = (as.numeric(pt_adj$serial$p.value) >= 0.05),
      PT_asymp_stat   = round(as.numeric(pt_asymp$serial$statistic), 3),
      PT_asymp_df     = as.numeric(pt_asymp$serial$parameter),
      PT_asymp_pval   = round(as.numeric(pt_asymp$serial$p.value), 4)
    )
    
    # 3. Stability check
    r_mod <- roots(v_mod, modulus = TRUE)
    max_r <- max(r_mod)
    stable <- (max_r < 1.0)
    
    stability_list[[length(stability_list) + 1]] <- tibble(
      System      = sys$step,
      K           = K,
      Lag_k       = k,
      Is_K_Star   = (k == sys$k_star),
      Max_Root    = round(max_r, 4),
      Stability   = ifelse(stable, "STABLE", "UNSTABLE")
    )
    
    # 4. Equation-level BG tests
    eq_passes <- TRUE
    eq_pvals <- c()
    for (eq_name in sys$vars) {
      eq_fit <- v_mod$varresult[[eq_name]]
      eq_bg <- bgtest(eq_fit, order = 4, type = "Chisq")
      e_stat <- as.numeric(eq_bg$statistic)
      e_df   <- as.numeric(eq_bg$parameter)
      e_p    <- as.numeric(eq_bg$p.value)
      
      if (e_p < 0.05) eq_passes <- FALSE
      eq_pvals <- c(eq_pvals, e_p)
      
      equation_bg_list[[length(equation_bg_list) + 1]] <- tibble(
        System        = sys$step,
        Equation      = eq_name,
        Lag_k         = k,
        Is_K_Star     = (k == sys$k_star),
        BG_stat       = round(e_stat, 3),
        BG_df         = e_df,
        BG_pval       = round(e_p, 4),
        Pass_5pct     = (e_p >= 0.05)
      )
    }
    
    # 5. Composite Lag Diagnostic Map
    lag_diag_list[[length(lag_diag_list) + 1]] <- tibble(
      System        = sys$step,
      Lag_k         = k,
      Is_K_Star     = (k == sys$k_star),
      SBIC          = round(v_sel$criteria["SC(n)", k], 4),
      Sys_BG_pval   = round(bg_p, 4),
      Sys_BG_pass   = (bg_p >= 0.05),
      All_Eqs_pass  = eq_passes,
      Min_Eq_pval   = round(min(eq_pvals), 4),
      Max_Root      = round(max_r, 4),
      Stability     = ifelse(stable, "STABLE", "UNSTABLE"),
      Obs_Eff       = obs_eff,
      Total_Params  = total_params,
      Resid_DF      = res_df
    )
  }
}

system_bg_df     <- bind_rows(system_bg_list)
equation_bg_df   <- bind_rows(equation_bg_list)
portmanteau_df   <- bind_rows(portmanteau_list)
stability_df     <- bind_rows(stability_list)
lag_diag_df      <- bind_rows(lag_diag_list)

write_csv(system_bg_df,   file.path(triage_dir, "SYSTEM_BG_GRID.csv"))
write_csv(equation_bg_df, file.path(triage_dir, "EQUATION_BG_GRID.csv"))
write_csv(portmanteau_df, file.path(triage_dir, "PORTMANTEAU_GRID.csv"))
write_csv(stability_df,   file.path(triage_dir, "VAR_STABILITY_GRID.csv"))
write_csv(lag_diag_df,    file.path(triage_dir, "DIAGNOSTIC_LAG_COMPARISON.csv"))

message("[SUCCESS] All Phase 9C diagnostic grids generated and saved to: ", triage_dir)
