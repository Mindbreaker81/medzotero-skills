#!/bin/bash
# Flatten extract-pico skill for LLM-for-Zotero
# LLM-for-Zotero accepts a single .md file per skill, not folder structure

SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/skills/extract-pico"
OUTPUT_DIR="${ZOTERO_DATA_DIR:-$HOME/Zotero}/llm-for-zotero/skills"

mkdir -p "$OUTPUT_DIR"

# Concatenate SKILL.md and examples
cat "$SKILL_DIR/SKILL.md" > "$OUTPUT_DIR/extract-pico.md"
echo "" >> "$OUTPUT_DIR/extract-pico.md"
echo "---" >> "$OUTPUT_DIR/extract-pico.md"
echo "" >> "$OUTPUT_DIR/extract-pico.md"
echo "# Examples" >> "$OUTPUT_DIR/extract-pico.md"
echo "" >> "$OUTPUT_DIR/extract-pico.md"
cat "$SKILL_DIR/examples/"*.md >> "$OUTPUT_DIR/extract-pico.md"

echo "Flattened skill written to $OUTPUT_DIR/extract-pico.md"
echo "Restart Zotero to load the skill."
