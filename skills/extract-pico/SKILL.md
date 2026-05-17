---
name: extract-pico
description: Extract study type and structured PICO (Population, Intervention, Comparison, Outcome) from a biomedical paper. Detects study design first, then applies the appropriate extraction template — full PICO for RCTs and SRs, PIO for single-arm cohorts, PIRD for diagnostic accuracy, population-only for case series. Use whenever the user asks to analyze, summarize, extract from, or appraise a biomedical paper, even if PICO is not mentioned explicitly. Also trigger for queries like "what does this paper study", "what's the design of this study", or "summarize this clinical study".
---

# Extract PICO

## Purpose

Produce a machine-readable structured extraction from a biomedical paper that captures study design and the variant of PICO that fits that design. Output is JSON-first, with a Spanish narrative summary appended for the clinician.

## When to use

- The user opens or selects a paper in Zotero and asks anything about its content, design, or results.
- The user asks to "summarize", "review", "analyze", or "appraise" a paper.
- The user pastes an abstract or full text and asks what kind of study it is.

## When NOT to use

- The user asks a definitional or background question not tied to a specific paper.
- The user asks about a clinical case (not a paper).

## Inputs expected

Either:
- A Zotero item with attached PDF (full text preferred).
- An abstract pasted as text.
- A DOI/PMID for which metadata + abstract is retrievable.

Minimum viable input: title + abstract. With abstract only, several fields will be `null` and the JSON will reflect that.

## Workflow

1. **Detect study type first.** Read title and abstract. Classify as one of:
   - `rct` — randomized controlled trial (any randomization scheme)
   - `cluster-rct` — cluster-randomized trial
   - `crossover-rct` — crossover RCT
   - `n-of-1-trial` — N-of-1 trial
   - `non-randomized-controlled` — controlled but not randomized
   - `cohort-prospective`
   - `cohort-retrospective`
   - `case-control`
   - `cross-sectional`
   - `case-series` — ≥3 patients, no control
   - `case-report` — 1-2 patients
   - `diagnostic-accuracy` — index test vs reference standard
   - `prognostic-model` — derivation/validation of prediction model
   - `systematic-review` — SR with or without meta-analysis (note `meta_analysis: true/false`)
   - `scoping-review`
   - `narrative-review`
   - `clinical-practice-guideline`
   - `economic-evaluation`
   - `qualitative`
   - `mixed-methods`
   - `basic-translational` — bench, animal, in vitro
   - `editorial-commentary`
   - `protocol` — study protocol, not results
   - `other` — only if none fit; include explanation in narrative

2. **Apply the appropriate extraction template** based on study type:
   - For `rct`, `cluster-rct`, `crossover-rct`, `non-randomized-controlled`, `systematic-review` (of interventions): full PICO.
   - For `cohort-prospective`, `cohort-retrospective`, `case-series`: PIO (no comparator).
   - For `case-control`: P, exposure, outcome (no I/C in classic sense).
   - For `diagnostic-accuracy`: PIRD — Population, Index test, Reference standard, target Disorder.
   - For `prognostic-model`: Population, Predictors, Outcome, model type, validation status.
   - For `case-report`, `editorial-commentary`, `basic-translational`: population only; mark `pico_applicable: false`.

3. **Extract sample size details** with the granularity:
   - `screened` (assessed for eligibility)
   - `enrolled` (met eligibility, included)
   - `analyzed` (in ITT or primary analysis)
   - `lost_to_followup`
   - `analysis_type`: `"itt" | "per-protocol" | "modified-itt" | "as-treated" | "complete-case" | null`

   If only one number is reported, put it in the most specific applicable field and leave others `null`.

4. **Extract primary and secondary outcomes** as separate arrays. For each outcome capture: name, measurement timing, direction of effect (if reported), effect size with 95% CI, p-value if relevant.

5. **Extract funding and conflicts of interest** as free-text fields. Critical for downstream appraisal.

6. **Output JSON first, then Spanish narrative summary.**

## Output schema

See `schema.json` in this skill folder for the formal JSON schema. Key top-level fields:

````json
{
  "study_type": "rct",
  "meta_analysis": null,
  "pico_applicable": true,
  "pico": {
    "population": {
      "description": "...",
      "key_inclusion_criteria": ["..."],
      "key_exclusion_criteria": ["..."],
      "setting": "...",
      "country_or_region": "..."
    },
    "intervention": {
      "description": "...",
      "dose_or_intensity": "...",
      "duration": "..."
    },
    "comparison": {
      "description": "...",
      "type": "placebo | active-comparator | standard-of-care | no-treatment | historical-control"
    },
    "outcomes": {
      "primary": [{"name": "...", "measurement": "...", "effect": "...", "ci_95": "...", "p_value": null}],
      "secondary": [...],
      "safety": [...]
    }
  },
  "sample_size": {
    "screened": null,
    "enrolled": null,
    "analyzed": null,
    "lost_to_followup": null,
    "analysis_type": null
  },
  "duration": {
    "enrollment_period": "...",
    "follow_up_median": "...",
    "follow_up_range": "..."
  },
  "funding": "...",
  "conflicts_of_interest": "...",
  "registration": {"id": "NCT12345678", "registry": "ClinicalTrials.gov"} ,
  "key_limitations_stated_by_authors": ["..."],
  "extraction_confidence": "high | medium | low",
  "extraction_notes": "..."
}
````

After the JSON block, provide a Spanish narrative summary structured as:

```
## Resumen estructurado

**Tipo de estudio:** ...
**Pregunta clínica:** ...
**Población:** ...
**Intervención (o exposición / test):** ...
**Comparador:** ...
**Resultado principal:** ...
**Resultados clave:** ...
**Limitaciones declaradas:** ...
**Confianza de la extracción:** alta / media / baja — razón
```

## Specialty-specific recognition

This kit is built for an interventional pulmonologist. Prioritize correct recognition of:

- **Procedures:** EBUS-TBNA, EUS-FNA, navegación electromagnética (ENB), navegación virtual, broncoscopia robótica (Monarch, Ion), criobiopsia transbronquial, biopsia de pulmón quirúrgica (VATS), toracocentesis, biopsia pleural, pleuroscopia, colocación de stent traqueobronquial, ablación por radiofrecuencia/microondas, valvulopulmonar (válvulas endobronquiales).
- **Conditions:** EPOC (estadios GOLD), asma (estadios GINA), nódulo pulmonar (criterios Fleischner, Lung-RADS, Brock model, Mayo Clinic model), cáncer de pulmón (estadios TNM IASLC 8ª/9ª ed.), fibrosis pulmonar idiopática (criterios ATS/ERS/JRS/ALAT), sarcoidosis (estadios Scadding), micobacteriosis no tuberculosa (criterios ATS/ERS/ESCMID/IDSA 2020), neumonía adquirida en la comunidad, derrame pleural (criterios Light), hipertensión pulmonar (clasificación clínica WSPH).
- **Outcomes específicos:** diagnostic yield, sensitivity, specificity, PPV, NPV, AUC, recurrence rate, complication rate (specifically: pneumothorax, hemorrhage, infection, chest tube placement), all-cause mortality, disease-specific mortality, time-to-progression, progression-free survival, overall survival, quality-adjusted life year (QALY).

When these appear, extract them at full fidelity. Do not paraphrase TNM stages or GOLD groups — use the exact notation in the paper.

## Failure modes

- **Abstract only, full text not available.** Many fields will be `null`. Set `extraction_confidence: "low"` and note "Abstract-only extraction; full text not parsed."
- **Non-English paper.** Process normally; output JSON in English with original-language terms preserved where needed. Spanish narrative in Spanish.
- **Conference abstract / preprint.** Process normally but note in `extraction_notes`.
- **Editorial, letter, commentary.** Set `pico_applicable: false`. Do not invent PICO.
- **Retracted paper.** If the paper is flagged as retracted in metadata, prominently note this at the top of the narrative summary.

## Examples

See `examples/rct-example.md` and `examples/cohort-example.md` for fully worked examples on real interventional pulmonology papers.

## Output language

Respond in es-ES for the narrative section. JSON remains in English (field names and enum values are English-language conventions). Within JSON string values, preserve original-language terms when they appear in the source paper.
