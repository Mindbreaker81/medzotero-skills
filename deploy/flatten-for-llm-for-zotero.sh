    #!/bin/bash
# Convert extract-pico skill to LLM-for-Zotero format (simplified for Agent Mode)
# LLM-for-Zotero uses id + match patterns, not name + description

SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/skills/extract-pico"
OUTPUT_DIR="${ZOTERO_DATA_DIR:-$HOME/Zotero}/llm-for-zotero/skills"

mkdir -p "$OUTPUT_DIR"

# Write simplified LLM-for-Zotero skill
cat > "$OUTPUT_DIR/extract-pico.md" << 'EOF'
---
id: extract-pico
match: /extract pico/i
match: /summarize/i
match: /analyze/i
match: /what's the design/i
match: /what does this paper study/i
match: /appraise/i
match: /review/i
---
# Extract PICO

Extract study type and PICO (Population, Intervention, Comparison, Outcome) from this biomedical paper.

## Workflow

1. Detect study type: rct, cohort-prospective, cohort-retrospective, case-control, diagnostic-accuracy, systematic-review, case-series, case-report, editorial-commentary, basic-translational, or other.

2. Apply appropriate template:
   - RCTs and systematic reviews: full PICO
   - Cohorts and case-series: PIO (no comparator)
   - Diagnostic accuracy: PIRD (Population, Index test, Reference standard, Disorder)
   - Case reports/editorials/basic science: population only, mark pico_applicable: false

3. Extract: sample size (screened, enrolled, analyzed, lost_to_followup, analysis_type), primary/secondary outcomes with effect sizes and 95% CI, funding, conflicts of interest, trial registration, key limitations.

4. CRITICAL: Output MUST be in this exact order:
   - First: A code block with JSON (```json ... ```)
   - Second: Spanish narrative summary

Do NOT skip the JSON. The JSON is required.

## Output Schema

```json
{
  "study_type": "rct",
  "meta_analysis": null,
  "pico_applicable": true,
  "pico": {
    "population": {"description": "...", "key_inclusion_criteria": ["..."], "key_exclusion_criteria": ["..."], "setting": "...", "country_or_region": "..."},
    "intervention": {"description": "...", "dose_or_intensity": "...", "duration": "..."},
    "comparison": {"description": "...", "type": "placebo | active-comparator | standard-of-care | no-treatment | historical-control"},
    "outcomes": {"primary": [{"name": "...", "measurement": "...", "effect": "...", "ci_95": "...", "p_value": null}], "secondary": [...], "safety": [...]}
  },
  "sample_size": {"screened": null, "enrolled": null, "analyzed": null, "lost_to_followup": null, "analysis_type": "itt | per-protocol | modified-itt | as-treated | complete-case | null"},
  "duration": {"enrollment_period": "...", "follow_up_median": "...", "follow_up_range": "..."},
  "funding": "...",
  "conflicts_of_interest": "...",
  "registration": {"id": "...", "registry": "..."},
  "key_limitations_stated_by_authors": ["..."],
  "extraction_confidence": "high | medium | low",
  "extraction_notes": "..."
}
```

## Spanish Narrative

After JSON, provide:
## Resumen estructurado
**Tipo de estudio:** ...
**Pregunta clínica:** ...
**Población:** ...
**Intervención:** ...
**Comparador:** ...
**Resultado principal:** ...
**Resultados clave:** ...
**Limitaciones declaradas:** ...
**Confianza de la extracción:** ...

## Rules

- If data not in text, use null (not "unknown" or "not reported")
- For abstract-only, set extraction_confidence: "low"
- For editorials/case reports, set pico_applicable: false
- Respond in es-ES for narrative, JSON in English
EOF

echo "Simplified skill written to $OUTPUT_DIR/extract-pico.md"
echo "Restart Zotero to load the skill."
