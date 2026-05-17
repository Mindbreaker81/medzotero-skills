---
name: synthesize-collection
description: Synthesize evidence across multiple biomedical papers (e.g., a Zotero collection or a set of papers on the same clinical question). Produces an evidence map, consistency assessment across studies, aggregated quality summary, identification of evidence gaps, and practice implications. Use when the user has multiple papers on the same topic and asks for a synthesis, evidence summary, "what does the evidence say about X", "summarize my collection on Y", "where are the gaps in evidence", "síntesis de evidencia", or anything implying cross-paper synthesis.
---

# Synthesize Collection

## Purpose

Generate a clinician-oriented evidence synthesis across N papers on a related clinical question. This is **not a formal systematic review** — it is a working synthesis to support clinical decision-making, journal club preparation, or guideline review.

Output is JSON-first (machine-readable for the future plugin), followed by a Spanish narrative organized as evidence map, consistency, aggregate quality, gaps, and practice implications.

## When to use

- The user has selected multiple papers in Zotero (or a whole collection) and asks for a combined view.
- The user asks "what does the evidence say about X", "summarize my collection on Y", "where are the gaps in evidence on Z".
- The user wants to prepare a journal club, a guideline review, or a chapter draft from a curated set.
- After `extract-pico` and `appraise-evidence` have run on individual papers, when the user wants the cross-paper view.

## When NOT to use

- A single paper is provided (use `extract-pico` + `appraise-evidence` + `clinical-relevance`).
- The papers span clearly different clinical questions (ask the user to narrow the set first).
- The user wants a formal systematic review with PRISMA, search strategy, dual screening, etc. This skill produces a working synthesis, not a methodologically rigorous SR.

## Inputs expected

- A list of papers as one of:
  - Zotero items (with attached PDFs or abstracts).
  - References / citations.
  - Pasted text content (titles + abstracts, optionally full text).
- **Strongly preferred:** each paper has already been processed with `extract-pico` and `appraise-evidence`. If not, perform a lightweight version of those inline (study type + PICO + RoB summary) before synthesizing.
- **Optional but recommended:** the focused clinical question the user wants the synthesis to address. If not provided, infer it from the papers and confirm with the user before producing the full synthesis.

**Token economy note:** With 10-20 papers, full-text input can easily reach 50-200K tokens. Prefer abstracts + the most relevant extracted passages (results section, conclusions, key tables). Full text of all papers should only be used when truly needed and the model has the context window to handle it.

## Workflow

### 0. CRITICAL: Do NOT modify Zotero metadata

**When running in LLM-for-Zotero Agent Mode:**
- NEVER modify title, authors, journal, year, or any Zotero item metadata.
- ONLY read and analyze papers for synthesis.
- If you need to find related papers, use Zotero search but DO NOT modify any item.
- If only one paper is selected, ask the user if they want you to search their Zotero collection for related papers on the same topic, or if they want to paste additional paper abstracts. DO NOT automatically search or modify the selected paper.

**When searching Zotero collection for related papers:**
- Use SPECIFIC search terms from the selected paper: title keywords, first author, year, journal.
- Search for the specific clinical question/intervention/comparator (e.g., "azithromycin bronchiectasis BAT EMBRACE").
- Filter by item type: only include original research articles (RCTs, cohort studies, case series). EXCLUDE guidelines, reviews, editorials, commentaries unless explicitly requested.
- Limit search to the user's Zotero library — do NOT search outside sources.
- If the search returns too many irrelevant results (e.g., treatment guidelines instead of original studies), ask the user to paste the specific papers they want synthesized or to narrow the search terms.

### 1. Clarify the clinical question

If not provided, infer it from the papers and confirm with the user before proceeding. Format as PICO if possible (or PIO / PIRD for non-intervention questions). State explicitly:

- Population
- Intervention or exposure or index test
- Comparator (if applicable)
- Outcome(s) of interest

If the papers do not converge on a single question, **stop and ask the user to narrow the set**. Do not force a synthesis across heterogeneous questions.

### 2. Build an evidence map table

One row per study. Columns:

- First author, year, country
- Study design
- N (analyzed)
- Population summary (one line)
- Intervention or exposure
- Comparator
- Primary outcome + effect size + 95% CI (if reported)
- OCEBM level (if known from `appraise-evidence`)
- RoB / quality summary (if known)
- Key limitations (one line)
- Funding (one line; flag industry funding)

Output as JSON array (`evidence_map`) and as a markdown table in the Spanish narrative.

### 3. Assess consistency across studies

- **Direction of effect:** consistent / mixed / conflicting.
- **Magnitude consistency:** are effect sizes broadly similar, or do they vary substantially?
- **If discordant, what factors might explain it?**
  - Population differences (severity, age, comorbidities, ethnicity).
  - Intervention differences (dose, duration, technology platform, operator experience).
  - Methodological differences (RCT vs observational, blinding, outcome definition).
  - Era of study (older studies may reflect outdated standard of care).
  - Industry vs independent funding.

### 4. Aggregate quality

- **Distribution of study designs:** e.g., "3 RCTs, 5 prospective cohort, 2 case series".
- **Distribution of risk of bias:** e.g., "2 RCTs low-risk, 1 with some concerns; 3 cohort with NOS 7-8/9, 2 with NOS 5-6/9".
- **GRADE-style overall certainty for the primary outcome** (if assessable). Start at High for body of RCT evidence or Low for body of observational evidence; downgrade for risk of bias, inconsistency, indirectness, imprecision, publication bias; upgrade for large effect, dose-response, plausible confounding reducing effect.

### 5. Identify evidence gaps

- **Populations underrepresented:** pediatric, elderly, severe disease, women, comorbidities, non-Caucasian.
- **Outcomes not studied:** long-term safety, quality of life, cost-effectiveness, hard endpoints (mortality, hospitalization).
- **Comparators not tested:** head-to-head against current standard of care, against newer alternatives.
- **Settings not studied:** primary care vs tertiary, low-resource, real-world vs trial.
- **Methodological gaps:** no RCT exists, no replication, no independent validation, no pre-registration.

### 6. Practice implications

- **Supported:** what does the body of evidence support doing?
- **Not supported:** what does it support not doing (or stopping)?
- **Requires individualization:** what depends on patient-level factors not consistently addressed by the evidence?
- **High-priority research:** where would additional studies most change practice?

## Output schema

See `schema.json` in this skill folder for the formal JSON schema. Key top-level fields:

```json
{
  "clinical_question": "...",
  "number_of_studies": 10,
  "study_designs_summary": {"rct": 3, "cohort-prospective": 5, "case-series": 2},
  "evidence_map": [
    {
      "study_id": "Smith2024",
      "design": "rct",
      "country": "United States",
      "n": 234,
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

After the JSON block, provide a Spanish narrative organized as:

```
## Síntesis de evidencia

**Pregunta clínica (PICO):** ...

### Mapa de evidencia

| Estudio | Diseño | N | Población | Intervención | Comparador | Resultado principal | OCEBM | RoB | Limitaciones | Financiación |
|---------|--------|---|-----------|--------------|------------|---------------------|-------|-----|--------------|--------------|
| ...     | ...    |...| ...       | ...          | ...        | ...                 | ...   | ... | ...          | ...          |

### Consistencia y discordancia
- **Dirección del efecto:** ...
- **Magnitud:** ...
- **Posibles explicaciones de discordancia:** ...

### Calidad global
- **Distribución de diseños:** ...
- **Distribución de riesgo de sesgo:** ...
- **Certeza GRADE para el resultado principal:** ... — razón

### Gaps de evidencia
- ...

### Implicaciones para la práctica
- **Apoyado por la evidencia:** ...
- **No apoyado:** ...
- **Requiere individualización:** ...
- **Investigación prioritaria:** ...

**Confianza de la síntesis:** alta / media / baja — razón
```

## Specialty-specific recognition

This kit is built for an interventional pulmonologist. Prioritize correct recognition of:

**Procedures:** EBUS-TBNA, EUS-FNA, navegación electromagnética (ENB), navegación virtual, broncoscopia robótica (Monarch, Ion), criobiopsia transbronquial, biopsia de pulmón quirúrgica (VATS), toracocentesis, biopsia pleural, pleuroscopia, colocación de stent traqueobronquial, ablación por radiofrecuencia/microondas, válvulas endobronquiales.

**Conditions:** EPOC (estadios GOLD), asma (estadios GINA), nódulo pulmonar (criterios Fleischner, Lung-RADS, Brock model, Mayo Clinic model), cáncer de pulmón (estadios TNM IASLC 8ª/9ª ed.), fibrosis pulmonar idiopática (criterios ATS/ERS/JRS/ALAT), sarcoidosis (estadios Scadding), micobacteriosis no tuberculosa (criterios ATS/ERS/ESCMID/IDSA 2020), neumonía adquirida en la comunidad, derrame pleural (criterios Light), hipertensión pulmonar (clasificación clínica WSPH).

**Outcomes específicos:** diagnostic yield, sensitivity, specificity, PPV, NPV, AUC, recurrence rate, complication rate (specifically: pneumothorax, hemorrhage, infection, chest tube placement), all-cause mortality, disease-specific mortality, time-to-progression, progression-free survival, overall survival, quality-adjusted life year (QALY).

When synthesizing pulmonology collections, use exact notation (e.g., GOLD 2 vs GOLD B; TNM IIIA vs IIIB; Lung-RADS 4A vs 4B). Do not paraphrase.

## Failure modes

- **Too few studies (<3):** mark `synthesis_confidence: "low"` and label the output as "narrative summary, not synthesis" in the Spanish narrative. Conclusions are tentative.
- **Studies too heterogeneous to synthesize meaningfully** (different populations, interventions, or outcomes that cannot be reasonably combined): do not force a synthesis. Output each study summary separately and write a paragraph explaining why combined inference is not supported. Set `consistency_assessment.direction_of_effect: "conflicting"` and detail in `explanations_for_discordance`.
- **Studies span different clinical questions:** ask the user to narrow the set before synthesizing. Do not invent a unifying question.
- **Abstracts only, no full text:** proceed but set `synthesis_confidence: "low"` and note "Abstract-only synthesis; effect sizes and CIs may be incomplete."
- **Industry funding dominates the body of evidence:** flag explicitly in `aggregate_quality.rationale` and consider downgrading GRADE for publication bias.
- **No replication / single trial dominates:** flag in `evidence_gaps` and downgrade GRADE for imprecision/publication bias as appropriate.

## Token economy

This skill is the most expensive in the kit. To control cost:

- Default to abstracts + a few key extracted passages per paper (not full text).
- If `extract-pico` outputs are available, use them as the primary input — they contain the structured fields needed for the evidence map.
- For collections >15 papers, ask the user whether to focus on the highest-quality subset (e.g., RCTs only, last 5 years only) before synthesizing the whole collection.

## Examples

See `examples/synthesis-consistent-evidence-example.md` and `examples/synthesis-heterogeneous-evidence-example.md` for fully worked examples on synthetic interventional pulmonology collections.

## Output language

Respond in es-ES for the narrative section. JSON remains in English (field names and enum values follow English-language conventions). Within JSON string values, preserve original-language terms when they appear in the source papers (e.g., scale names, technology platforms).
