suppressPackageStartupMessages({
  library(dplyr)
  library(readr)
})

repo_root <- "c:/ReposGitHub/Chapter3_RPEUP"
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

e_usd <- df_merged$usd_exchange_rate_observed_1960_2026

df_full <- df_merged %>%
  mutate(
    pi_t       = ipc_monthly_var_pct_1928_2026,
    H          = monetary_base_emision_1960_2026,
    g_H        = c(NA, diff(log(H))) * 100,
    g_gold     = c(NA, diff(log(gold_price_usd_oz_1960_2026))) * 100,
    g_e        = c(NA, diff(log(e_usd))) * 100,
    SolvR_H    = (e_usd * IR_usd) / (H * 1000),
    g_SolvR_H  = c(NA, diff(log(SolvR_H))) * 100
  )

sub <- df_full %>% filter(date < as.Date("1973-10-01"))

# Estimate System 6 VAR(3) on pre-Oct73
# Variables: g_SolvR_H, g_gold, g_e, g_H, pi_t
system_vars <- c("g_SolvR_H", "g_gold", "g_e", "g_H", "pi_t")
sub_clean <- na.omit(sub[, c("date", system_vars)])
N <- nrow(sub_clean)
p <- 3
N_eff <- N - p

cat("N_raw =", N, "N_eff =", N_eff, "\n")

# Run regressions for g_H and g_SolvR_H
# Build unrestricted design matrix
X_u <- matrix(1, nrow = N_eff, ncol = 1)
colnames_u <- c("(Intercept)")
for (v in system_vars) {
  for (i in 1:p) {
    X_u <- cbind(X_u, sub_clean[[v]][(p + 1 - i):(N - i)])
    colnames_u <- c(colnames_u, paste0(v, "_lag", i))
  }
}
colnames(X_u) <- colnames_u

# g_H equation
y_gH <- sub_clean$g_H[(p + 1):N]
fit_gH <- lm(y_gH ~ X_u - 1)
cat("\n=== Coefficients for g_H equation ===\n")
s_gH <- summary(fit_gH)
print(s_gH$coefficients[grep("g_SolvR_H", rownames(s_gH$coefficients)), ])

# g_SolvR_H equation
y_solv <- sub_clean$g_SolvR_H[(p + 1):N]
fit_solv <- lm(y_solv ~ X_u - 1)
cat("\n=== Coefficients for g_SolvR_H equation ===\n")
s_solv <- summary(fit_solv)
print(s_solv$coefficients[grep("g_H", rownames(s_solv$coefficients)), ])

# g_e equation
y_ge <- sub_clean$g_e[(p + 1):N]
fit_ge <- lm(y_ge ~ X_u - 1)
cat("\n=== Coefficients for g_e equation ===\n")
s_ge <- summary(fit_ge)
print(s_ge$coefficients[grep("g_SolvR_H", rownames(s_ge$coefficients)), ])
