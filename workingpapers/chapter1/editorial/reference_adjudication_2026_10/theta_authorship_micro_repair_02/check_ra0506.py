#!/usr/bin/env python3
"""
Dedicated RA0506 Theta Authorship Verification Script
Read-only check of source and rendered invariants for theta authorship.
"""

import os
import re

WP_DIR = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..", ".."))
INTRO_PATH = os.path.join(WP_DIR, "sections", "01_introduction.tex")
SEC3_PATH = os.path.join(WP_DIR, "sections", "03_conceptual_framework.tex")
APP_A_PATH = os.path.join(WP_DIR, "appendices", "appendix_A_ODE.tex")

intro_txt = open(INTRO_PATH, encoding="utf-8").read()
sec3_txt = open(SEC3_PATH, encoding="utf-8").read()
app_a_txt = open(APP_A_PATH, encoding="utf-8").read()

results = {}

# 1. Introduction first-person ownership
r1 = bool(re.search(r"I use \$\\theta = 1\$ to represent the balanced-growth knife-edge", intro_txt))
results["intro_first_person_ownership"] = {
    "status": "PASS" if r1 else "FAIL",
    "evidence": "Found 'I use $\\theta = 1$ to represent the balanced-growth knife-edge' in Introduction." if r1 else "Missing required intro phrasing."
}

# 2. Section 3.3 first-person ownership
r2 = "I translate this disproportionality problem into a single-sector capacity framework" in sec3_txt
results["sec3_first_person_translation"] = {
    "status": "PASS" if r2 else "FAIL",
    "evidence": "Found 'I translate this disproportionality problem into a single-sector capacity framework' in Section 3.3." if r2 else "Missing translation phrase."
}

# 3. Section 3.3 scalar representation phrases
r3_a = "In this representation, $\\theta = 1$ is the proportional-growth benchmark" in sec3_txt
r3_b = "Within this scalar representation, relaxing the proportional-growth benchmark" in sec3_txt
r3 = r3_a and r3_b
results["sec3_scalar_representation_phrasing"] = {
    "status": "PASS" if r3 else "FAIL",
    "evidence": "Found 'In this representation...' and 'Within this scalar representation...' in Section 3.3." if r3 else "Missing representation phrasing."
}

# 4. Okishio/Basu attached only to interdepartmental reproduction layer
# Check sentence-level attributions
forbidden_matches = []
for line in sec3_txt.split("\n"):
    # Look for any sentence attributing theta=1 or ODE to Okishio or Basu
    for sent in re.split(r"[.?!]\s+", line):
        if ("Okishio" in sent or "Basu" in sent) and ("\\theta = 1" in sent or "\\theta \\neq 1" in sent or "ordinary differential equation" in sent):
            forbidden_matches.append(f"Forbidden sentence: '{sent.strip()}'")

if re.search(r"canonical post-Keynesian.*\\theta", sec3_txt):
    forbidden_matches.append("canonical post-Keynesian attached to theta in Section 3")
if re.search(r"standard in post-Keynesian.*\\theta", intro_txt):
    forbidden_matches.append("standard in post-Keynesian attached to theta in intro")

results["forbidden_patterns_check"] = {
    "status": "PASS" if len(forbidden_matches) == 0 else "FAIL",
    "forbidden_matches": forbidden_matches,
    "evidence": "Zero forbidden literature-attribution patterns found." if len(forbidden_matches) == 0 else f"Found forbidden patterns: {forbidden_matches}"
}

# 5. ODE derivation attribution check
r5_sec3 = not bool(re.search(r"differential equation.*(?:Okishio|Basu)", sec3_txt))
r5_app_a = "Okishio" not in app_a_txt and "Basu" not in app_a_txt
r5 = r5_sec3 and r5_app_a
results["ode_author_ownership"] = {
    "status": "PASS" if r5 else "FAIL",
    "evidence": "ODE derivation in Section 3.3 and Appendix A has zero Okishio/Basu attribution." if r5 else "ODE attribution violation."
}

overall = all(v["status"] == "PASS" for v in results.values())
print(f"RA0506_THETA_AUTHORSHIP Overall: {'PASS' if overall else 'FAIL'}")
for k, v in results.items():
    print(f"  [{v['status']}] {k}: {v['evidence']}")
