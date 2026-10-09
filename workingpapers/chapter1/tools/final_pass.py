#!/usr/bin/env python3
"""
final_pass.py -- Read-Only Double-Layer Post-Repair Verifier (Version 1.2)
Closed-loop verification of F1-F6 regression tests + G1-G3 reader guards + H1-H5 micro-repairs on Chapter 1 working paper.
STRICTLY READ-ONLY: Never modifies manuscript source files or rendered outputs.
"""

import os
import sys
import json
import re
import subprocess
from datetime import datetime
import fitz  # PyMuPDF

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
WP_DIR = os.path.abspath(os.path.join(SCRIPT_DIR, ".."))
PDF_PATH = os.path.join(WP_DIR, "working_paper.pdf")

OUTPUT_DIR = os.path.join(
    WP_DIR,
    "editorial",
    "wp_conversion_2026_10",
    "final_h_repair_06",
    "final_pass"
)
RENDER_DIR = os.path.join(OUTPUT_DIR, "rendered_pages")
OCR_DIR = os.path.join(OUTPUT_DIR, "ocr_extracts")

os.makedirs(OUTPUT_DIR, exist_ok=True)
os.makedirs(RENDER_DIR, exist_ok=True)
os.makedirs(OCR_DIR, exist_ok=True)


def normalize_text(text: str) -> str:
    """Normalize whitespace, line breaks, minus signs, dashes, and quotes."""
    if not text:
        return ""
    text = text.replace("\u2212", "-")  # Unicode minus sign
    text = text.replace("\u2013", "-").replace("\u2014", "-")  # en-dash, em-dash
    text = text.replace("\u2018", "'").replace("\u2019", "'")  # curly quotes
    text = text.replace("\u201c", '"').replace("\u201d", '"')
    text = text.replace("\u00a0", " ")  # non-breaking space
    text = re.sub(r"\s+", " ", text)
    return text


def run_winrt_ocr(png_path: str) -> str:
    """Run Windows Runtime OCR engine on a rendered PNG image via PowerShell."""
    abs_img = os.path.abspath(png_path).replace("\\", "\\\\")
    ps_cmd = f"""
    Add-Type -AssemblyName System.Runtime.WindowsRuntime
    $null = [Windows.Globalization.Language, Windows.Foundation.UniversalApiContract, ContentType=WindowsRuntime]
    $null = [Windows.Media.Ocr.OcrEngine, Windows.Foundation.UniversalApiContract, ContentType=WindowsRuntime]
    $null = [Windows.Graphics.Imaging.BitmapDecoder, Windows.Foundation.UniversalApiContract, ContentType=WindowsRuntime]
    $null = [Windows.Storage.StorageFile, Windows.Foundation.UniversalApiContract, ContentType=WindowsRuntime]

    $asTaskGeneric = [System.WindowsRuntimeSystemExtensions].GetMethods() | Where-Object {{
        $_.Name -eq 'AsTask' -and $_.GetParameters().Count -eq 1 -and $_.GetParameters()[0].ParameterType.Name -eq 'IAsyncOperation`1'
    }}

    function Await-Async($asyncOp, $type) {{
        $m = $asTaskGeneric.MakeGenericMethod($type)
        $task = $m.Invoke($null, @($asyncOp))
        $task.Wait()
        return $task.Result
    }}

    $imgPath = '{abs_img}'
    $storageFile = Await-Async ([Windows.Storage.StorageFile]::GetFileFromPathAsync($imgPath)) ([Windows.Storage.StorageFile])
    $stream = Await-Async ($storageFile.OpenAsync([Windows.Storage.FileAccessMode]::Read)) ([Windows.Storage.Streams.IRandomAccessStream])
    $decoder = Await-Async ([Windows.Graphics.Imaging.BitmapDecoder]::CreateAsync($stream)) ([Windows.Graphics.Imaging.BitmapDecoder])
    $bitmap = Await-Async ($decoder.GetSoftwareBitmapAsync()) ([Windows.Graphics.Imaging.SoftwareBitmap])

    $engine = [Windows.Media.Ocr.OcrEngine]::TryCreateFromUserProfileLanguages()
    if (-not $engine) {{
        $engine = [Windows.Media.Ocr.OcrEngine]::TryCreateFromLanguage([Windows.Globalization.Language]::new('en-US'))
    }}
    $ocrResult = Await-Async ($engine.RecognizeAsync($bitmap)) ([Windows.Media.Ocr.OcrResult])
    Write-Output $ocrResult.Text
    """
    try:
        proc = subprocess.run(
            ["powershell", "-NoProfile", "-ExecutionPolicy", "Bypass", "-Command", ps_cmd],
            capture_output=True,
            text=True,
            encoding="utf-8",
            errors="ignore",
            timeout=30
        )
        if proc.returncode == 0:
            return proc.stdout.strip()
    except Exception:
        pass
    return ""


# ============================================================
# LAYER 1: SOURCE-LAYER VERIFICATION
# ============================================================

def verify_source() -> dict:
    results = {}

    # File paths
    f_main = os.path.join(WP_DIR, "working_paper.tex")
    f_intro = os.path.join(WP_DIR, "sections", "01_introduction.tex")
    f_concept = os.path.join(WP_DIR, "sections", "03_conceptual_framework.tex")
    f_repl = os.path.join(WP_DIR, "sections", "04_econometric_replication.tex")
    f_disc = os.path.join(WP_DIR, "sections", "05_discussion_conclusion.tex")
    f_ode = os.path.join(WP_DIR, "appendices", "appendix_A_ODE.tex")
    f_app_b = os.path.join(WP_DIR, "appendices", "appendix_B_data_diagnostics.tex")
    f_fig_a5 = os.path.join(WP_DIR, "appendixA", "figures", "fig_A5_dummies_residuals.pdf")

    with open(f_main, "r", encoding="utf-8") as f:
        c_main = f.read()
    with open(f_intro, "r", encoding="utf-8") as f:
        c_intro = f.read()
    with open(f_concept, "r", encoding="utf-8") as f:
        c_concept = f.read()
    with open(f_repl, "r", encoding="utf-8") as f:
        c_repl = f.read()
    with open(f_disc, "r", encoding="utf-8") as f:
        c_disc = f.read()
    with open(f_ode, "r", encoding="utf-8") as f:
        c_ode = f.read()
    with open(f_app_b, "r", encoding="utf-8") as f:
        c_app_b = f.read()

    # --- F1: Capital-Growth Notation Consistency (REGRESSION TEST) ---
    f1_ev = []
    f1_pass = True
    f1_forbidden_matches = []
    f1_matched_required = []

    if re.search(r"\\hat\{k\}\s*\\equiv\s*\\dot\{K\}/K\s*-\s*\\delta", c_concept) or \
       re.search(r"\\hat\{k\}\s*\\equiv\s*\\dot\{K\}/K\s*-\s*\\delta", c_ode):
        f1_pass = False
        f1_ev.append("FAIL: Found forbidden definition \\hat{k} \\equiv \\dot{K}/K - \\delta")
        f1_forbidden_matches.append(r"\hat{k} \equiv \dot{K}/K - \delta")
    else:
        f1_ev.append("PASS: No forbidden \\hat{k} \\equiv \\dot{K}/K - \\delta definition found.")

    if r"\hat{k} \equiv \dot{K}/K" in c_concept and r"\hat{k} \equiv \dot{K}/K" in c_ode:
        f1_ev.append("PASS: Governing definition \\hat{k} \\equiv \\dot{K}/K present in both Section 3.3 and Appendix A.")
        f1_matched_required.append(r"\hat{k} \equiv \dot{K}/K")
    else:
        f1_pass = False
        f1_ev.append("FAIL: Governing definition \\hat{k} \\equiv \\dot{K}/K missing in Section 3.3 or Appendix A.")

    if r"I/K = \hat{k} + \delta" in c_concept or r"\hat{k} + \delta = I/K" in c_ode:
        f1_ev.append("PASS: Gross investment identity I/K = \\hat{k} + \\delta preserved.")
        f1_matched_required.append(r"I/K = \hat{k} + \delta")
    else:
        f1_pass = False
        f1_ev.append("FAIL: Gross investment identity missing.")

    results["F1"] = {
        "status": "PASS" if f1_pass else "FAIL",
        "evidence": f1_ev,
        "sections": ["Section 3.3", "Appendix A"],
        "matched_required": f1_matched_required,
        "forbidden_matches": f1_forbidden_matches
    }

    # --- F2: Residual No-Dummy Absolute Claim (REGRESSION TEST) ---
    f2_ev = []
    f2_pass = True
    f2_forbidden_matches = []
    f2_matched_required = []

    forbidden_f2 = [
        "models omitting these controls yield nonstationary residuals",
        "restoring stationary errors requires these step controls"
    ]
    for fb in forbidden_f2:
        if fb.lower() in c_repl.lower():
            f2_pass = False
            f2_ev.append(f"FAIL: Found forbidden absolute claim '{fb}'")
            f2_forbidden_matches.append(fb)
        else:
            f2_ev.append(f"PASS: Absolved from forbidden phrase '{fb}'")

    if "eight no-dummy Case-II specifications" in c_repl or "eight no-dummy" in c_repl:
        f2_ev.append("PASS: Acknowledges 8 no-dummy Case-II surviving models.")
        f2_matched_required.append("eight no-dummy Case-II specifications")
    else:
        f2_pass = False
        f2_ev.append("FAIL: Missing quantification of the eight no-dummy Case-II models.")

    results["F2"] = {
        "status": "PASS" if f2_pass else "FAIL",
        "evidence": f2_ev,
        "sections": ["Section 4.5"],
        "matched_required": f2_matched_required,
        "forbidden_matches": f2_forbidden_matches
    }

    # --- F3: Attempted vs Estimated Bivariate S2 Language (REGRESSION TEST) ---
    f3_ev = []
    f3_pass = True
    f3_forbidden_matches = []
    f3_matched_required = []

    forbidden_f3 = "fails to cointegrate across all 48 attempted"
    for label, text in [("Abstract", c_main), ("Intro", c_intro), ("Replication", c_repl), ("Conclusion", c_disc)]:
        if forbidden_f3 in text.lower():
            f3_pass = False
            f3_ev.append(f"FAIL: Found uncalibrated phrase in {label}: '{forbidden_f3}'")
            f3_forbidden_matches.append(f"{label}: {forbidden_f3}")
        else:
            f3_ev.append(f"PASS: {label} does not contain '{forbidden_f3}'.")

    if "48 attempted" in c_main and "36 are successfully estimated" in c_main:
        f3_ev.append("PASS: Abstract distinguishes 48 attempted and 36 successfully estimated.")
        f3_matched_required.append("Abstract: 48 attempted / 36 estimated")
    else:
        f3_pass = False
        f3_ev.append("FAIL: Abstract missing explicit 48 attempted vs 36 estimated distinction.")

    if "48 attempted" in c_disc and "36 are successfully estimated" in c_disc:
        f3_ev.append("PASS: Conclusion distinguishes 48 attempted and 36 successfully estimated.")
        f3_matched_required.append("Conclusion: 48 attempted / 36 estimated")
    else:
        f3_pass = False
        f3_ev.append("FAIL: Conclusion missing explicit 48 attempted vs 36 estimated distinction.")

    results["F3"] = {
        "status": "PASS" if f3_pass else "FAIL",
        "evidence": f3_ev,
        "sections": ["Abstract", "Introduction", "Section 4.6", "Conclusion"],
        "matched_required": f3_matched_required,
        "forbidden_matches": f3_forbidden_matches
    }

    # --- F4: Residual Causal Mechanism Language (REGRESSION TEST) ---
    f4_ev = []
    f4_pass = True
    f4_forbidden_matches = []
    f4_matched_required = []

    forbidden_f4 = [
        "causing bivariate cointegration tests to fail",
        "accounts for these distributionally mediated shifts",
        "causing bivariate cointegration to break down"
    ]
    for fb in forbidden_f4:
        if fb.lower() in c_repl.lower() or fb.lower() in c_disc.lower():
            f4_pass = False
            f4_ev.append(f"FAIL: Found forbidden causal phrase: '{fb}'")
            f4_forbidden_matches.append(fb)
        else:
            f4_ev.append(f"PASS: Purged forbidden causal phrase: '{fb}'")

    if "does not identify that mechanism causally" in c_repl and "does not identify that mechanism causally" in c_disc:
        f4_ev.append("PASS: Calibrated non-causal qualification present in Section 4.6 and Discussion.")
        f4_matched_required.append("does not identify that mechanism causally")
    else:
        f4_pass = False
        f4_ev.append("FAIL: Missing required non-causal qualification statement.")

    results["F4"] = {
        "status": "PASS" if f4_pass else "FAIL",
        "evidence": f4_ev,
        "sections": ["Section 4.6", "Discussion"],
        "matched_required": f4_matched_required,
        "forbidden_matches": f4_forbidden_matches
    }

    # --- F5: Pre-2008 Sample-Sensitivity Causality (REGRESSION TEST) ---
    f5_ev = []
    f5_pass = True
    f5_forbidden_matches = []
    f5_matched_required = []

    forbidden_f5 = [
        "causes bivariate cointegration to break down",
        "adding the four years of the great recession (2008--2011) disrupts this relation",
        "adding the great recession breaks the relation"
    ]
    for fb in forbidden_f5:
        if fb.lower() in c_repl.lower() or fb.lower() in c_disc.lower():
            f5_pass = False
            f5_ev.append(f"FAIL: Found forbidden causal sample phrase: '{fb}'")
            f5_forbidden_matches.append(fb)
        else:
            f5_ev.append(f"PASS: Purged forbidden causal sample phrase: '{fb}'")

    if "coincides with inclusion of the great recession" in c_repl.lower() or "coinciding with the acute contraction" in c_disc.lower():
        f5_ev.append("PASS: Frame pre-2008 contrast as sample sensitivity and historical coincidence.")
        f5_matched_required.append("sample sensitivity / coincidence framing")
    else:
        f5_pass = False
        f5_ev.append("FAIL: Missing coincidence/sample sensitivity phrasing.")

    results["F5"] = {
        "status": "PASS" if f5_pass else "FAIL",
        "evidence": f5_ev,
        "sections": ["Section 4.7", "Discussion"],
        "matched_required": f5_matched_required,
        "forbidden_matches": f5_forbidden_matches
    }

    # --- F6: Figure 21 Pulse Legend (REGRESSION TEST) ---
    f6_ev = []
    f6_pass = True
    f6_forbidden_matches = []
    f6_matched_required = []

    try:
        doc_fig = fitz.open(f_fig_a5)
        text_fig = doc_fig[0].get_text("text")
        doc_fig.close()
        if "D_56" in text_fig or "D_74" in text_fig or "D_80" in text_fig:
            f6_pass = False
            f6_ev.append("FAIL: Figure 21 vector source contains forbidden D_56/D_74/D_80 labels.")
            f6_forbidden_matches.append("D_56/D_74/D_80 in fig_A5_dummies_residuals.pdf")
        else:
            f6_ev.append("PASS: Figure 21 vector source does not contain D_56/D_74/D_80.")

        if "P_56" in text_fig and "P_74" in text_fig and "P_80" in text_fig:
            f6_ev.append("PASS: Figure 21 vector source contains correct P_56, P_74, P_80 legend labels.")
            f6_matched_required.append("P_56, P_74, P_80 in fig_A5_dummies_residuals.pdf")
        else:
            f6_pass = False
            f6_ev.append("FAIL: Figure 21 vector source missing P_56, P_74, P_80 legend labels.")
    except Exception as e:
        f6_pass = False
        f6_ev.append(f"FAIL: Could not inspect Figure 21 PDF source: {e}")

    results["F6"] = {
        "status": "PASS" if f6_pass else "FAIL",
        "evidence": f6_ev,
        "sections": ["Appendix A Figure 21"],
        "matched_required": f6_matched_required,
        "forbidden_matches": f6_forbidden_matches
    }

    # --- G1: Scope Qualification of S2 System-Level Claims (READER GUARD) ---
    g1_ev = []
    g1_pass = True
    g1_forbidden_matches = []
    g1_matched_required = []

    # Check 1: Abstract qualifier
    if "Within the tested full-sample system grid, long-run system stability becomes recoverable only when" in c_main:
        g1_ev.append("PASS: Abstract qualifies system stability claim with 'Within the tested full-sample system grid'.")
        g1_matched_required.append("Abstract: Within the tested full-sample system grid")
    else:
        g1_pass = False
        g1_ev.append("FAIL: Abstract missing empirical scope qualification for system stability claim.")

    # Check 2: Intro qualifiers
    if "Within the tested bivariate specifications, aggregate output and capital stock do not form an empirically self-sufficient" in c_intro:
        g1_ev.append("PASS: Introduction qualifies bivariate non-self-sufficiency claim.")
        g1_matched_required.append("Intro: Within the tested bivariate specifications")
    else:
        g1_pass = False
        g1_ev.append("FAIL: Introduction missing empirical scope qualification for bivariate self-sufficiency.")

    if "Within the tested full-sample system grid, long-run system stability becomes recoverable only when" in c_intro:
        g1_ev.append("PASS: Introduction qualifies system stability claim with 'Within the tested full-sample system grid'.")
        g1_matched_required.append("Intro: Within the tested full-sample system grid")
    else:
        g1_pass = False
        g1_ev.append("FAIL: Introduction missing empirical scope qualification for system stability.")

    # Check 3: Section 4.1 summary
    if "Within the tested full-sample system grid, the output--capital relation achieves system stability only within a trivariate framework" in c_repl:
        g1_ev.append("PASS: Section 4.1 qualifies trivariate stability claim with 'Within the tested full-sample system grid'.")
        g1_matched_required.append("Section 4.1: Within the tested full-sample system grid")
    else:
        g1_pass = False
        g1_ev.append("FAIL: Section 4.1 missing empirical scope qualification.")

    # Check 4: Table 2
    if "within the tested system grid" in c_repl and "survives when distribution enters explicitly within the tested system grid" in c_repl:
        g1_ev.append("PASS: Table 2 qualifies S2 Trivariate interpretive cell with 'within the tested system grid'.")
        g1_matched_required.append("Table 2: within the tested system grid")
    else:
        g1_pass = False
        g1_ev.append("FAIL: Table 2 missing empirical scope qualification for S2 Trivariate.")

    # Check 5: Section 4.6 opening & step controls
    if "Within the tested specification space, this breakdown demonstrates that capital accumulation and output cannot sustain" in c_repl and \
       "In the tested system grid, long-run system stability becomes recoverable only when" in c_repl:
        g1_ev.append("PASS: Section 4.6 qualifies capital accumulation trajectory and system stability in S2 opening.")
        g1_matched_required.append("Section 4.6 opening: Within the tested specification space / In the tested system grid")
    else:
        g1_pass = False
        g1_ev.append("FAIL: Section 4.6 missing qualification in S2 opening paragraph.")

    if "Within the tested trivariate models, historical step controls" in c_repl:
        g1_ev.append("PASS: Section 4.6 qualifies step controls necessity with 'Within the tested trivariate models'.")
        g1_matched_required.append("Section 4.6: Within the tested trivariate models")
    else:
        g1_pass = False
        g1_ev.append("FAIL: Section 4.6 missing qualification on historical step controls claim.")

    # Check 6: Discussion & Conclusion
    if "within the tested full-sample system grid, long-run stability becomes recoverable only when" in c_disc:
        g1_ev.append("PASS: Discussion qualifies system stability with 'within the tested full-sample system grid'.")
        g1_matched_required.append("Discussion: within the tested full-sample system grid")
    else:
        g1_pass = False
        g1_ev.append("FAIL: Discussion missing empirical scope qualification.")

    if "Within the tested full-sample system grid, cointegration becomes recoverable only when" in c_disc:
        g1_ev.append("PASS: Conclusion qualifies cointegration recoverability with 'Within the tested full-sample system grid'.")
        g1_matched_required.append("Conclusion: Within the tested full-sample system grid")
    else:
        g1_pass = False
        g1_ev.append("FAIL: Conclusion missing empirical scope qualification.")

    # Forbidden universal checks
    forbidden_g1 = [
        "survives exclusively when distribution enters explicitly",
        "Historical step controls ($S_{1956}, S_{1974}, S_{1980}$) are essential for establishing system-level cointegration. Cointegration holds only"
    ]
    for fb in forbidden_g1:
        if fb in c_repl:
            g1_pass = False
            g1_ev.append(f"FAIL: Found unqualified claim '{fb}'.")
            g1_forbidden_matches.append(fb)
        else:
            g1_ev.append(f"PASS: Absolved from unqualified phrase '{fb[:50]}...'.")

    results["G1"] = {
        "status": "PASS" if g1_pass else "FAIL",
        "evidence": g1_ev,
        "sections": ["Abstract", "Introduction", "Section 4.1", "Table 2", "Section 4.6", "Discussion", "Conclusion"],
        "matched_required": g1_matched_required,
        "forbidden_matches": g1_forbidden_matches
    }

    # --- G2: Reserve-Army Interpretation Calibration (READER GUARD) ---
    g2_ev = []
    g2_pass = True
    g2_forbidden_matches = []
    g2_matched_required = []

    forbidden_g2 = [
        "reflects a reserve-army feedback: when the economy operates above normal capacity",
        "labor market tightening dampens the exploitation rate, raising the wage share. When excess capacity develops, unemployment relieves wage pressure, restoring the exploitation rate"
    ]
    for fb in forbidden_g2:
        if fb in c_repl:
            g2_pass = False
            g2_ev.append(f"FAIL: Found unqualified causal reserve-army claim: '{fb[:60]}...'")
            g2_forbidden_matches.append(fb)
        else:
            g2_ev.append("PASS: Absolved from direct causal reserve-army claims.")

    if "Renormalizing on \\ln e_t yields a coefficient of -0.050" in c_repl or "Renormalizing on $\\ln e_t$ yields a coefficient of -0.050" in c_repl or "Renormalizing on $\\ln e_t$ yields a coefficient of $-0.050$" in c_repl:
        g2_ev.append("PASS: Renormalized coefficient -0.050 explicitly stated.")
        g2_matched_required.append("Renormalizing on ln e_t yields a coefficient of -0.050")
    else:
        g2_pass = False
        g2_ev.append("FAIL: Missing explicit statement of renormalized coefficient -0.050.")

    if "I interpret this negative association as consistent with a reserve-army mechanism" in c_repl:
        g2_ev.append("PASS: Interpretive framing 'consistent with a reserve-army mechanism' present.")
        g2_matched_required.append("consistent with a reserve-army mechanism")
    else:
        g2_pass = False
        g2_ev.append("FAIL: Missing required interpretive framing 'consistent with a reserve-army mechanism'.")

    if "A classical reserve-army interpretation would connect this pattern to labor-market tightening and wage pressure, but the VECM does not identify that causal mechanism directly" in c_repl:
        g2_ev.append("PASS: Causal boundary 'VECM does not identify that causal mechanism directly' present.")
        g2_matched_required.append("VECM does not identify that causal mechanism directly")
    else:
        g2_pass = False
        g2_ev.append("FAIL: Missing explicit causal boundary for reserve-army interpretation.")

    results["G2"] = {
        "status": "PASS" if g2_pass else "FAIL",
        "evidence": g2_ev,
        "sections": ["Section 4.6"],
        "matched_required": g2_matched_required,
        "forbidden_matches": g2_forbidden_matches
    }

    # --- G3: Residual Diagnostic and Johansen Inference Calibration (READER GUARD) ---
    g3_ev = []
    g3_pass = True
    g3_forbidden_matches = []
    g3_matched_required = []

    # G3A: BG LM(4)
    forbidden_g3a = "does not invalidate the superconsistent Johansen ML estimates"
    if forbidden_g3a in c_repl:
        g3_pass = False
        g3_ev.append(f"FAIL: Found forbidden overstatement '{forbidden_g3a}'.")
        g3_forbidden_matches.append(forbidden_g3a)
    else:
        g3_ev.append(f"PASS: Purged forbidden overstatement '{forbidden_g3a}'.")

    if "60.81" in c_repl and "0.006" in c_repl and "residual serial dependence at lag 4" in c_repl:
        g3_ev.append("PASS: BG LM(4) = 60.81 (p=0.006) reports residual serial dependence at lag 4.")
        g3_matched_required.append("BG LM(4) = 60.81 (p=0.006) residual serial dependence")
    else:
        g3_pass = False
        g3_ev.append("FAIL: Missing explicit reporting of BG LM(4) serial dependence.")

    if "While this diagnostic limitation does not by itself overturn the estimated rank-one cointegrating relation" in c_repl and \
       "weakens conventional finite-sample inference and reflects incomplete residual whitening" in c_repl:
        g3_ev.append("PASS: BG LM(4) calibrated as finite-sample diagnostic limitation without overturning rank-one result.")
        g3_matched_required.append("diagnostic limitation / weakens conventional finite-sample inference")
    else:
        g3_pass = False
        g3_ev.append("FAIL: Missing calibrated diagnostic limitation phrasing for BG LM(4).")

    # G3B: Bivariate Nonstationarity Phrasing
    forbidden_g3b = "Residuals remain non-stationary ($I(1)$)"
    if forbidden_g3b in c_repl:
        g3_pass = False
        g3_ev.append(f"FAIL: Found imprecise phrasing '{forbidden_g3b}'.")
        g3_forbidden_matches.append(forbidden_g3b)
    else:
        g3_ev.append(f"PASS: Absolved from imprecise residual nonstationarity claim '{forbidden_g3b}'.")

    if "none of the 36 successfully estimated bivariate systems identifies a stationary cointegrating vector under the Johansen rank tests" in c_repl:
        g3_ev.append("PASS: Precise statement that none of 36 estimated bivariate systems identifies a stationary cointegrating vector under Johansen rank tests.")
        g3_matched_required.append("36 estimated bivariate systems fail stationary cointegrating vector under Johansen")
    else:
        g3_pass = False
        g3_ev.append("FAIL: Missing precise Johansen rank vector statement for 36 bivariate systems.")

    results["G3"] = {
        "status": "PASS" if g3_pass else "FAIL",
        "evidence": g3_ev,
        "sections": ["Section 4.6"],
        "matched_required": g3_matched_required,
        "forbidden_matches": g3_forbidden_matches
    }

    # --- H1: ARDL/PSS Bounds-Test Inference Language (MICRO-REPAIR) ---
    h1_ev = []
    h1_pass = True
    h1_forbidden_matches = []
    h1_matched_required = []

    forbidden_h1 = [
        "the residuals remain nonstationary ($i(1)$), rendering any derived capacity path econometrically invalid",
        "confirming that the output--capital relation yields stationary residuals",
        "an admissible specification is one that produces stationary residuals",
        "its residuals contain a unit root"
    ]
    for fb in forbidden_h1:
        if fb in c_repl.lower():
            h1_pass = False
            h1_ev.append(f"FAIL: Found forbidden residual stationarity language in Section 4: '{fb}'")
            h1_forbidden_matches.append(fb)
        else:
            h1_ev.append(f"PASS: Source purged of '{fb[:40]}...'.")

    req_h1_repl = [
        "does not provide sufficient evidence of a long-run levels relationship",
        "null of no long-run levels relationship is rejected",
        "establishes a statistically confirmed long-run levels relationship",
        "without a long-run restoring attractor"
    ]
    for rq in req_h1_repl:
        if rq in c_repl.lower():
            h1_ev.append(f"PASS: Found required levels-relationship phrasing '{rq}'.")
            h1_matched_required.append(rq)
        else:
            h1_pass = False
            h1_ev.append(f"FAIL: Missing required levels-relationship phrasing '{rq}'.")

    results["H1"] = {
        "status": "PASS" if h1_pass else "FAIL",
        "evidence": h1_ev,
        "sections": ["Section 4.1", "Section 4.3"],
        "matched_required": h1_matched_required,
        "forbidden_matches": h1_forbidden_matches
    }

    # --- H2: Residual VECM Non-Stationary Residuals Language (MICRO-REPAIR) ---
    h2_ev = []
    h2_pass = True
    h2_forbidden_matches = []
    h2_matched_required = []

    forbidden_h2 = [
        "residuals exhibit persistent non-stationary drift",
        "bivariate system yields non-stationary residuals"
    ]
    for fb in forbidden_h2:
        if fb in c_intro.lower():
            h2_pass = False
            h2_ev.append(f"FAIL: Found forbidden VECM residual language in Intro: '{fb}'")
            h2_forbidden_matches.append(f"Intro: {fb}")
        elif fb in c_repl.lower():
            h2_pass = False
            h2_ev.append(f"FAIL: Found forbidden VECM residual language in Section 4.6: '{fb}'")
            h2_forbidden_matches.append(f"Section 4.6: {fb}")
        else:
            h2_ev.append(f"PASS: Purged forbidden VECM residual phrasing '{fb}'.")

    if "no stationary long-run cointegrating combination is identified" in c_intro.lower():
        h2_ev.append("PASS: Introduction confirms 'no stationary long-run cointegrating combination is identified'.")
        h2_matched_required.append("Intro: no stationary long-run cointegrating combination is identified")
    else:
        h2_pass = False
        h2_ev.append("FAIL: Introduction missing stationary cointegrating combination phrasing.")

    if "because no stationary bivariate cointegrating vector is identified over the full post-war sample" in c_repl.lower():
        h2_ev.append("PASS: Section 4.6 confirms 'Because no stationary bivariate cointegrating vector is identified'.")
        h2_matched_required.append("Section 4.6: Because no stationary bivariate cointegrating vector is identified")
    else:
        h2_pass = False
        h2_ev.append("FAIL: Section 4.6 missing stationary bivariate cointegrating vector statement.")

    results["H2"] = {
        "status": "PASS" if h2_pass else "FAIL",
        "evidence": h2_ev,
        "sections": ["Introduction", "Section 4.6"],
        "matched_required": h2_matched_required,
        "forbidden_matches": h2_forbidden_matches
    }

    # --- H3: Alpha_k Adjustment Inference (MICRO-REPAIR) ---
    h3_ev = []
    h3_pass = True
    h3_forbidden_matches = []
    h3_matched_required = []

    forbidden_h3 = [
        "indicating that capital accumulation does not adjust to eliminate cointegrating disequilibrium",
        "the finding that capital accumulation does not adjust to eliminate cointegrating disequilibrium"
    ]
    for fb in forbidden_h3:
        if fb in c_repl.lower() or fb in c_disc.lower():
            h3_pass = False
            h3_ev.append(f"FAIL: Found unhedged capital non-adjustment claim: '{fb}'")
            h3_forbidden_matches.append(fb)
        else:
            h3_ev.append(f"PASS: Purged unhedged capital non-adjustment phrasing '{fb[:40]}...'.")

    req_h3 = [
        "providing no statistically detectable evidence of error-correction adjustment through the capital equation",
        "estimated error correction is heavily concentrated in the exploitation equation",
        "absence of statistically detectable error-correction adjustment in capital accumulation"
    ]
    for rq in req_h3:
        if rq in c_repl.lower() or rq in c_disc.lower():
            h3_ev.append(f"PASS: Found calibrated alpha_k adjustment statement '{rq[:45]}...'.")
            h3_matched_required.append(rq)
        else:
            h3_pass = False
            h3_ev.append(f"FAIL: Missing calibrated alpha_k statement '{rq}'.")

    results["H3"] = {
        "status": "PASS" if h3_pass else "FAIL",
        "evidence": h3_ev,
        "sections": ["Section 4.6", "Discussion"],
        "matched_required": h3_matched_required,
        "forbidden_matches": h3_forbidden_matches
    }

    # --- H4: Profit-Rate Decomposition Logic (MICRO-REPAIR) ---
    h4_ev = []
    h4_pass = True
    h4_forbidden_matches = []
    h4_matched_required = []

    forbidden_h4 = [
        "tolerating chronic excess capacity",
        "counteracted by intensifying exploitation (raising $\\pi_t$) or tolerating chronic excess capacity"
    ]
    for fb in forbidden_h4:
        if fb.lower() in c_disc.lower():
            h4_pass = False
            h4_ev.append(f"FAIL: Found flawed profit-rate decomposition assertion: '{fb}'")
            h4_forbidden_matches.append(fb)
        else:
            h4_ev.append(f"PASS: Purged flawed excess capacity offset assertion '{fb[:40]}...'.")

    req_h4 = [
        "placing downward pressure on $y^p_t / k_t$ and, conditional on distribution, on potential profitability",
        "a higher profit share ($\\pi_t$) can partly offset this pressure in the realized profit rate",
        "utilization below normal capacity ($\\mu_t < 1$) further depresses realized profitability"
    ]
    for rq in req_h4:
        if rq.lower() in c_disc.lower():
            h4_ev.append(f"PASS: Found harmonized decomposition statement '{rq[:45]}...'.")
            h4_matched_required.append(rq)
        else:
            h4_pass = False
            h4_ev.append(f"FAIL: Missing harmonized decomposition statement '{rq}'.")

    results["H4"] = {
        "status": "PASS" if h4_pass else "FAIL",
        "evidence": h4_ev,
        "sections": ["Discussion"],
        "matched_required": h4_matched_required,
        "forbidden_matches": h4_forbidden_matches
    }

    # --- H5: Figure 14 Numerical-Caption Inconsistency (MICRO-REPAIR) ---
    h5_ev = []
    h5_pass = True
    h5_forbidden_matches = []
    h5_matched_required = []

    forbidden_h5 = [
        "horizontal line marks critical value (3.29%).}"
    ]
    for fb in forbidden_h5:
        if fb in c_app_b.lower():
            h5_pass = False
            h5_ev.append("FAIL: Appendix B contains single-line uncalibrated Figure 14 caption.")
            h5_forbidden_matches.append(fb)
        else:
            h5_ev.append("PASS: Purged ambiguous Figure 14 caption.")

    req_h5 = [
        "solid horizontal line indicates the corporate retirement rate",
        "dashed horizontal line marks the critical depletion threshold",
        "\\rho_{\\text{corp}} = 1/35 \\approx 2.86\\%",
        "z^* \\approx 3.29\\%"
    ]
    for rq in req_h5:
        if rq.lower() in c_app_b.lower():
            h5_ev.append(f"PASS: Appendix B Figure 14 caption confirms '{rq}'.")
            h5_matched_required.append(rq)
        else:
            h5_pass = False
            h5_ev.append(f"FAIL: Appendix B Figure 14 caption missing '{rq}'.")

    results["H5"] = {
        "status": "PASS" if h5_pass else "FAIL",
        "evidence": h5_ev,
        "sections": ["Appendix B Figure 14"],
        "matched_required": h5_matched_required,
        "forbidden_matches": h5_forbidden_matches
    }

    return results


# ============================================================
# LAYER 2: RENDERED-PDF VERIFICATION
# ============================================================

def verify_rendered_pdf() -> dict:
    results = {}
    check_keys = ["F1", "F2", "F3", "F4", "F5", "F6", "G1", "G2", "G3", "H1", "H2", "H3", "H4", "H5"]
    if not os.path.exists(PDF_PATH):
        for k in check_keys:
            results[k] = {
                "status": "FAIL",
                "evidence": [f"FAIL: PDF not found at {PDF_PATH}"],
                "matched_required": [],
                "forbidden_matches": ["PDF file missing"],
                "page_numbers": []
            }
        return results

    doc = fitz.open(PDF_PATH)
    total_pages = len(doc)

    def find_pages(pattern):
        found = []
        for i in range(total_pages):
            txt = normalize_text(doc[i].get_text("text"))
            if re.search(pattern, txt, re.IGNORECASE):
                found.append(i + 1)
        return found

    # Locate target pages dynamically
    pages_f1 = sorted(list(set(find_pages(r"governing the acceleration of") + find_pages(r"Figure 1\.")))) or [9, 10]
    pages_f2 = find_pages(r"Of the 102") or find_pages(r"Information-criterion neighborhoods") or [26]
    pages_f3_abs = [1]
    pages_f3_conc = find_pages(r"Third, system-level estimation \(Stage S2\)") or [37]
    pages_f4 = find_pages(r"choice-of-technique framework formalized by Kurz") or [34]
    pages_f5 = find_pages(r"Re-estimating the grid over Shaikh's pre-crisis") or [35]
    pages_f6 = find_pages(r"Figure 21\. Squared residuals") or find_pages(r"Squared residual") or [56]

    pages_g1_abs = [1]
    pages_g1_intro = sorted(list(set(find_pages(r"Within the tested bivariate specifications") + find_pages(r"Within the tested full-sample system grid")))) or [2, 3]
    pages_g1_tbl2 = find_pages(r"survives when distribution enters explicitly within the tested system grid") or [12]
    pages_g1_repl = sorted(list(set(
        find_pages(r"Within the tested specification space") +
        find_pages(r"Within the tested trivariate models") +
        find_pages(r"within the tested system grid, the output")
    ))) or [28, 29, 32]
    pages_g1_disc = find_pages(r"within the tested full-sample system grid, long-run stability") or [36]
    pages_g1_conc = find_pages(r"Within the tested full-sample system grid, cointegration becomes") or [37]

    pages_g2 = sorted(list(set(find_pages(r"Renormalizing on") + find_pages(r"consistent with a reserve-army mechanism")))) or [29, 30]
    pages_g3 = sorted(list(set(find_pages(r"Breusch-Godfrey LM\(4\)") + find_pages(r"residual serial") + find_pages(r"weakens conventional finite-sample")))) or [29, 30]

    # H pages
    pages_h1 = sorted(list(set(
        find_pages(r"If the statistic does not exceed the relevant upper bound") +
        find_pages(r"establishes a statistically confirmed long-run levels relationship") +
        find_pages(r"The Admissibility Strategy") +
        find_pages(r"restoring attractor")
    ))) or [13, 14, 20, 21]

    pages_h2 = sorted(list(set(
        pages_g1_intro +
        find_pages(r"Because no stationary bivariate cointegrating vector is identified")
    ))) or [2, 3, 28]

    pages_h3 = sorted(list(set(
        find_pages(r"providing no statistically detectable evidence of error-correction adjustment") +
        find_pages(r"absence of statistically detectable error-correction adjustment")
    ))) or [29, 30, 36]

    pages_h4 = sorted(list(set(
        find_pages(r"placing downward pressure on") +
        find_pages(r"further depresses realized profitability")
    ))) or [36]

    pages_h5 = sorted(list(set(
        find_pages(r"Depreciation and retirement rates under BEA 1993") +
        find_pages(r"corporate retirement rate")
    ))) or [46, 47, 48]

    target_page_set = set(
        pages_f1 + pages_f2 + pages_f3_abs + pages_f3_conc + pages_f4 + pages_f5 + pages_f6 +
        pages_g1_abs + pages_g1_intro + pages_g1_tbl2 + pages_g1_repl + pages_g1_disc + pages_g1_conc +
        pages_g2 + pages_g3 +
        pages_h1 + pages_h2 + pages_h3 + pages_h4 + pages_h5
    )

    rendered_text = {}
    ocr_text = {}
    for p_num in sorted(target_page_set):
        page = doc[p_num - 1]
        raw_txt = normalize_text(page.get_text("text"))
        rendered_text[p_num] = raw_txt

        png_path = os.path.join(RENDER_DIR, f"page_{p_num:02d}.png")
        pix = page.get_pixmap(dpi=200)
        pix.save(png_path)

        ocr_out = run_winrt_ocr(png_path)
        ocr_norm = normalize_text(ocr_out)
        ocr_text[p_num] = ocr_norm

        txt_path = os.path.join(OCR_DIR, f"page_{p_num:02d}_ocr.txt")
        with open(txt_path, "w", encoding="utf-8") as f:
            f.write(ocr_norm)

    doc.close()

    # --- Rendered F1 (REGRESSION TEST) ---
    f1_ev = []
    f1_pass = True
    f1_forb = []
    f1_req = []
    txt_f1 = " ".join([rendered_text.get(p, "") for p in pages_f1])

    if re.search(r"acceleration of the net growth rate of the capital stock", txt_f1, re.IGNORECASE):
        f1_ev.append("PASS: Rendered text contains 'acceleration of the net growth rate of the capital stock'.")
        f1_req.append("acceleration of the net growth rate of the capital stock")
    else:
        f1_pass = False
        f1_ev.append("FAIL: Rendered text missing 'acceleration of the net growth rate of the capital stock'.")

    if re.search(r"K/K\s*-\s*\u03b4", txt_f1) or re.search(r"K/K\s*-\s*delta", txt_f1):
        f1_pass = False
        f1_ev.append("FAIL: Rendered text contains forbidden 'K/K - delta' in net accumulation definition.")
        f1_forb.append("K/K - delta")
    else:
        f1_ev.append("PASS: Rendered text does not contain '- delta' in capital growth definition.")

    if re.search(r"k\s*\*\s*=\s*0", txt_f1) and re.search(r"stable stagnation", txt_f1, re.IGNORECASE):
        f1_ev.append("PASS: Figure 1 identifies k* = 0 as stable stagnation attractor.")
        f1_req.append("k* = 0 stable stagnation attractor")
    else:
        f1_pass = False
        f1_ev.append("FAIL: Figure 1 missing stable stagnation at k* = 0.")

    results["F1"] = {
        "status": "PASS" if f1_pass else "FAIL",
        "evidence": f1_ev,
        "matched_required": f1_req,
        "forbidden_matches": f1_forb,
        "page_numbers": pages_f1
    }

    # --- Rendered F2 (REGRESSION TEST) ---
    f2_ev = []
    f2_pass = True
    f2_forb = []
    f2_req = []
    txt_f2 = " ".join([rendered_text.get(p, "") for p in pages_f2])

    if "eight no-dummy Case-II specifications" in txt_f2 or "8 no-dummy" in txt_f2 or "eight no-dummy" in txt_f2:
        f2_ev.append("PASS: Rendered text quantifies eight no-dummy Case-II specifications.")
        f2_req.append("eight no-dummy Case-II specifications")
    else:
        f2_pass = False
        f2_ev.append("FAIL: Rendered text missing quantification of eight no-dummy Case-II specifications.")

    if "models omitting these controls yield nonstationary residuals" in txt_f2.lower() or \
       "restoring stationary errors requires these step controls" in txt_f2.lower():
        f2_pass = False
        f2_ev.append("FAIL: Rendered text still contains absolute nonstationarity/requirement claims.")
        f2_forb.append("absolute nonstationarity claims")
    else:
        f2_ev.append("PASS: Rendered text purged of absolute nonstationarity claims.")

    results["F2"] = {
        "status": "PASS" if f2_pass else "FAIL",
        "evidence": f2_ev,
        "matched_required": f2_req,
        "forbidden_matches": f2_forb,
        "page_numbers": pages_f2
    }

    # --- Rendered F3 (REGRESSION TEST) ---
    f3_ev = []
    f3_pass = True
    f3_forb = []
    f3_req = []
    txt_abs = rendered_text.get(1, "")
    txt_conc = " ".join([rendered_text.get(p, "") for p in pages_f3_conc])

    if "fails to cointegrate across all 48 attempted" in txt_abs.lower():
        f3_pass = False
        f3_ev.append("FAIL: Abstract still contains 'fails to cointegrate across all 48 attempted'.")
        f3_forb.append("fails to cointegrate across all 48 attempted")
    else:
        f3_ev.append("PASS: Abstract does not contain uncalibrated 'fails across all 48 attempted'.")

    if "48 attempted" in txt_abs.lower() and "36 are successfully estimated" in txt_abs.lower():
        f3_ev.append("PASS: Abstract explicitly distinguishes 48 attempted and 36 successfully estimated.")
        f3_req.append("Abstract: 48 attempted / 36 estimated")
    else:
        f3_pass = False
        f3_ev.append("FAIL: Abstract missing 48 attempted vs 36 estimated distinction.")

    if "48 attempted" in txt_conc.lower() and "36 are successfully estimated" in txt_conc.lower():
        f3_ev.append("PASS: Conclusion explicitly distinguishes 48 attempted and 36 successfully estimated.")
        f3_req.append("Conclusion: 48 attempted / 36 estimated")
    else:
        f3_pass = False
        f3_ev.append("FAIL: Conclusion missing 48 attempted vs 36 estimated distinction.")

    results["F3"] = {
        "status": "PASS" if f3_pass else "FAIL",
        "evidence": f3_ev,
        "matched_required": f3_req,
        "forbidden_matches": f3_forb,
        "page_numbers": [1] + pages_f3_conc
    }

    # --- Rendered F4 (REGRESSION TEST) ---
    f4_ev = []
    f4_pass = True
    f4_forb = []
    f4_req = []
    txt_f4 = " ".join([rendered_text.get(p, "") for p in pages_f4])

    forbidden_r_f4 = [
        "causing bivariate cointegration tests to fail",
        "accounts for these distributionally mediated shifts"
    ]
    for fb in forbidden_r_f4:
        if fb.lower() in txt_f4.lower():
            f4_pass = False
            f4_ev.append(f"FAIL: Rendered text contains '{fb}'.")
            f4_forb.append(fb)
        else:
            f4_ev.append(f"PASS: Rendered text does not contain '{fb}'.")

    if "does not identify that mechanism causally" in txt_f4.lower():
        f4_ev.append("PASS: Rendered text confirms calibrated non-causal mechanism language.")
        f4_req.append("does not identify that mechanism causally")
    else:
        f4_pass = False
        f4_ev.append("FAIL: Rendered text missing non-causal qualification in Section 4.6.")

    results["F4"] = {
        "status": "PASS" if f4_pass else "FAIL",
        "evidence": f4_ev,
        "matched_required": f4_req,
        "forbidden_matches": f4_forb,
        "page_numbers": pages_f4
    }

    # --- Rendered F5 (REGRESSION TEST) ---
    f5_ev = []
    f5_pass = True
    f5_forb = []
    f5_req = []
    txt_f5 = " ".join([rendered_text.get(p, "") for p in pages_f5])

    forbidden_r_f5 = [
        "causes bivariate cointegration to break down",
        "adding the four years of the great recession (2008--2011) disrupts this relation",
        "adding the great recession breaks the relation"
    ]
    for fb in forbidden_r_f5:
        if fb.lower() in txt_f5.lower():
            f5_pass = False
            f5_ev.append(f"FAIL: Rendered text contains '{fb}'.")
            f5_forb.append(fb)
        else:
            f5_ev.append(f"PASS: Rendered text does not contain '{fb}'.")

    if "sample sensitivity" in txt_f5.lower() or "coincides with inclusion of the great recession" in txt_f5.lower() or "coinciding with the acute contraction" in txt_f5.lower():
        f5_ev.append("PASS: Rendered text frames pre-2008 contrast as sample sensitivity.")
        f5_req.append("pre-2008 sample sensitivity")
    else:
        f5_pass = False
        f5_ev.append("FAIL: Rendered text missing pre-2008 sample sensitivity framing.")

    results["F5"] = {
        "status": "PASS" if f5_pass else "FAIL",
        "evidence": f5_ev,
        "matched_required": f5_req,
        "forbidden_matches": f5_forb,
        "page_numbers": pages_f5
    }

    # --- Rendered F6 (REGRESSION TEST) ---
    f6_ev = []
    f6_pass = True
    f6_forb = []
    f6_req = []
    p_fig21 = pages_f6[0] if pages_f6 else 56
    txt_f6 = rendered_text.get(p_fig21, "")
    ocr_f6 = ocr_text.get(p_fig21, "")

    if "D_56" in txt_f6 or "D_74" in txt_f6 or "D_80" in txt_f6 or \
       "D_56" in ocr_f6 or "D_74" in ocr_f6 or "D_80" in ocr_f6:
        f6_pass = False
        f6_ev.append(f"FAIL: Rendered text or OCR contains forbidden D_56/D_74/D_80 on page {p_fig21}.")
        f6_forb.append("D_56/D_74/D_80 in rendered text/OCR")
    else:
        f6_ev.append("PASS: Rendered text does not contain D_56/D_74/D_80.")

    if ("P_56" in txt_f6 and "P_74" in txt_f6 and "P_80" in txt_f6) or \
       ("P56" in ocr_f6 and "P74" in ocr_f6 and "P80" in ocr_f6) or \
       ("P_56" in ocr_f6 and "P_74" in ocr_f6 and "P_80" in ocr_f6):
        f6_ev.append("PASS: Rendered text / OCR confirms P_56, P_74, P_80 legend labels on page.")
        f6_req.append("P_56, P_74, P_80 legend labels confirmed")
    else:
        f6_pass = False
        f6_ev.append(f"FAIL: Rendered text / OCR missing confirmed P_56, P_74, P_80 legend labels on page {p_fig21}.")

    results["F6"] = {
        "status": "PASS" if f6_pass else "FAIL",
        "evidence": f6_ev,
        "matched_required": f6_req,
        "forbidden_matches": f6_forb,
        "page_numbers": [p_fig21]
    }

    # --- Rendered G1: Scope Qualification (READER GUARD) ---
    g1_ev = []
    g1_pass = True
    g1_forb = []
    g1_req = []

    # Check Abstract rendered
    if "within the tested full-sample system grid, long-run system stability becomes recoverable only when" in txt_abs.lower():
        g1_ev.append("PASS: Rendered Abstract contains 'Within the tested full-sample system grid'.")
        g1_req.append("Abstract: Within the tested full-sample system grid")
    else:
        g1_pass = False
        g1_ev.append("FAIL: Rendered Abstract missing 'Within the tested full-sample system grid'.")

    # Check Intro rendered
    txt_intro = " ".join([rendered_text.get(p, "") for p in pages_g1_intro])
    if "within the tested bivariate specifications, aggregate output and capital stock do not form an empirically self-sufficient" in txt_intro.lower():
        g1_ev.append("PASS: Rendered Introduction contains 'Within the tested bivariate specifications'.")
        g1_req.append("Intro: Within the tested bivariate specifications")
    else:
        g1_pass = False
        g1_ev.append("FAIL: Rendered Introduction missing 'Within the tested bivariate specifications'.")

    if "within the tested full-sample system grid, long-run system stability becomes recoverable" in txt_intro.lower():
        g1_ev.append("PASS: Rendered Introduction contains 'Within the tested full-sample system grid'.")
        g1_req.append("Intro: Within the tested full-sample system grid")
    else:
        g1_pass = False
        g1_ev.append("FAIL: Rendered Introduction missing 'Within the tested full-sample system grid'.")

    # Check Table 2 rendered
    txt_tbl2 = " ".join([rendered_text.get(p, "") for p in pages_g1_tbl2])
    if "within the tested system grid" in txt_tbl2.lower():
        g1_ev.append("PASS: Rendered Table 2 contains 'within the tested system grid'.")
        g1_req.append("Table 2: within the tested system grid")
    else:
        g1_pass = False
        g1_ev.append("FAIL: Rendered Table 2 missing 'within the tested system grid'.")

    # Check Replication Section 4.6 rendered
    txt_repl_g1 = " ".join([rendered_text.get(p, "") for p in pages_g1_repl])
    if "within the tested specification space" in txt_repl_g1.lower() and "in the tested system grid" in txt_repl_g1.lower():
        g1_ev.append("PASS: Rendered Section 4.6 contains 'Within the tested specification space / In the tested system grid'.")
        g1_req.append("Section 4.6: Within the tested specification space / In the tested system grid")
    else:
        g1_pass = False
        g1_ev.append("FAIL: Rendered Section 4.6 missing scope qualification in S2 opening.")

    if "within the tested trivariate models, historical step controls" in txt_repl_g1.lower():
        g1_ev.append("PASS: Rendered Section 4.6 contains 'Within the tested trivariate models'.")
        g1_req.append("Section 4.6: Within the tested trivariate models")
    else:
        g1_pass = False
        g1_ev.append("FAIL: Rendered Section 4.6 missing 'Within the tested trivariate models' qualifier.")

    # Check Discussion & Conclusion rendered
    txt_disc = " ".join([rendered_text.get(p, "") for p in pages_g1_disc])
    if "within the tested full-sample system grid, long-run stability becomes recoverable only when" in txt_disc.lower():
        g1_ev.append("PASS: Rendered Discussion contains 'within the tested full-sample system grid'.")
        g1_req.append("Discussion: within the tested full-sample system grid")
    else:
        g1_pass = False
        g1_ev.append("FAIL: Rendered Discussion missing 'within the tested full-sample system grid'.")

    txt_conc_g1 = " ".join([rendered_text.get(p, "") for p in pages_g1_conc])
    if "within the tested full-sample system grid, cointegration becomes recoverable only when" in txt_conc_g1.lower():
        g1_ev.append("PASS: Rendered Conclusion contains 'Within the tested full-sample system grid'.")
        g1_req.append("Conclusion: Within the tested full-sample system grid")
    else:
        g1_pass = False
        g1_ev.append("FAIL: Rendered Conclusion missing 'Within the tested full-sample system grid'.")

    results["G1"] = {
        "status": "PASS" if g1_pass else "FAIL",
        "evidence": g1_ev,
        "matched_required": g1_req,
        "forbidden_matches": g1_forb,
        "page_numbers": sorted(list(set(pages_g1_abs + pages_g1_intro + pages_g1_tbl2 + pages_g1_repl + pages_g1_disc + pages_g1_conc)))
    }

    # --- Rendered G2: Reserve-Army Calibration (READER GUARD) ---
    g2_ev = []
    g2_pass = True
    g2_forb = []
    g2_req = []
    txt_g2 = " ".join([rendered_text.get(p, "") for p in pages_g2])

    if "reflects a reserve-army feedback" in txt_g2.lower():
        g2_pass = False
        g2_ev.append("FAIL: Rendered text contains unqualified 'reflects a reserve-army feedback'.")
        g2_forb.append("reflects a reserve-army feedback")
    else:
        g2_ev.append("PASS: Rendered text purged of direct 'reflects a reserve-army feedback'.")

    if "labor market tightening dampens the exploitation rate" in txt_g2.lower():
        g2_pass = False
        g2_ev.append("FAIL: Rendered text contains unhedged causal 'labor market tightening dampens the exploitation rate'.")
        g2_forb.append("labor market tightening dampens the exploitation rate")
    else:
        g2_ev.append("PASS: Rendered text purged of unhedged causal bargaining assertions.")

    if "consistent with a reserve-army mechanism" in txt_g2.lower():
        g2_ev.append("PASS: Rendered text confirms 'consistent with a reserve-army mechanism'.")
        g2_req.append("consistent with a reserve-army mechanism")
    else:
        g2_pass = False
        g2_ev.append("FAIL: Rendered text missing 'consistent with a reserve-army mechanism'.")

    if "does not identify that causal mechanism directly" in txt_g2.lower():
        g2_ev.append("PASS: Rendered text confirms 'VECM does not identify that causal mechanism directly'.")
        g2_req.append("does not identify that causal mechanism directly")
    else:
        g2_pass = False
        g2_ev.append("FAIL: Rendered text missing explicit non-causal boundary in reserve-army paragraph.")

    results["G2"] = {
        "status": "PASS" if g2_pass else "FAIL",
        "evidence": g2_ev,
        "matched_required": g2_req,
        "forbidden_matches": g2_forb,
        "page_numbers": pages_g2
    }

    # --- Rendered G3: Diagnostics and Inference Calibration (READER GUARD) ---
    g3_ev = []
    g3_pass = True
    g3_forb = []
    g3_req = []
    txt_g3 = " ".join([rendered_text.get(p, "") for p in pages_g3])

    # G3A
    if "does not invalidate the superconsistent johansen ml estimates" in txt_g3.lower():
        g3_pass = False
        g3_ev.append("FAIL: Rendered text contains forbidden 'does not invalidate the superconsistent Johansen ML estimates'.")
        g3_forb.append("does not invalidate the superconsistent Johansen ML estimates")
    else:
        g3_ev.append("PASS: Rendered text does not overstate superconsistency.")

    if "breusch-godfrey lm(4) statistic is 60.81" in txt_g3.lower() and "residual serial" in txt_g3.lower() and "dependence at lag 4" in txt_g3.lower():
        g3_ev.append("PASS: Rendered text confirms BG LM(4) = 60.81 and residual serial dependence at lag 4.")
        g3_req.append("BG LM(4) = 60.81 residual serial dependence at lag 4")
    else:
        g3_pass = False
        g3_ev.append("FAIL: Rendered text missing BG LM(4) serial dependence reporting.")

    if "does not by itself overturn" in txt_g3.lower() and \
       "weakens conventional finite-sample inference" in txt_g3.lower():
        g3_ev.append("PASS: Rendered text confirms diagnostic limitation weakens conventional finite-sample inference.")
        g3_req.append("weakens conventional finite-sample inference")
    else:
        g3_pass = False
        g3_ev.append("FAIL: Rendered text missing finite-sample inference qualification.")

    # G3B
    if "residuals remain non-stationary (i(1))" in txt_repl_g1.lower() or "residuals remain non-stationary (i(1))" in txt_g3.lower():
        g3_pass = False
        g3_ev.append("FAIL: Rendered text contains forbidden 'residuals remain non-stationary (I(1))'.")
        g3_forb.append("residuals remain non-stationary (I(1))")
    else:
        g3_ev.append("PASS: Rendered text does not contain imprecise residual nonstationarity claim.")

    if "none of the 36 successfully estimated bivariate systems identifies a stationary cointegrating vector under the johansen rank tests" in txt_repl_g1.lower() or \
       "none of the 36 successfully estimated bivariate systems identifies a stationary cointegrating vector under the johansen rank tests" in txt_g3.lower():
        g3_ev.append("PASS: Rendered text confirms precise statement that none of 36 bivariate systems identifies stationary cointegrating vector.")
        g3_req.append("none of 36 bivariate systems identifies stationary cointegrating vector")
    else:
        g3_pass = False
        g3_ev.append("FAIL: Rendered text missing precise Johansen rank vector statement.")

    results["G3"] = {
        "status": "PASS" if g3_pass else "FAIL",
        "evidence": g3_ev,
        "matched_required": g3_req,
        "forbidden_matches": g3_forb,
        "page_numbers": pages_g3
    }

    # --- Rendered H1: ARDL/PSS Bounds-Test Inference Language (MICRO-REPAIR) ---
    h1_ev = []
    h1_pass = True
    h1_forb = []
    h1_req = []
    txt_h1 = " ".join([rendered_text.get(p, "") for p in pages_h1])

    forbidden_r_h1 = [
        "the residuals remain nonstationary (i(1))",
        "yields stationary residuals",
        "an admissible specification is one that produces stationary residuals",
        "its residuals contain a unit root"
    ]
    for fb in forbidden_r_h1:
        if fb in txt_h1.lower():
            h1_pass = False
            h1_ev.append(f"FAIL: Rendered text contains forbidden residual stationarity language: '{fb}'")
            h1_forb.append(fb)
        else:
            h1_ev.append(f"PASS: Rendered text does not contain '{fb}'.")

    req_r_h1 = [
        "does not provide sufficient evidence of a long-run levels relationship",
        "null of no long-run levels relationship is rejected",
        "establishes a statistically confirmed long-run levels relationship",
        "without a long-run restoring attractor"
    ]
    for rq in req_r_h1:
        if rq in txt_h1.lower():
            h1_ev.append(f"PASS: Rendered text confirms required levels-relationship phrasing: '{rq}'.")
            h1_req.append(rq)
        else:
            h1_pass = False
            h1_ev.append(f"FAIL: Rendered text missing required levels-relationship phrasing: '{rq}'.")

    results["H1"] = {
        "status": "PASS" if h1_pass else "FAIL",
        "evidence": h1_ev,
        "matched_required": h1_req,
        "forbidden_matches": h1_forb,
        "page_numbers": pages_h1
    }

    # --- Rendered H2: VECM Non-Stationary Residuals Language (MICRO-REPAIR) ---
    h2_ev = []
    h2_pass = True
    h2_forb = []
    h2_req = []
    txt_h2 = " ".join([rendered_text.get(p, "") for p in pages_h2])

    forbidden_r_h2 = [
        "residuals exhibit persistent non-stationary drift",
        "bivariate system yields non-stationary residuals"
    ]
    for fb in forbidden_r_h2:
        if fb in txt_h2.lower():
            h2_pass = False
            h2_ev.append(f"FAIL: Rendered text contains forbidden VECM residual phrasing: '{fb}'")
            h2_forb.append(fb)
        else:
            h2_ev.append(f"PASS: Rendered text does not contain '{fb}'.")

    if "no stationary long-run cointegrating combination is identified" in txt_h2.lower():
        h2_ev.append("PASS: Rendered Introduction confirms 'no stationary long-run cointegrating combination is identified'.")
        h2_req.append("Intro: no stationary long-run cointegrating combination is identified")
    else:
        h2_pass = False
        h2_ev.append("FAIL: Rendered Introduction missing stationary cointegrating combination phrasing.")

    if "because no stationary bivariate cointegrating vector is identified" in txt_h2.lower():
        h2_ev.append("PASS: Rendered Section 4.6 confirms 'Because no stationary bivariate cointegrating vector is identified'.")
        h2_req.append("Section 4.6: Because no stationary bivariate cointegrating vector is identified")
    else:
        h2_pass = False
        h2_ev.append("FAIL: Rendered Section 4.6 missing stationary bivariate cointegrating vector phrasing.")

    results["H2"] = {
        "status": "PASS" if h2_pass else "FAIL",
        "evidence": h2_ev,
        "matched_required": h2_req,
        "forbidden_matches": h2_forb,
        "page_numbers": pages_h2
    }

    # --- Rendered H3: Alpha_k Adjustment Inference (MICRO-REPAIR) ---
    h3_ev = []
    h3_pass = True
    h3_forb = []
    h3_req = []
    txt_h3 = " ".join([rendered_text.get(p, "") for p in pages_h3])

    forbidden_r_h3 = [
        "indicating that capital accumulation does not adjust to eliminate cointegrating disequilibrium",
        "the finding that capital accumulation does not adjust to eliminate cointegrating disequilibrium"
    ]
    for fb in forbidden_r_h3:
        if fb in txt_h3.lower():
            h3_pass = False
            h3_ev.append(f"FAIL: Rendered text contains unhedged capital non-adjustment claim: '{fb}'")
            h3_forb.append(fb)
        else:
            h3_ev.append(f"PASS: Rendered text does not contain '{fb[:40]}...'.")

    req_r_h3 = [
        "providing no statistically detectable evidence of error-correction adjustment",
        "estimated error correction is heavily concentrated in the exploitation equation",
        "absence of statistically detectable error-correction adjustment in capital accumulation"
    ]
    for rq in req_r_h3:
        if rq in txt_h3.lower():
            h3_ev.append(f"PASS: Rendered text confirms calibrated alpha_k phrasing: '{rq[:40]}...'.")
            h3_req.append(rq)
        else:
            h3_pass = False
            h3_ev.append(f"FAIL: Rendered text missing calibrated alpha_k phrasing: '{rq}'.")

    results["H3"] = {
        "status": "PASS" if h3_pass else "FAIL",
        "evidence": h3_ev,
        "matched_required": h3_req,
        "forbidden_matches": h3_forb,
        "page_numbers": pages_h3
    }

    # --- Rendered H4: Profit-Rate Decomposition Logic (MICRO-REPAIR) ---
    h4_ev = []
    h4_pass = True
    h4_forb = []
    h4_req = []
    txt_h4 = " ".join([rendered_text.get(p, "") for p in pages_h4])

    forbidden_r_h4 = [
        "tolerating chronic excess capacity"
    ]
    for fb in forbidden_r_h4:
        if fb in txt_h4.lower():
            h4_pass = False
            h4_ev.append(f"FAIL: Rendered text contains flawed assertion: '{fb}'")
            h4_forb.append(fb)
        else:
            h4_ev.append(f"PASS: Rendered text does not contain '{fb}'.")

    req_r_h4 = [
        "downward pressure on y pt / kt",
        "higher profit share",
        "utilization below normal capacity"
    ]
    # KaTeX / math rendering check for Y^p_t / K_t
    has_math_ratio = ("downward pressure on" in txt_h4.lower() and "potential profitability" in txt_h4.lower())
    if has_math_ratio:
        h4_ev.append("PASS: Rendered text confirms downward pressure on capacity-capital ratio and potential profitability.")
        h4_req.append("downward pressure on capacity-capital ratio and potential profitability")
    else:
        h4_pass = False
        h4_ev.append("FAIL: Rendered text missing downward pressure on capacity-capital ratio.")

    if "higher profit share" in txt_h4.lower() and "partly offset" in txt_h4.lower():
        h4_ev.append("PASS: Rendered text confirms higher profit share can partly offset pressure.")
        h4_req.append("higher profit share partly offset")
    else:
        h4_pass = False
        h4_ev.append("FAIL: Rendered text missing profit share offset phrasing.")

    if "utilization below normal capacity" in txt_h4.lower() and "further depresses" in txt_h4.lower():
        h4_ev.append("PASS: Rendered text confirms utilization below normal capacity further depresses realized profitability.")
        h4_req.append("utilization below normal capacity further depresses")
    else:
        h4_pass = False
        h4_ev.append("FAIL: Rendered text missing utilization depression phrasing.")

    results["H4"] = {
        "status": "PASS" if h4_pass else "FAIL",
        "evidence": h4_ev,
        "matched_required": h4_req,
        "forbidden_matches": h4_forb,
        "page_numbers": pages_h4
    }

    # --- Rendered H5: Figure 14 Numerical-Caption Inconsistency (MICRO-REPAIR) ---
    h5_ev = []
    h5_pass = True
    h5_forb = []
    h5_req = []
    p_fig14 = pages_h5[0] if pages_h5 else 48
    txt_h5 = rendered_text.get(p_fig14, "")
    ocr_h5 = ocr_text.get(p_fig14, "")
    combined_h5 = txt_h5 + " " + ocr_h5

    forbidden_r_h5 = "horizontal line marks critical value (3.29%)."
    if forbidden_r_h5 in combined_h5.lower():
        h5_pass = False
        h5_ev.append(f"FAIL: Rendered Figure 14 caption still has ambiguous single-line phrasing on page {p_fig14}.")
        h5_forb.append(forbidden_r_h5)
    else:
        h5_ev.append("PASS: Rendered Figure 14 does not contain ambiguous single-line caption.")

    if "corporate retirement rate" in combined_h5.lower() and \
       "critical depletion threshold" in combined_h5.lower() and \
       "2.86%" in combined_h5 and "3.29%" in combined_h5:
        h5_ev.append("PASS: Rendered Figure 14 caption distinguishes corporate retirement rate (2.86%) and critical depletion threshold (3.29%).")
        h5_req.append("Figure 14 caption: 2.86% retirement rate and 3.29% depletion threshold")
    else:
        h5_pass = False
        h5_ev.append(f"FAIL: Rendered Figure 14 caption missing dual threshold distinctions on page {p_fig14}.")

    results["H5"] = {
        "status": "PASS" if h5_pass else "FAIL",
        "evidence": h5_ev,
        "matched_required": h5_req,
        "forbidden_matches": h5_forb,
        "page_numbers": [p_fig14]
    }

    return results


# ============================================================
# MAIN EXECUTION & REPORTING
# ============================================================

def main():
    verifier_version = "1.2"
    check_set = ["F1", "F2", "F3", "F4", "F5", "F6", "G1", "G2", "G3", "H1", "H2", "H3", "H4", "H5"]

    print("=" * 70)
    print(f"FINAL_PASS.PY: Closed-Loop Post-Repair Verifier (Version {verifier_version})")
    print(f"Timestamp: {datetime.now().isoformat()}")
    print(f"Target PDF: {PDF_PATH}")
    print(f"Active Check Set: {', '.join(check_set)}")
    print("=" * 70)

    # 1. Source layer verification
    print("[*] Running Layer 1: Source-Layer Verification...")
    source_results = verify_source()

    # 2. Rendered PDF layer verification
    print("[*] Running Layer 2: Rendered-PDF & OCR Verification...")
    rendered_results = verify_rendered_pdf()

    # 3. Combine results
    checks = {}
    failed_checks = []
    indeterminate_checks = []

    for k in check_set:
        s_res = source_results.get(k, {"status": "FAIL", "evidence": ["Missing source test"], "sections": [], "matched_required": [], "forbidden_matches": []})
        r_res = rendered_results.get(k, {"status": "FAIL", "evidence": ["Missing rendered test"], "matched_required": [], "forbidden_matches": [], "page_numbers": []})

        s_stat = s_res["status"]
        r_stat = r_res["status"]
        visual_stat = "PASS" if k in ["F6", "H5"] and r_stat == "PASS" else ("FAIL" if k in ["F6", "H5"] else "NOT_REQUIRED")

        if s_stat == "PASS" and r_stat == "PASS":
            overall_k = "PASS"
        elif s_stat == "FAIL" or r_stat == "FAIL":
            overall_k = "FAIL"
            failed_checks.append(k)
        else:
            overall_k = "INDETERMINATE"
            indeterminate_checks.append(k)

        checks[k] = {
            "source_semantic": s_stat,
            "rendered_text": r_stat,
            "rendered_visual": visual_stat,
            "overall": overall_k,
            "evidence": {
                "source": s_res["evidence"],
                "rendered": r_res["evidence"],
                "sections": s_res.get("sections", []),
                "matched_required": s_res.get("matched_required", []) + r_res.get("matched_required", []),
                "forbidden_matches": s_res.get("forbidden_matches", []) + r_res.get("forbidden_matches", []),
                "page_numbers": r_res.get("page_numbers", [])
            }
        }
        print(f"  [{overall_k:^4}] Check {k:<2}: Source={s_stat:<4} | Rendered={r_stat:<4} | Visual={visual_stat:<12}")

    overall_decision = "PASS"
    if failed_checks:
        overall_decision = "FAIL"
    elif indeterminate_checks:
        overall_decision = "INDETERMINATE"

    next_action = "PROCEED_TO_INDEPENDENT_READER_SCREEN" if overall_decision == "PASS" else "REPAIR_FAILED_ITEMS"

    output_data = {
        "verifier_version": verifier_version,
        "check_set": check_set,
        "overall": overall_decision,
        "timestamp": datetime.now().isoformat(),
        "pdf": PDF_PATH,
        "checks": checks,
        "failed_checks": failed_checks,
        "indeterminate_checks": indeterminate_checks,
        "next_action": next_action
    }

    # Write JSON results
    json_path = os.path.join(OUTPUT_DIR, "final_pass_results.json")
    with open(json_path, "w", encoding="utf-8") as f:
        json.dump(output_data, f, indent=2)
    print(f"\n[+] Wrote results JSON: {json_path}")

    # Write Markdown Report
    md_path = os.path.join(OUTPUT_DIR, "final_pass_report.md")
    with open(md_path, "w", encoding="utf-8") as f:
        f.write(f"# Final Pass Verification Report (v{verifier_version})\n\n")
        f.write(f"**Overall Decision:** `{overall_decision}`  \n")
        f.write(f"**Timestamp:** {datetime.now().isoformat()}  \n")
        f.write(f"**Target PDF:** `{PDF_PATH}`  \n\n")
        f.write("---\n\n## Summary of Checks\n\n")
        f.write("| Check ID | Source Layer | Rendered PDF Layer | Visual Layer | Overall Verdict |\n")
        f.write("|:---|:---|:---|:---|:---|\n")
        for k in check_set:
            f.write(f"| **{k}** | `{checks[k]['source_semantic']}` | `{checks[k]['rendered_text']}` | `{checks[k]['rendered_visual']}` | **`{checks[k]['overall']}`** |\n")
        f.write("\n---\n\n## Detailed Evidence\n\n")
        for k in check_set:
            f.write(f"### Check {k} ({checks[k]['overall']})\n\n")
            f.write(f"- **Sections:** {', '.join(checks[k]['evidence']['sections']) if checks[k]['evidence']['sections'] else 'N/A'}\n")
            f.write(f"- **Page Numbers:** {', '.join(str(p) for p in checks[k]['evidence']['page_numbers']) if checks[k]['evidence']['page_numbers'] else 'N/A'}\n\n")
            f.write("#### Source Layer Evidence:\n")
            for ev in checks[k]["evidence"]["source"]:
                f.write(f"- {ev}\n")
            f.write("\n#### Rendered PDF Layer Evidence:\n")
            for ev in checks[k]["evidence"]["rendered"]:
                f.write(f"- {ev}\n")
            f.write("\n")

    print(f"[+] Wrote report Markdown: {md_path}")
    print(f"[*] Overall Decision: {overall_decision}")

    if overall_decision == "PASS":
        sys.exit(0)
    elif overall_decision == "FAIL":
        sys.exit(1)
    else:
        sys.exit(2)


if __name__ == "__main__":
    main()
