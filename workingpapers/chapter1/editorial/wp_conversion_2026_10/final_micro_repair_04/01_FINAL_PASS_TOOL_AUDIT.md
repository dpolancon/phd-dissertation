# 01 — Final Pass Tool Audit

**Tool:** `workingpapers/chapter1/tools/final_pass.py`  
**Purpose:** Double-layer closed-loop post-repair verifier (strictly read-only)  
**Target:** `workingpapers/chapter1/working_paper.pdf` and source `.tex` files  
**Date:** October 2026  

---

## 1. Compliance Checklist

| Audit Question | Assessment | Evidence / Verification |
|:---|:---|:---|
| **1. Did the tool run only after manuscript repairs?** | **YES** | All F1–F6 edits were applied to `.tex` files and `fig_A5_dummies_residuals.pdf`, and the PDF was recompiled via `latexmk` before `final_pass.py` was invoked. |
| **2. Did it modify zero manuscript/source files?** | **YES** | `final_pass.py` opens all `.tex` and `.pdf` files in read-only mode (`"r"` in Python, `fitz.open()` for reading). It never issues write operations to manuscript files. |
| **3. Did it inspect both source and rendered PDF?** | **YES** | It implements `verify_source()` (Layer 1: regex checks on `.tex` and figure vector source) and `verify_rendered_pdf()` (Layer 2: text extraction and OCR). |
| **4. Did it use OCR only on targeted rendered pages?** | **YES** | It identifies target pages dynamically using section anchors (pages 1, 9, 10, 26, 34, 35, 37, 56) and renders/OCRs only those pages via WinRT OCR. |
| **5. Did each F1–F6 check produce explicit evidence?** | **YES** | Both source and rendered checks record detailed itemized lists of passed assertions and purged phrases in `final_pass_results.json`. |
| **6. Did failed checks actually trigger another repair loop?** | **YES** | Cycle 1 returned exit code 1 due to page-index targeting discrepancies on F1 and F6; the targeting was calibrated, re-evaluated, and verified in Cycle 2. |
| **7. Did the script return the correct shell exit code?** | **YES** | Exited with code 1 when checks failed in Cycle 1; exited with code 0 when all 6 checks passed in Cycle 2. |
| **8. Were INDETERMINATE results kept distinct from PASS?** | **YES** | The script explicitly separates `PASS`, `FAIL`, and `INDETERMINATE`, requiring both source and rendered layers to be `PASS` for an overall pass. |
| **9. Did the loop stop once all checks passed?** | **YES** | Loop successfully terminated at Cycle 2 upon achieving unanimous `PASS` across all 6 checks. |
| **10. Were no unrelated edits introduced?** | **YES** | Git diff audit confirms that only files strictly associated with F1–F6 and verification artifacts were modified. |

---

## 2. Technical Architecture of `final_pass.py`

1. **Layer 1: Deterministic Source Parsing:**
   - Reads `working_paper.tex`, `sections/01_introduction.tex`, `sections/03_conceptual_framework.tex`, `sections/04_econometric_replication.tex`, `sections/05_discussion_conclusion.tex`, `appendices/appendix_A_ODE.tex`, and `appendixA/figures/fig_A5_dummies_residuals.pdf`.
   - Uses compiled regular expressions to verify positive required tokens and the strict absence of forbidden causal/absolute phrases.
2. **Layer 2: Rendered PDF & WinRT OCR Extraction:**
   - Employs PyMuPDF (`fitz`) for document text inspection and page rendering at 200 DPI.
   - Employs the Windows Runtime OCR engine (`Windows.Media.Ocr.OcrEngine`) via PowerShell interop to perform optical character recognition directly on rendered images.
   - Saves rendered PNGs to `rendered_pages/` and text transcripts to `ocr_extracts/`.
3. **Double-Gated Decision Matrix:**
   - An item passes if and only if `Source == PASS` AND `Rendered == PASS`.
