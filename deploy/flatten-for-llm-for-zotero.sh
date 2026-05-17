#!/bin/bash
# Convert medzotero skills to LLM-for-Zotero format (ultra-minimal for Agent Mode)
# LLM-for-Zotero uses id + match patterns, not name + description
# Generates one minimal .md per skill, optimized for the model's context window

set -e

OUTPUT_DIR="${ZOTERO_DATA_DIR:-$HOME/Zotero}/llm-for-zotero/skills"
mkdir -p "$OUTPUT_DIR"

# ---------- extract-pico ----------
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

echo "Wrote $OUTPUT_DIR/extract-pico.md"

# ---------- appraise-evidence ----------
cat > "$OUTPUT_DIR/appraise-evidence.md" << 'EOF'
---
id: appraise-evidence
match: /appraise/i
match: /critical appraisal/i
match: /risk of bias/i
match: /level of evidence/i
match: /grade/i
match: /should i trust/i
match: /is this study good/i
---
# Appraise Evidence

Apply the appropriate critical appraisal framework based on study type. Output JSON first, then Spanish narrative.

## Tool Selection by Study Type
- rct, cluster-rct, crossover-rct → ROB 2 (5 domains)
- systematic-review → AMSTAR-2
- cohort-*, case-control → Newcastle-Ottawa Scale (NOS)
- diagnostic-accuracy → QUADAS-2
- prognostic-model → PROBAST
- clinical-practice-guideline → AGREE II
- non-randomized-controlled, observational interventions → ROBINS-I
- case-report/series → JBI checklist
- editorial/commentary → narrative-only, set appraisal_applicable: false

## Workflow
1. Resolve study_type
2. Assign OCEBM 2011 Level of Evidence (1-5) for the question type (therapy/diagnosis/prognosis/harm/screening)
3. Apply the matching tool with item-level judgments + rationale
4. Apply GRADE certainty for primary outcome (start High for RCT, Low for observational; downgrade for risk-of-bias, inconsistency, indirectness, imprecision, publication-bias; upgrade for large effect, dose-response, plausible-confounding-reduces-effect)
5. Highlight red flags
6. Output JSON, then Spanish narrative

## Output Schema (JSON first)

```json
{
  "study_type_resolved": "...",
  "ocebm_level": 2,
  "ocebm_question_type": "therapy",
  "appraisal_tool": "rob-2",
  "appraisal_applicable": true,
  "rob_2": {
    "domain_1_randomization": {"judgment": "low", "rationale": "..."},
    "domain_2_deviations": {"judgment": "low", "rationale": "..."},
    "domain_3_missing_data": {"judgment": "low", "rationale": "..."},
    "domain_4_measurement": {"judgment": "low", "rationale": "..."},
    "domain_5_selection_of_reported_result": {"judgment": "low", "rationale": "..."},
    "overall": "low"
  },
  "grade_assessment": {
    "outcome": "...",
    "starting_certainty": "high",
    "downgrades": [{"reason": "imprecision", "magnitude": 1, "rationale": "..."}],
    "upgrades": [],
    "final_certainty": "moderate",
    "rationale": "..."
  },
  "red_flags": ["..."],
  "appraiser_overall_judgment": "trustworthy",
  "appraisal_confidence": "high"
}
```

For non-RCT studies, replace `rob_2` with the matching tool key: `amstar_2`, `nos`, `quadas_2`, `probast`, `agree_ii`, `robins_i`. Each with item-level judgments + rationale.

## Valoración crítica (es-ES)
**Tipo de estudio resuelto:** ...
**Nivel de evidencia OCEBM:** ...
**Herramienta de valoración:** ...
**Riesgo de sesgo (resumen por dominios):** ...
**Certeza GRADE para resultado principal:** ...
**Señales de alerta:** ...
**Juicio global:** confiable / confiable con reservas / usar con precaución / no fiable
**Confianza en la valoración:** alta / media / baja

## Rules
- Item-level scoring with rationale, never overall-only
- For insufficient information, judgment = "no-information" (do not guess)
- For editorials/commentaries, set appraisal_applicable: false
- es-ES for narrative, English for JSON
EOF

echo "Wrote $OUTPUT_DIR/appraise-evidence.md"

echo ""
echo "All skills deployed. Restart Zotero to load."
