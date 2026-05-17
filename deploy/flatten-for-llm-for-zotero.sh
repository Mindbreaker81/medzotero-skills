    #!/bin/bash
# Convert extract-pico skill to LLM-for-Zotero format (ultra-minimal for long PDFs)
# LLM-for-Zotero uses id + match patterns, not name + description

SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/skills/extract-pico"
OUTPUT_DIR="${ZOTERO_DATA_DIR:-$HOME/Zotero}/llm-for-zotero/skills"

mkdir -p "$OUTPUT_DIR"

# Write ultra-minimal LLM-for-Zotero skill
cat > "$OUTPUT_DIR/extract-pico.md" << 'EOF'
---
id: extract-pico
match: /extract pico/i
match: /summarize/i
match: /analyze/i
match: /what's the design/i
---
# Extract PICO

Extract study type and PICO from this paper.

## Study Types
rct, cohort-prospective, cohort-retrospective, case-control, diagnostic-accuracy, systematic-review, case-series, case-report, editorial-commentary, basic-translational, other

## Templates
- RCT/SR: full PICO
- Cohort/case-series: PIO (no comparator)
- Diagnostic: PIRD (Population, Index test, Reference standard, Disorder)
- Editorial/case-report/basic: population only, set pico_applicable: false

## Output (JSON first, then Spanish narrative)

```json
{
  "study_type": "...",
  "pico_applicable": true,
  "pico": {
    "population": {"description": "...", "setting": "...", "country_or_region": "..."},
    "intervention": {"description": "..."},
    "comparison": {"description": "..."},
    "outcomes": {"primary": [{"name": "...", "effect": "...", "ci_95": "..."}]}
  },
  "sample_size": {"analyzed": 0},
  "extraction_confidence": "high"
}
```

## Resumen estructurado (es-ES)
**Tipo de estudio:** ...
**Pregunta clínica:** ...
**Población:** ...
**Resultado principal:** ...

## Rules
- Use null for missing data
- es-ES for narrative, English for JSON
EOF

echo "Ultra-minimal skill written to $OUTPUT_DIR/extract-pico.md"
echo "Restart Zotero to load the skill."
