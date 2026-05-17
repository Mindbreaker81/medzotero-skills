---
name: compare-guidelines
description: Compare a paper or set of papers against current clinical practice guidelines from major pulmonology societies (SEPAR, ATS, ERS, BTS, CHEST, GOLD, GINA, IASLC, ESMO, NICE, AASM, etc.). Determines whether the paper aligns with, extends, refines, contradicts current guideline recommendations, or is premature to change them; identifies specific guideline statements affected; and assesses the strength of evidence in the paper relative to the strength of the current recommendation. Use when the user asks "what do guidelines say about this", "does this contradict current practice", "should guidelines change", "is this consistent with SEPAR/ATS/ERS/GOLD/GINA", "comparar con guías", or any query involving guideline context for a paper.
---

# Compare Guidelines

## Purpose

Provide guideline context for a paper (or small set of papers), identifying alignment, extension, refinement, contradiction, or prematurity relative to current recommendations. Output is JSON-first (machine-readable for the future plugin), followed by a Spanish narrative for the clinician.

## Critical constraint: knowledge cutoff caveat

**This skill requires the model to be honest about the limits of its training-time knowledge. Guidelines change.** The model MUST:

1. State which **version/year** of each guideline it is referencing.
2. Flag explicitly when uncertain whether a guideline has been updated since the model's training cutoff.
3. Recommend that the user verify current recommendations against the **live guideline source** (URL or society website).
4. Never invent a guideline or a recommendation. If a topic is not covered by a major guideline (to the best of the model's knowledge), say so.

The `knowledge_cutoff_caveat` field in the JSON output and the corresponding sentence in the Spanish narrative are **not optional**.

## When to use

- The user asks how a paper relates to current guidelines (SEPAR, ATS, ERS, GOLD, GINA, IASLC, ESMO, NICE, AASM, etc.).
- The user asks whether a finding contradicts current practice or whether guidelines should change.
- After `extract-pico` + `appraise-evidence` have run, when the user wants the guideline-context layer.
- The user wants to prepare a journal club, MDD discussion, or position statement that needs guideline grounding.

## When NOT to use

- The user has not provided a specific paper or finding and only asks "what do guidelines say about X" (this is a guideline-summary question, not a comparison).
- The clinical topic is outside the model's areas of confident guideline knowledge — in that case, reduce confidence and recommend the user consult the source directly.

## Inputs expected

- A paper (Zotero item, abstract, or full text), or a small set of papers on a focused question.
- **Strongly preferred:** outputs of `extract-pico` and `appraise-evidence` (so the comparison can use the paper's strength of evidence and OCEBM/GRADE assessment).
- Optionally: the specific society or societies the user wants compared against (e.g., "compare against SEPAR-EPOC and GOLD 2024").

## Workflow

### 1. Identify the relevant guideline(s) by clinical topic

**CRITICAL:** Only include guidelines that are **directly relevant** to the paper's specific clinical topic. Do not include guidelines for related but different conditions (e.g., for pulmonary embolism, do NOT include guidelines for coronary artery disease, valvular disease, or atrial fibrillation). Relevance must be strict and specific.

Map the paper's clinical topic to the major guidelines. The model should recall as many of the following as it confidently knows; for each, **state the version/year explicitly** in the output:

- **COPD:** GOLD (annual updates), SEPAR-EPOC (GesEPOC), ERS/ATS COPD documents, NICE COPD.
- **Asthma:** GINA (annual), GEMA (SEPAR/SEAIC, periodic), ERS asthma documents, NICE asthma.
- **Lung cancer:** IASLC TNM staging (8th / 9th ed.), NCCN, ESMO, ASCO, NICE, SEPAR (Normativa SEPAR cáncer de pulmón).
- **Lung cancer screening:** USPSTF, NCCN, SEPAR, ESR/ERS position paper.
- **Pulmonary nodules:** Fleischner Society, BTS, ACCP, Lung-RADS.
- **Interstitial lung disease:** ATS/ERS/JRS/ALAT (IPF 2018, IPF 2022 update; progressive pulmonary fibrosis 2022).
- **Sarcoidosis:** ATS/ERS/WASOG, ERS clinical practice guideline.
- **Pleural disease:** BTS, ERS, ATS, SEPAR (Normativa SEPAR derrame pleural).
- **Non-tuberculous mycobacteria:** ATS/ERS/ESCMID/IDSA 2020.
- **Pulmonary hypertension:** ESC/ERS (most recent: 2022).
- **Sleep / SAHS:** AASM, SEPAR sueño (Documento Internacional de Consenso sobre AOS).
- **Interventional pulmonology / bronchoscopy:** ACCP, ERS, SEPAR (Normativa SEPAR de broncoscopia y técnicas intervencionistas).
- **Cystic fibrosis:** CFF, ECFS.
- **Tuberculosis:** WHO, NICE, ATS/CDC/IDSA, SEPAR-TB.
- **Pneumonia (CAP/HAP):** ATS/IDSA, ERS/ESCMID/ALAT, BTS, SEPAR (Normativa SEPAR neumonía).
- **VTE / pulmonary embolism:** ESC 2019/2020 Guidelines, ACCP (CHEST) 2016, ATS 2012, SEPAR (Normativa SEPAR TEP 2021). ONLY these — do NOT include coronary syndrome, valvular disease, or atrial fibrillation guidelines.
- **Coronary artery disease / acute coronary syndrome:** ESC, AHA/ACC — ONLY for cardiac topics, not for pulmonary embolism.
- **Valvular heart disease:** ESC/EACTS — ONLY for valvular topics.
- **Atrial fibrillation:** ESC, AHA/ACC/HRS — ONLY for arrhythmia topics.

For topics outside this list (or where the model is uncertain about the most recent version), explicitly say so and reduce `confidence`.

### 2. Locate the specific guideline statement(s) affected

For each relevant guideline:

- Quote the recommendation as exactly as the model can recall (acknowledging that quotation may be approximate).
- State the recommendation **strength** (e.g., "Strong recommendation", "Conditional/Weak recommendation").
- State the **certainty of evidence** behind the recommendation in the guideline (e.g., "moderate certainty", "high quality").
- State the **year** of the recommendation.

If the model cannot recall the specific text precisely, paraphrase **and flag this as approximate** in the rationale.

### 3. Classify alignment

For each guideline, choose ONE of:

- **`aligned`** — paper supports the current recommendation; no change needed.
- **`extends`** — paper adds new information that complements but does not change the recommendation (e.g., new population, new outcome, new subgroup).
- **`refines`** — paper suggests a refinement to the recommendation (e.g., narrower indication, modified dose, modified threshold).
- **`contradicts`** — paper findings contradict the current recommendation in direction or magnitude.
- **`premature-to-change`** — paper is interesting but the evidence is too weak (single small study, surrogate endpoint, no replication, high RoB) to change the recommendation, regardless of direction.

If multiple guidelines are involved and they classify differently, present each separately rather than synthesizing into a single judgment.

### 4. Assess relative strength of evidence

Compare:

- **Strength of evidence in the paper** (from `appraise-evidence` if available — OCEBM level, ROB 2 / NOS / QUADAS-2 etc., GRADE for primary outcome).
- **Strength of evidence behind the current recommendation** (as stated in the guideline).

Choose ONE of:

- `paper-stronger` — paper's evidence is stronger than what underpins the current recommendation.
- `paper-weaker` — paper's evidence is weaker than what underpins the current recommendation.
- `comparable` — broadly similar strength.
- `not-directly-comparable` — different question types or evidence frameworks.

### 5. Recommend action

- **Continue current practice as recommended** — paper does not justify change.
- **Continue current practice but monitor for guideline update** — paper is suggestive; await formal review.
- **Discuss in MDD / tumor committee / multidisciplinary meeting** before changing individual practice.
- **Wait for replication or additional evidence** before changing.
- **Consider individualized practice change** when paper's evidence is strong and patient circumstances align (with explicit caveats).

### 6. Always output the knowledge cutoff caveat

Include in the JSON (`knowledge_cutoff_caveat`) and in the Spanish narrative a short statement of the form:

> "Las recomendaciones citadas reflejan el conocimiento del modelo en el momento de su entrenamiento. Las guías se actualizan periódicamente. Verifique la versión vigente en [URL/sociedad]."

Provide the URL or society website for each cited guideline when known.

## Output schema

See `schema.json` in this skill folder for the formal JSON schema. Key top-level fields:

```json
{
  "clinical_topic": "...",
  "paper_summary_for_comparison": "...",
  "relevant_guidelines": [
    {
      "society": "SEPAR",
      "title": "...",
      "year": 2023,
      "version": "...",
      "specific_recommendation_quoted": "...",
      "recommendation_is_paraphrased": false,
      "recommendation_strength": "strong | conditional | weak | not-stated",
      "evidence_certainty_in_guideline": "high | moderate | low | very-low | not-stated",
      "alignment": "aligned | extends | refines | contradicts | premature-to-change",
      "rationale": "...",
      "guideline_url": "..."
    }
  ],
  "overall_alignment": "aligned | extends | refines | contradicts | premature-to-change | mixed",
  "relative_evidence_strength": "paper-stronger | paper-weaker | comparable | not-directly-comparable",
  "recommended_action": "continue-current-practice | monitor-for-guideline-update | discuss-in-mdd | wait-for-replication | consider-individualized-change",
  "recommended_action_rationale": "...",
  "knowledge_cutoff_caveat": "Model training cutoff is YYYY-MM. Guidelines may have been updated since. Verify current versions at the cited society websites.",
  "confidence": "high | medium | low",
  "comparison_notes": "..."
}
```

After the JSON block, provide a Spanish narrative summary structured as:

```
## Comparación con guías clínicas

**Tema clínico:** ...
**Resumen del paper para la comparación:** ...

### Guías relevantes
- **[Sociedad, año, versión]** — Recomendación: "..." (fuerza: ...; certeza: ...). Alineación: ...
  - Razón: ...
  - URL: ...
- ...

### Fuerza relativa de la evidencia
**Paper vs guía:** [más fuerte / más débil / comparable / no directamente comparable] — razón

### Acción recomendada
... — razón

### Caveat sobre actualización de guías
Las recomendaciones citadas reflejan el conocimiento del modelo en el momento de su entrenamiento. Las guías se actualizan periódicamente. **Verifique la versión vigente en [URL/sociedad].**

**Confianza de la comparación:** alta / media / baja — razón
```

## Specialty-specific recognition

This kit is built for an interventional pulmonologist. Prioritize correct recognition of:

**Procedures:** EBUS-TBNA, EUS-FNA, navegación electromagnética (ENB), broncoscopia robótica (Monarch, Ion), criobiopsia transbronquial, biopsia pleural, pleuroscopia, stent traqueobronquial, ablación, válvulas endobronquiales.

**Conditions:** EPOC (estadios GOLD), asma (GINA), nódulo pulmonar (Fleischner, Lung-RADS), cáncer de pulmón (TNM IASLC 8ª/9ª ed.), fibrosis pulmonar idiopática (ATS/ERS/JRS/ALAT 2018/2022), sarcoidosis, micobacteriosis no tuberculosa (ATS/ERS/ESCMID/IDSA 2020), neumonía, derrame pleural (Light), hipertensión pulmonar (WSPH; ESC/ERS 2022).

**Spanish context:** Citar sistemáticamente la **Normativa SEPAR** correspondiente (ej. Normativa SEPAR de broncoscopia, GesEPOC, GEMA, Normativa SEPAR de derrame pleural) cuando exista, junto con la guía internacional. Indicar diferencias relevantes entre la guía SEPAR y la internacional cuando las haya.

## Failure modes

- **Model uncertain whether a guideline has been updated:** explicitly flag in `rationale` and `recommended_action_rationale`; recommend verification; reduce `confidence`.
- **Multiple conflicting guidelines from different societies:** present each separately with its own `alignment`. Set `overall_alignment: "mixed"` and explain the divergence in `comparison_notes`.
- **Topic not covered by any major guideline (to the best of the model's knowledge):** mark as such in `comparison_notes`; do not invent a guideline. Set `relevant_guidelines: []` and `overall_alignment` accordingly.
- **Paper is too weak (single small study, surrogate, no replication, high RoB):** set `alignment: "premature-to-change"` regardless of effect size or direction. This is the conservative default for individual studies against established guidelines.
- **Paper is non-clinical (basic, editorial, commentary):** set `confidence: "low"` and explain that the paper does not directly support a guideline change; comparison is informational at best.
- **Quoted recommendation is approximate:** set `recommendation_is_paraphrased: true` and warn the reader to verify the exact wording in the source guideline.

## Examples

See `examples/aligned-guideline-example.md` and `examples/contradicts-guideline-example.md` for fully worked examples on synthetic interventional pulmonology papers.

## Output language

Respond in es-ES for the narrative section. JSON remains in English (field names and enum values follow English-language conventions). Within JSON string values, **preserve guideline statements in their original language** with a Spanish translation if helpful (especially for SEPAR Spanish text and ATS/ERS/GOLD English text).
