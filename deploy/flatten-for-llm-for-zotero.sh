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

# ---------- clinical-relevance ----------
cat > "$OUTPUT_DIR/clinical-relevance.md" << 'EOF'
---
id: clinical-relevance
match: /clinical relevance/i
match: /practice changing/i
match: /change my practice/i
match: /applicable to my patients/i
match: /should i act/i
match: /relevancia clínica/i
---
# Clinical Relevance

Assess whether this paper changes clinical practice for Spanish pulmonology. Output JSON first, then Spanish narrative.

## Workflow (5 dimensions)
1. Effect magnitude — clinical vs statistical significance. Use MCIDs: 6MWD 30m, FEV1 100mL/10%, mMRC 1pt, CAT 2pt, SGRQ 4pt, K-BILD 5pt
2. Population applicability to Spanish pneumology patients — age, smoking, exclusions
3. Intervention availability in Spain — AEMPS status, SNS funding, procedure availability (EBUS, cryobiopsy, robotic bronchoscopy)
4. Translation to practice — changes/confirmations/contradictions to current workflow
5. Patient-relevant vs surrogate endpoints — mortality, hospitalization, QoL vs biomarkers

## Output Schema (JSON first)

```json
{
  "practice_changing": "yes | yes-with-caveats | confirms-current-practice | not-applicable | premature",
  "effect_magnitude": {
    "primary_outcome": "...",
    "clinical_significance": "large | moderate | small | unclear",
    "mcid_referenced": "...",
    "absolute_effect": "..."
  },
  "population_applicability": {
    "fit_to_spanish_pneumology": "high | moderate | low",
    "key_exclusions_that_limit_applicability": ["..."]
  },
  "intervention_availability_spain": {
    "available": "yes | restricted | no | not-yet",
    "details": "...",
    "aemps_status": "...",
    "sns_funding": "..."
  },
  "patient_relevance": {
    "endpoint_type": "patient-important | composite | surrogate",
    "details": "..."
  },
  "actionable_changes": ["..."],
  "implementation_barriers": ["..."],
  "confidence_in_judgment": "high | medium | low"
}
```

## Relevancia clínica (es-ES)
**¿Cambia mi práctica?** sí / sí con reservas / confirma / no aplicable / prematuro
**Magnitud del efecto:** ... (MCID, significancia clínica vs estadística)
**Aplicabilidad al paciente del SNS:** ... (población, exclusiones)
**Disponibilidad en España:** ... (AEMPS, financiación SNS)
**Outcomes relevantes para el paciente:** ... (patient-important vs surrogate)
**Acciones concretas:** ...
**Barreras de implementación:** ...
**Confianza del juicio:** alta / media / baja

## Rules
- Single small study non-replicated → "premature"
- Industry-funded + single-center + surrogate → "premature"
- Do not extrapolate beyond population studied
- es-ES for narrative, English for JSON
EOF

echo "Wrote $OUTPUT_DIR/clinical-relevance.md"

# ---------- synthesize-collection ----------
cat > "$OUTPUT_DIR/synthesize-collection.md" << 'EOF'
---
id: synthesize-collection
match: /synthesize collection/i
match: /evidence synthesis/i
match: /what does the evidence say/i
match: /summarize my collection/i
match: /evidence gaps/i
match: /síntesis de evidencia/i
---
# Synthesize Collection

Synthesize evidence across multiple papers on the same clinical question. Output JSON first, then Spanish narrative with markdown evidence map table.

## Inputs
- Multiple papers (Zotero collection, selection, or pasted abstracts).
- Optional: focused clinical question. If absent, infer and confirm in PICO format before synthesizing.

## Workflow (6 steps)
1. Clarify clinical question (PICO / PIO / PIRD). If papers span different questions, ask user to narrow the set.
2. Build evidence map: one row per study with study_id, design, country, n, population, intervention, comparator, primary_outcome (name/effect/ci_95), ocebm_level, risk_of_bias, key_limitations, funding.
3. Assess consistency: direction_of_effect (consistent/mixed/conflicting), magnitude_consistency, explanations_for_discordance (population, intervention, methodology, era, funding).
4. Aggregate quality: study designs distribution, RoB distribution, GRADE certainty for primary outcome (start High for RCT body / Low for observational; downgrade for risk-of-bias, inconsistency, indirectness, imprecision, publication-bias).
5. Identify evidence gaps: populations underrepresented, outcomes not studied, comparators not tested, settings not studied, methodological gaps.
6. Practice implications: supported / not_supported / requires_individualization / high_priority_research.

## Output Schema (JSON first)

```json
{
  "clinical_question": "...",
  "number_of_studies": 0,
  "study_designs_summary": {"rct": 0, "cohort-prospective": 0},
  "evidence_map": [
    {
      "study_id": "FirstAuthorYear",
      "design": "rct",
      "country": "...",
      "n": 0,
      "population": "...",
      "intervention": "...",
      "comparator": "...",
      "primary_outcome": {"name": "...", "effect": "...", "ci_95": "..."},
      "ocebm_level": 2,
      "risk_of_bias": "low",
      "key_limitations": "...",
      "funding": "..."
    }
  ],
  "consistency_assessment": {
    "direction_of_effect": "consistent | mixed | conflicting",
    "magnitude_consistency": "...",
    "explanations_for_discordance": ["..."]
  },
  "aggregate_quality": {
    "overall_grade_certainty": "high | moderate | low | very-low",
    "rationale": "..."
  },
  "evidence_gaps": ["..."],
  "practice_implications": {
    "supported": ["..."],
    "not_supported": ["..."],
    "requires_individualization": ["..."],
    "high_priority_research": ["..."]
  },
  "synthesis_confidence": "high | medium | low"
}
```

## Síntesis de evidencia (es-ES)
**Pregunta clínica (PICO):** ...

### Mapa de evidencia
| Estudio | Diseño | N | País | Resultado principal | OCEBM | RoB |
|---------|--------|---|------|---------------------|-------|-----|
| ...     | ...    |...| ...  | ...                 | ...   | ... |

### Consistencia y discordancia
**Dirección del efecto:** ... — **Magnitud:** ... — **Explicaciones de discordancia:** ...

### Calidad global
**Distribución de diseños:** ... — **RoB:** ... — **Certeza GRADE:** ... — razón

### Gaps de evidencia
- ...

### Implicaciones para la práctica
**Apoyado:** ... — **No apoyado:** ... — **Individualización:** ... — **Investigación prioritaria:** ...

**Confianza de la síntesis:** alta / media / baja — razón

## Rules
- <3 studies → label "narrative summary, not synthesis"; synthesis_confidence: "low"
- Heterogeneous studies → do not force synthesis; explain why combined inference not supported
- Different clinical questions → ask user to narrow the set; do not invent unifying question
- Token economy: prefer abstracts + key extracted passages, not full text of all papers
- es-ES for narrative (with markdown table), English for JSON
EOF

echo "Wrote $OUTPUT_DIR/synthesize-collection.md"

echo ""
echo "All skills deployed. Restart Zotero to load."
