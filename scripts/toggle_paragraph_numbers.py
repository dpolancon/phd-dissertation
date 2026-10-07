"""
toggle_paragraph_numbers.py
===========================
Utility to enumerate paragraphs or eliminate paragraph enumerations with a toggle.
Designed for LaTeX academic papers and working papers where paragraph numbers
(e.g., \\textbf{2.1}, \\textbf{3.14}, \\textbf{A.1}) are used during drafting/review
but stripped for final distribution or submission.

Usage:
    # 1. Strip all paragraph numbers from workingpapers/chapter3:
    python scripts/toggle_paragraph_numbers.py --strip --target workingpapers/chapter3

    # 2. Add paragraph numbers back:
    python scripts/toggle_paragraph_numbers.py --enumerate --target workingpapers/chapter3

    # 3. Check status without modifying:
    python scripts/toggle_paragraph_numbers.py --status --target workingpapers/chapter3

    # 4. Preview changes (dry run):
    python scripts/toggle_paragraph_numbers.py --strip --target workingpapers/chapter3 --dry-run
"""

import os
import re
import sys
import argparse
import subprocess
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent

# Regex matching paragraph enumeration tags at the beginning of a line:
# e.g., \textbf{2.1}, \textbf{3.14}, \textbf{A.1}, \textbf{F.2b}
# Captures: group 1 = number tag (e.g. '2.1')
PARAGRAPH_TAG_RE = re.compile(r'^(\s*)\\textbf\{([0-9A-Z]+(?:\.[0-9]+)+[a-z]?)\}\s*')

# Patterns indicating lines that should NEVER be treated as body prose paragraphs:
SKIP_LINE_STARTS = (
    '\\begin{', '\\end{', '\\section', '\\subsection', '\\subsubsection',
    '\\paragraph', '\\subparagraph', '\\input', '\\subimport', '\\caption',
    '\\label', '\\item', '\\centering', '\\vspace', '\\hspace', '\\clearpage',
    '\\pagebreak', '\\newpage', '\\maketitle', '\\bibliographystyle', '\\bibliography',
    '\\addtocontents', '\\documentclass', '\\usepackage', '\\title', '\\author',
    '\\date', '\\footnote', '\\def', '\\newcommand', '\\renewcommand', '%'
)

def is_table_or_figure_environment(line, in_table_env, in_figure_env):
    """Tracks whether we are currently inside a table or figure float."""
    stripped = line.strip()
    if any(env in stripped for env in ['\\begin{table', '\\begin{tabular', '\\begin{threeparttable', '\\begin{longtable']):
        in_table_env = True
    elif any(env in stripped for env in ['\\end{table', '\\end{tabular', '\\end{threeparttable', '\\end{longtable']):
        in_table_env = False
        
    if any(env in stripped for env in ['\\begin{figure', '\\begin{tikzpicture']):
        in_figure_env = True
    elif any(env in stripped for env in ['\\end{figure', '\\end{tikzpicture']):
        in_figure_env = False
        
    return in_table_env, in_figure_env

def strip_paragraph_numbers(file_path, dry_run=False):
    """Strips paragraph number tags from a single LaTeX file."""
    with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
        lines = f.readlines()
        
    modified_lines = []
    changes = 0
    in_table = False
    in_figure = False
    
    for idx, line in enumerate(lines, 1):
        in_table, in_figure = is_table_or_figure_environment(line, in_table, in_figure)
        
        # Don't strip inside tables or if line has table cell separators '&'
        if not in_table and '&' not in line:
            m = PARAGRAPH_TAG_RE.match(line)
            if m:
                tag = m.group(2)
                # Strip \textbf{X.Y} and leading whitespace
                new_line = PARAGRAPH_TAG_RE.sub(m.group(1), line, count=1)
                modified_lines.append(new_line)
                changes += 1
                continue
                
        modified_lines.append(line)
        
    if changes > 0:
        if not dry_run:
            with open(file_path, 'w', encoding='utf-8') as f:
                f.writelines(modified_lines)
        return changes
    return 0

def get_section_prefix(file_path, default_prefix="1"):
    """Infers the default section/appendix prefix from file name."""
    name = file_path.stem.lower()
    m = re.match(r'^0?(\d+)_', name)
    if m:
        return str(int(m.group(1)))
    if 'bop' in name or 'appendix_a' in name:
        return 'A'
    if 'codebook' in name or 'appendix_b' in name:
        return 'B'
    if 'causal' in name or 'pcmci' in name or 'appendix_c' in name:
        return 'C'
    if 'tvar' in name or 'girf' in name or 'appendix_d' in name:
        return 'D'
    if 'linear' in name or 'var' in name or 'appendix_e' in name:
        return 'E'
    return default_prefix

def enumerate_paragraphs(file_path, default_prefix=None, dry_run=False):
    """
    Adds paragraph number tags (\\textbf{X.Y} ) to prose paragraphs in a LaTeX file.
    Skips lines that already have tags, headers, environments, and empty lines.
    """
    with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
        content = f.read()
        
    prefix = default_prefix or get_section_prefix(file_path)
    
    # Split content into paragraphs separated by two or more newlines
    paragraphs = re.split(r'(\n\s*\n+)', content)
    
    p_counter = 1
    modified_paragraphs = []
    changes = 0
    in_table = False
    in_figure = False
    
    for part in paragraphs:
        # If it's a delimiter (blank lines), keep as is
        if re.match(r'^\s*$', part):
            modified_paragraphs.append(part)
            continue
            
        lines = part.split('\n')
        first_line = lines[0].strip()
        
        # Check if first line contains section command, update prefix if found
        sec_m = re.match(r'\\section\*?\{([^}]+)\}', first_line)
        sub_m = re.match(r'\\subsection\*?\{([^}]+)\}', first_line)
        
        # Check if this paragraph is inside a table or figure
        in_table, in_figure = is_table_or_figure_environment(part, in_table, in_figure)
        
        # Determine if this paragraph is candidate for numbering
        is_candidate = (
            not in_table and
            not in_figure and
            not part.strip().startswith(SKIP_LINE_STARTS) and
            '&' not in first_line and
            len(first_line) > 10 and
            not PARAGRAPH_TAG_RE.match(lines[0])
        )
        
        if is_candidate:
            tag = f"\\textbf{{{prefix}.{p_counter}}} "
            lines[0] = tag + lines[0]
            p_counter += 1
            changes += 1
            
        modified_paragraphs.append('\n'.join(lines))
        
    new_content = ''.join(modified_paragraphs)
    if changes > 0 and not dry_run:
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(new_content)
            
    return changes

def scan_status(target_path):
    """Scans and reports paragraph number statistics across files."""
    target = Path(target_path)
    files = [target] if target.is_file() else sorted(target.rglob('*.tex'))
    
    total_tags = 0
    file_stats = []
    
    for f in files:
        count = 0
        with open(f, 'r', encoding='utf-8', errors='ignore') as fp:
            in_table = False
            in_figure = False
            for line in fp:
                in_table, in_figure = is_table_or_figure_environment(line, in_table, in_figure)
                if not in_table and '&' not in line:
                    if PARAGRAPH_TAG_RE.match(line):
                        count += 1
        if count > 0:
            file_stats.append((f, count))
            total_tags += count
            
    return total_tags, file_stats

def main():
    parser = argparse.ArgumentParser(
        description="Toggle paragraph enumeration in LaTeX files (strip or add paragraph numbers)."
    )
    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument("--strip", "--eliminate", "--remove", action="store_true",
                       help="Eliminate/strip paragraph numbers from target files")
    group.add_argument("--enumerate", "--add", action="store_true",
                       help="Add paragraph numbers to target files")
    group.add_argument("--status", "--check", action="store_true",
                       help="Scan and report current paragraph number tags")

    parser.add_argument("--target", type=str, default="workingpapers/chapter3",
                        help="Target file or directory (default: workingpapers/chapter3)")
    parser.add_argument("--dry-run", action="store_true",
                        help="Preview changes without modifying files on disk")
    parser.add_argument("--compile", action="store_true",
                        help="Compile PDF after modifications if working_paper.tex is present")

    args = parser.parse_args()
    target_path = Path(args.target)
    
    if not target_path.is_absolute():
        target_path = REPO_ROOT / target_path

    if not target_path.exists():
        print(f"[!] Target path does not exist: {target_path}")
        sys.exit(1)

    print(f"[*] Target: {target_path}")

    if args.status:
        total_tags, file_stats = scan_status(target_path)
        print(f"\n[+] Total paragraph numbers found: {total_tags}")
        if file_stats:
            for f, count in file_stats:
                rel = f.relative_to(REPO_ROOT) if f.is_relative_to(REPO_ROOT) else f
                print(f"    - {rel}: {count} tags")
        else:
            print("    (No paragraph numbers detected)")
        return

    files = [target_path] if target_path.is_file() else sorted(target_path.rglob('*.tex'))

    if args.strip:
        mode_name = "DRY RUN - STRIP" if args.dry_run else "STRIP"
        print(f"[*] Mode: {mode_name} (Eliminating paragraph numbers)")
        total_stripped = 0
        for f in files:
            # Skip generated or non-manuscript files
            if any(part in f.parts for part in ['build', '_build', 'backups', '__pycache__']):
                continue
            count = strip_paragraph_numbers(f, dry_run=args.dry_run)
            if count > 0:
                rel = f.relative_to(REPO_ROOT) if f.is_relative_to(REPO_ROOT) else f
                print(f"    - {rel}: stripped {count} paragraph tags")
                total_stripped += count
        print(f"\n[+] Finished. Total paragraph tags stripped: {total_stripped}")

    elif args.enumerate:
        mode_name = "DRY RUN - ENUMERATE" if args.dry_run else "ENUMERATE"
        print(f"[*] Mode: {mode_name} (Adding paragraph numbers)")
        total_added = 0
        for f in files:
            # Only enumerate files in sections/ or appendix/
            if not any(part in f.parts for part in ['sections', 'appendix']):
                continue
            count = enumerate_paragraphs(f, dry_run=args.dry_run)
            if count > 0:
                rel = f.relative_to(REPO_ROOT) if f.is_relative_to(REPO_ROOT) else f
                print(f"    - {rel}: added {count} paragraph tags")
                total_added += count
        print(f"\n[+] Finished. Total paragraph tags added: {total_added}")

    if args.compile and not args.dry_run:
        # Search for working_paper.tex in target or parent
        wp_dir = target_path if target_path.is_dir() else target_path.parent
        tex_file = wp_dir / "working_paper.tex"
        if tex_file.exists():
            print(f"\n[*] Compiling {tex_file.name} in {wp_dir}...")
            cmd = ["latexmk", "-pdf", "-interaction=nonstopmode", "working_paper.tex"]
            res = subprocess.run(cmd, cwd=wp_dir, capture_output=True, text=True, errors="replace")
            if res.returncode == 0:
                print(f"[+] Compilation succeeded! PDF updated at {wp_dir / 'working_paper.pdf'}")
            else:
                print(f"[!] Compilation returned code {res.returncode}. Check log at {wp_dir / 'working_paper.log'}")

if __name__ == "__main__":
    main()
