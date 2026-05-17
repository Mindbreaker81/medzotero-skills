---
name: appraise-evidence
description: Apply the appropriate critical appraisal framework to a biomedical paper based on its study type. Outputs OCEBM Level of Evidence, GRADE certainty assessment for primary outcomes, and study-type-specific risk-of-bias assessment (ROB 2 for RCTs, AMSTAR-2 for systematic reviews, NOS for observational studies, QUADAS-2 for diagnostic accuracy studies). Use whenever the user wants to evaluate the quality of evidence, the risk of bias, the strength of a study, or whether a finding is trustworthy. Trigger for queries like "is this study good", "what's the level of evidence", "appraise this", "should I trust this finding".
---

# Appraise Evidence

## Purpose

Generate a defensible, framework-grounded critical appraisal of a biomedical paper. Output is JSON-first with all framework items individually scored, followed by a Spanish narrative interpretation.

## When to use

- The user asks to evaluate the quality, validity, or trustworthiness of a paper.
- The user asks for the level of evidence, risk of bias, or GRADE assessment.
- The user asks "is this study good?", "should I trust this finding?", "what's the level of evidence?".
- After `extract-pico` has run and the user wants the next step (critical appraisal).

## When NOT to use

- The user asks only to extract or summarize content (use `extract-pico`).
- The user asks about clinical relevance for practice (use `clinical-relevance`).

## Inputs expected

- A biomedical paper (PDF or abstract) with sufficient methodological detail to assess.
- Optionally: prior `extract-pico` output to determine study type without re-detection.

## Workflow

1. **Resolve study type.** If extract-pico output is provided, use it. Otherwise, perform minimal inline type detection.

2. **Assign OCEBM 2011 Level of Evidence** (1 to 5) for the primary outcome / question. Use the official OCEBM 2011 table for the question type (therapy, diagnosis, prognosis, etc.).

3. **Select and apply the appropriate appraisal tool:**
   - `rct`, `cluster-rct`, `crossover-rct` → **ROB 2** (Cochrane Risk of Bias 2.0). Five domains: randomization process, deviations from intended interventions, missing outcome data, measurement of outcome, selection of reported result. Each domain: Low / Some concerns / High. Overall: Low / Some concerns / High.
   - `systematic-review` → **AMSTAR-2** (16 items, identifying 7 critical domains). Overall confidence: High / Moderate / Low / Critically low.
   - `cohort-prospective`, `cohort-retrospective`, `case-control` → **Newcastle-Ottawa Scale (NOS)** with separate versions for cohort vs case-control. Stars per domain, max 9.
   - `diagnostic-accuracy` → **QUADAS-2**. Four domains × (risk of bias + applicability). Each: Low / High / Unclear.
   - `prognostic-model` → **PROBAST**. Four domains: participants, predictors, outcome, analysis.
   - `clinical-practice-guideline` → **AGREE II** (23 items, 6 domains). Score per domain as percentage.
   - `qualitative` → **CASP Qualitative checklist** (10 items).
   - `case-report`, `case-series` → **JBI Critical Appraisal Checklist** for case reports/series.
   - `non-randomized-controlled`, observational studies of interventions → **ROBINS-I**.

4. **For studies with quantifiable primary outcomes, apply GRADE certainty:**
   - Start at High (RCT) or Low (observational).
   - Downgrade for: risk of bias, inconsistency (if applicable), indirectness, imprecision, publication bias.
   - Upgrade for: large effect, dose-response, plausible confounding would reduce effect.
   - Output: Very Low / Low / Moderate / High + rationale.

5. **Generate item-level scoring**, not just overall scores. Each tool's items as separate JSON fields.

6. **Highlight study-type-specific red flags:**
   - RCT: unequal baseline groups, post-hoc subgroup analyses, modified primary endpoint, industry funding without independent data analysis, lack of trial registration before enrollment, large loss to follow-up (>20%).
   - Diagnostic accuracy: no reference standard for all participants, partial verification bias, spectrum bias (case-control design for diagnostic), inappropriate exclusions.
   - SR: missing protocol/registration (PROSPERO), no risk-of-bias assessment, no investigation of heterogeneity, no publication bias assessment when ≥10 studies.

7. **Output JSON first, then Spanish narrative.**

## Output schema

See `schema.json` in this skill folder for the formal JSON schema. Key top-level fields:

````json
{
  "study_type_resolved": "rct",
  "ocebm_level": 2,
  "ocebm_question_type": "therapy | diagnosis | prognosis | harm | screening",
  "appraisal_tool": "rob-2",
  "appraisal_applicable": true,
  "rob_2": {
    "domain_1_randomization": {"judgment": "low | some-concerns | high", "rationale": "..."},
    "domain_2_deviations": {"judgment": "...", "rationale": "..."},
    "domain_3_missing_data": {"judgment": "...", "rationale": "..."},
    "domain_4_measurement": {"judgment": "...", "rationale": "..."},
    "domain_5_selection_of_reported_result": {"judgment": "...", "rationale": "..."},
    "overall": "low | some-concerns | high"
  },
  "grade_assessment": {
    "outcome": "primary outcome name",
    "starting_certainty": "high | low",
    "downgrades": [{"reason": "risk-of-bias | inconsistency | indirectness | imprecision | publication-bias", "magnitude": 1, "rationale": "..."}],
    "upgrades": [],
    "final_certainty": "very-low | low | moderate | high",
    "rationale": "..."
  },
  "red_flags": ["..."],
  "appraiser_overall_judgment": "trustworthy | trustworthy-with-caveats | use-with-caution | unreliable",
  "appraisal_confidence": "high | medium | low"
}
````

After the JSON block, provide a Spanish narrative summary structured as:

```
## Valoración crítica

**Tipo de estudio resuelto:** ...
**Nivel de evidencia OCEBM:** ...
**Herramienta de valoración:** ...
**Riesgo de sesgo (resumen por dominios):** ...
**Certeza GRADE para resultado principal:** ...
**Señales de alerta (red flags):** ...
**Juicio global del valorador:** confiable / confiable con reservas / usar con precaución / no fiable
**Confianza en la valoración:** alta / media / baja — razón
```

## Failure modes

- **Tool not applicable** (editorial, commentary, scoping review when no clear tool fits): set `appraisal_applicable: false` and explain.
- **Editorial/commentary/case report receiving formal RoB tool:** don't force it. Use JBI for case reports/series, narrative judgment for editorials.
- **Insufficient information to judge a domain:** mark domain as "no information" or NOS-equivalent; do not guess.
- **Abstract only, full text not available:** many domains will be "no information"; set `appraisal_confidence: "low"`.

## Output language

Respond in es-ES for narrative section. JSON in English (field names, enum values, framework names are English-language conventions).
