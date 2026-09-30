# ==============================================================================
# Script: check_sys2_conditional_k3.R
# Purpose: Phase 10C - System 2 Conditional VAR(3) Estimator Alignment
# Author: Dissertation Empirical-Methods & Integration Editor
# ==============================================================================

suppressPackageStartupMessages({
  library(dplyr)
  library(vars)
  library(tibble)
  library(readr)
})

repo_root <- "c:/ReposGitHub/Chapter3_RPEUP"
bcch_csv  <- file.path(repo_root, "data", "monthly_data_set", "bcch_monthly", "bcch_historical_monthly_wide.csv")

if (!file.exists(bcch_csv)) stop("BCCh monthly file missing at: ", bcch_csv)

df_bcch <- read.csv(bcch_csv, stringsAsFactors = FALSE)
df_bcch$date <- as.Date(df_bcch$date)

# Check M1 start date
m1_non_na <- df_bcch[!is.na(df_bcch$m1_money_supply_1965_2026), c("date", "m1_money_supply_1965_2026")]
cat("First M1 observed date:", format(min(m1_non_na$date)), "\n")

# In production sec43 script:
# 1. First merge and calculate diff(log(...)) across full sample
# 2. Then filter date >= 1966-01-01
df_merged <- df_bcch %>%
  filter(date >= as.Date("1960-01-01") & date <= as.Date("1980-12-01")) %>%
  arrange(date)

df_full <- df_merged %>%
  mutate(
    pi_t = ipc_monthly_var_pct_1928_2026,
    H    = monetary_base_emision_1960_2026,
    g_H  = c(NA, diff(log(H))) * 100,
    M1   = m1_money_supply_1965_2026,
    g_M1 = c(NA, diff(log(M1))) * 100
  )

raw66_df <- df_full %>% filter(date >= as.Date("1966-01-01"))

sub <- na.omit(raw66_df[, c("pi_t", "g_M1", "g_H")])
cat("Total observed rows in raw66 (N):", nrow(sub), "\n")
cat("Date range in sub:", format(min(raw66_df$date)), "to", format(max(raw66_df$date)), "\n")

# Estimate Trivariate VAR(3)
v3 <- VAR(sub, p = 3, type = "const")
N_eff <- v3$obs
cat("Effective observations (N_eff):", N_eff, "\n")
cat("VAR order p:", v3$p, "\n")
cat("VAR variables:", colnames(v3$y), "\n\n")

# Inspect datamat and structure of varresult
dat <- as.data.frame(v3$datamat)
cat("Columns in datamat:\n", paste(colnames(dat), collapse = ", "), "\n\n")

# Inspect formula of one equation
cat("Call of g_H equation in v3:\n")
print(v3$varresult$g_H$call)
cat("Coefficients of g_H equation in v3:\n")
print(names(coef(v3$varresult$g_H)))
cat("\n")

# Define the 4 directional hypotheses
hypotheses <- list(
  list(
    relation = "g_M1 -> g_H",
    cause = "g_M1",
    effect = "g_H",
    third = "pi_t",
    lags = c("g_M1.l1", "g_M1.l2", "g_M1.l3")
  ),
  list(
    relation = "g_H -> g_M1",
    cause = "g_H",
    effect = "g_M1",
    third = "pi_t",
    lags = c("g_H.l1", "g_H.l2", "g_H.l3")
  ),
  list(
    relation = "pi_t -> g_M1",
    cause = "pi_t",
    effect = "g_M1",
    third = "g_H",
    lags = c("pi_t.l1", "pi_t.l2", "pi_t.l3")
  ),
  list(
    relation = "g_M1 -> pi_t",
    cause = "g_M1",
    effect = "pi_t",
    third = "g_H",
    lags = c("g_M1.l1", "g_M1.l2", "g_M1.l3")
  )
)

results_list <- list()

for (h in hypotheses) {
  cat("====================================================================\n")
  cat("Testing Direction:", h$relation, "\n")
  cat("Effect Equation:", h$effect, " | Cause:", h$cause, " | Third Variable:", h$third, "\n")
  cat("H0: ", paste(h$lags, collapse = " = "), " = 0\n")
  
  # 1. Unrestricted Model directly from VAR object
  fit_u <- v3$varresult[[h$effect]]
  b_u   <- coef(fit_u)
  V_u   <- vcov(fit_u)
  df2   <- fit_u$df.residual
  df1   <- length(h$lags)
  
  # Method A: Linear restriction Wald / F test on fit_u:
  # R is q x k matrix selecting h$lags
  R <- matrix(0, nrow = df1, ncol = length(b_u))
  colnames(R) <- names(b_u)
  for (i in seq_along(h$lags)) {
    R[i, h$lags[i]] <- 1
  }
  
  Rb <- R %*% b_u
  RVR <- R %*% V_u %*% t(R)
  F_stat_wald <- as.numeric(t(Rb) %*% solve(RVR) %*% Rb) / df1
  p_val_wald  <- pf(F_stat_wald, df1 = df1, df2 = df2, lower.tail = FALSE)
  
  # Method B: Nested OLS estimation
  # Unrestricted formula:
  dep <- h$effect
  rhs_u <- paste(setdiff(names(b_u), "const"), collapse = " + ")
  form_u <- as.formula(paste(dep, "~", rhs_u))
  fit_u_lm <- lm(form_u, data = dat)
  
  # Restricted formula:
  rhs_r <- paste(setdiff(names(b_u), c("const", h$lags)), collapse = " + ")
  form_r <- as.formula(paste(dep, "~", rhs_r))
  fit_r_lm <- lm(form_r, data = dat)
  
  # Nested ANOVA F-test
  anv <- anova(fit_r_lm, fit_u_lm)
  F_stat_anv <- anv$F[2]
  p_val_anv  <- anv$`Pr(>F)`[2]
  
  # Cross-check check:
  cat("F-stat (Linear Restriction):", round(F_stat_wald, 5), "\n")
  cat("F-stat (Nested ANOVA):       ", round(F_stat_anv, 5), "\n")
  cat("Difference between methods:  ", abs(F_stat_wald - F_stat_anv), "\n")
  cat("df1:", df1, " | df2:", df2, " | p-value:", format(p_val_wald, digits = 6, scientific = TRUE), "\n")
  
  # Confirm third variable lags remain in restricted model
  third_lags <- paste0(h$third, ".l", 1:3)
  cat("Third variable lags present in restricted model:", all(third_lags %in% names(coef(fit_r_lm))), "\n")
  
  # Extract coefficients and sum beta
  cf <- b_u[h$lags]
  b1 <- cf[1]
  b2 <- cf[2]
  b3 <- cf[3]
  sum_beta <- sum(cf)
  
  # SE of sum beta: sqrt(c' V c) where c = 1 for the 3 lags
  sub_V <- V_u[h$lags, h$lags]
  se_sum <- sqrt(sum(sub_V))
  t_sum  <- sum_beta / se_sum
  
  cat("Coefficients (beta1, beta2, beta3):", round(b1, 5), round(b2, 5), round(b3, 5), "\n")
  cat("Sum Beta:", round(sum_beta, 5), " | SE(sum):", round(se_sum, 5), " | t(sum):", round(t_sum, 5), "\n\n")
  
  results_list[[length(results_list) + 1]] <- tibble(
    Relation = h$relation,
    Cause = h$cause,
    Effect = h$effect,
    Third_Var = h$third,
    Lag_k = 3,
    N_eff = N_eff,
    df1 = df1,
    df2 = df2,
    F_stat = round(F_stat_wald, 4),
    p_value = p_val_wald,
    beta1 = round(b1, 5),
    beta2 = round(b2, 5),
    beta3 = round(b3, 5),
    sum_beta = round(sum_beta, 5),
    se_sum = round(se_sum, 5),
    t_sum = round(t_sum, 5)
  )
}

df_results <- bind_rows(results_list)

cat("====================================================================\n")
cat("SUMMARY TABLE OF CONDITIONAL VAR(3) RESULTS:\n")
print(as.data.frame(df_results))

# Save results CSV
out_csv <- file.path(repo_root, "paper", "Version7", "audits", "final_editing", "phase10c_sys2_alignment", "SYSTEM2_CONDITIONAL_VAR3.csv")
write_csv(df_results, out_csv)
cat("\nSaved conditional results to:", out_csv, "\n")
