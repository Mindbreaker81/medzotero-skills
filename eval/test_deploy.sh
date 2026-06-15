#!/usr/bin/env bash
# Smoke test for deploy/flatten-for-llm-for-zotero.sh.
#
# Runs the deploy script into a throwaway directory and asserts that every generated
# LLM-for-Zotero file is well-formed: id/match frontmatter present, id matches the
# filename, and a non-empty body follows. Exits non-zero on any failure (CI gate).

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILLS_SRC="$REPO_ROOT/skills"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

# Expected: one output per SKILL.md that carries a ZOTERO block.
expected=0
for skill_md in "$SKILLS_SRC"/*/SKILL.md; do
  if grep -q '<!-- ZOTERO:START -->' "$skill_md"; then
    expected=$((expected + 1))
  fi
done

ZOTERO_DATA_DIR="$TMP_DIR" bash "$REPO_ROOT/deploy/flatten-for-llm-for-zotero.sh" >/dev/null

OUT_DIR="$TMP_DIR/llm-for-zotero/skills"
failures=0
produced=0

for f in "$OUT_DIR"/*.md; do
  [ -f "$f" ] || { echo "FAIL: no output files produced"; exit 1; }
  produced=$((produced + 1))
  name="$(basename "$f" .md)"

  # Frontmatter must open on line 1.
  if [ "$(head -1 "$f")" != "---" ]; then
    echo "FAIL: $name does not start with frontmatter '---'"; failures=$((failures + 1)); continue
  fi
  # id line present and matches filename.
  id="$(awk -F': *' '/^id:[[:space:]]/ {print $2; exit}' "$f")"
  if [ "$id" != "$name" ]; then
    echo "FAIL: $name has id '$id' (expected '$name')"; failures=$((failures + 1))
  fi
  # At least one match pattern.
  if ! grep -q '^match: ' "$f"; then
    echo "FAIL: $name has no match: patterns"; failures=$((failures + 1))
  fi
  # match patterns look like /regex/flags.
  if grep '^match: ' "$f" | grep -qvE '^match: /.+/[a-z]*$'; then
    echo "FAIL: $name has a malformed match: pattern"; failures=$((failures + 1))
  fi
  # Non-empty body after the closing frontmatter delimiter (the 2nd '---').
  body_lines="$(awk 'NR>1 && /^---$/ {f=1; next} f && NF {n++} END{print n+0}' "$f")"
  if [ "${body_lines:-0}" -lt 1 ]; then
    echo "FAIL: $name has an empty body"; failures=$((failures + 1))
  fi
done

if [ "$produced" -ne "$expected" ]; then
  echo "FAIL: produced $produced file(s), expected $expected"; failures=$((failures + 1))
fi

echo ""
if [ "$failures" -ne 0 ]; then
  echo "FAILED: $failures problem(s) in deploy output."
  exit 1
fi
echo "PASSED: $produced LLM-for-Zotero skill file(s) are well-formed."
