suppressPackageStartupMessages({library(dplyr); library(vars)})
repo_root <- "c:/ReposGitHub/Chapter3_RPEUP"
bcch_csv <- file.path(repo_root, "data", "monthly_data_set", "bcch_monthly", "bcch_historical_monthly_wide.csv")
df_bcch <- read.csv(bcch_csv, stringsAsFactors = FALSE)
df_bcch$date <- as.Date(df_bcch$date)
df_full <- df_bcch %>%
  filter(date >= as.Date("1966-01-01") & date <= as.Date("1980-12-01")) %>%
  arrange(date) %>%
  mutate(
    pi_t = ipc_monthly_var_pct_1928_2026,
    H    = monetary_base_emision_1960_2026,
    g_H  = c(NA, diff(log(H))) * 100,
    M1   = m1_money_supply_1965_2026,
    g_M1 = c(NA, diff(log(M1))) * 100
  )
sub <- na.omit(df_full[, c("pi_t", "g_M1", "g_H")])

# Pairwise at k=3:
v_pw1 <- VAR(sub[, c("g_H", "g_M1")], p=3, type="const")
cat("=== PAIRWISE at k=3 ===\n")
cat("g_M1 -> g_H:\n")
print(causality(v_pw1, cause="g_M1")$Granger)
cat("sum beta:\n")
print(sum(coef(v_pw1)$g_H[grep("g_M1", rownames(coef(v_pw1)$g_H)), 1]))

cat("\ng_H -> g_M1:\n")
print(causality(v_pw1, cause="g_H")$Granger)
cat("sum beta:\n")
print(sum(coef(v_pw1)$g_M1[grep("g_H", rownames(coef(v_pw1)$g_M1)), 1]))

# Trivariate conditional at k=3:
v_tri <- VAR(sub[, c("pi_t", "g_M1", "g_H")], p=3, type="const")
cat("\n=== TRIVARIATE CONDITIONAL at k=3 ===\n")
cat("g_M1 in g_H eq:\n")
print(causality(v_tri, cause="g_M1")$Granger)
cat("sum beta:\n")
print(sum(coef(v_tri)$g_H[grep("g_M1", rownames(coef(v_tri)$g_H)), 1]))

cat("\ng_H in g_M1 eq:\n")
print(causality(v_tri, cause="g_H")$Granger)
cat("sum beta:\n")
print(sum(coef(v_tri)$g_M1[grep("g_H", rownames(coef(v_tri)$g_M1)), 1]))

cat("\npi_t in g_M1 eq:\n")
print(causality(v_tri, cause="pi_t")$Granger)
cat("sum beta:\n")
print(sum(coef(v_tri)$g_M1[grep("pi_t", rownames(coef(v_tri)$g_M1)), 1]))

cat("\ng_M1 in pi_t eq:\n")
print(causality(v_tri, cause="g_M1")$Granger)
cat("sum beta:\n")
print(sum(coef(v_tri)$pi_t[grep("g_M1", rownames(coef(v_tri)$pi_t)), 1]))
