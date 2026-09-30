# SYSTEM 3 LANGUAGE CALIBRATION AUDIT

## 1. Context and Objective
In Section 5.3 (\S\ref{sec:granger_banking}), System 3 deconstructs narrow money ($M1$) into high-powered base money ($H$) and the banking multiplier ($m_t \equiv M1_t / H_t$). 
The directive of Phase 10B is to ensure that System 3 is described strictly as **specification-sensitive** without being pejoratively dismissed as an "artifact" or "spurious".

---

## 2. Before vs. After Text Comparison

### Previous Wording (Phase 10A):
> "Deconstructing narrow money into base money and the banking multiplier ($m_t \equiv M1_t / H_t$) evaluates whether multiplier expansion autonomously preceded inflation. In bivariate pairwise tests ($k=1$), multiplier growth displays no predictive information for price inflation ($F = 0.338, p = 0.5617$). When estimated within a conditional VAR(1) containing base money growth, the predictive link $\Delta \ln m \to \pi$ shifts to marginal significance ($F = 3.896, p = 0.0484$). However, this shift is an artifact of the exact accounting identity $\Delta \ln m_t \equiv g_{M1,t} - g_{H,t}$: conditioning on base money growth mathematically isolates narrow money growth ($g_{M1,t}$), reproducing the commercial credit relationship already documented in System 2. Because System 3 does not capture an independent behavioral mechanism and its statistical significance depends entirely on multivariate conditioning, it is classified as \textsc{Specification-Sensitive} and is not treated as an independent empirical result."

### Calibrated Wording (Phase 10B):
> "Deconstructing narrow money into base money and the banking multiplier ($m_t \equiv M1_t / H_t$) evaluates whether multiplier expansion autonomously preceded inflation. In bivariate pairwise tests ($k=1$), multiplier growth displays no predictive information for price inflation ($F = 0.338, p = 0.5617$). When estimated within a conditional VAR(1) containing base money growth, the predictive link $\Delta \ln m \to \pi$ shifts to marginal statistical significance ($F = 3.896, p = 0.0484$). The multiplier result is sensitive to the conditioning set. Because multiplier growth is algebraically related to narrow-money and base-money growth ($\Delta \ln m_t \equiv g_{M1,t} - g_{H,t}$), conditioning on base money growth mathematically incorporates narrow money dynamics, closely reflecting the commercial credit interaction documented in System~2. Consequently, this specification is treated as a sensitivity check on the banking representation rather than as an independent empirical result, and is classified as \textsc{Specification-Sensitive}."

---

## 3. Prohibited Terms Audit

| Prohibited Expression | Status in Calibrated Text | Replacement Phrasing |
| :--- | :--- | :--- |
| `artifact` / `accounting artifact` | **REMOVED** | "The multiplier result is sensitive to the conditioning set." |
| `spurious` | **REMOVED / ABSENT** | Neutral description of multivariate conditioning sensitivity. |
| `mechanically generated` | **REMOVED / ABSENT** | "algebraically related to narrow-money and base-money growth" |

---

## 4. Methodological Justification
The revised text adheres strictly to academic objectivity and the dissertation's evidence hierarchy:
1. It acknowledges the exact statistical divergence between bivariate ($p = 0.5617$) and conditional ($p = 0.0484$) regressions.
2. It clarifies the algebraic relationship between the three series without claiming the conditional result is invalid or "fake".
3. It frames System 3 constructively as a sensitivity check on the banking sector representation, preventing overstatement while avoiding polemical language.
