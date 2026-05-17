---
name: clinical-relevance
description: Assess whether a biomedical paper changes clinical practice for the user's specialty (interventional pulmonology, Spain). Distinguishes statistical significance from clinical significance, evaluates population applicability to typical Spanish pulmonary patients, considers availability of interventions in the Spanish healthcare system (SNS) and AEMPS drug approval status, and outputs an actionable judgment. Use after extract-pico and appraise-evidence have run, or independently when the user asks "does this change my practice", "is this clinically relevant", "should I act on this", "is this applicable to my patients", "is this practice-changing", "relevancia clínica".
---

# Clinical Relevance

## Purpose

Translate a paper's findings into a practical, contextualized clinical judgment for an interventional pulmonologist practicing in Spain. Answer the direct question: does this change what I do tomorrow in clinic?

## When to use

- The user asks whether a paper is clinically relevant to their practice.
- The user asks "does this change my practice?", "should I act on this?", "is this practice-changing?".
- The user asks about applicability to Spanish patients or the SNS.
- After `extract-pico` and `appraise-evidence` have run, when the user wants the final step: translation to practice.

## When NOT to use

- The user only wants to extract PICO or perform critical appraisal (use those skills first).
- The user asks a definitional or background question not tied to a specific paper.

## Inputs expected

Best with PICO + appraisal already extracted. Falls back to abstract-only if needed.

## Workflow

Evaluate the paper against these five dimensions:

### 1. Effect magnitude — clinical vs statistical significance

Is the effect size clinically meaningful, regardless of p-value? Use established minimal clinically important differences (MCID) when known:

**Pulmonary MCIDs:**
- 6MWD: 30 m (chronic respiratory disease)
- FEV1: 100 mL or 10% of baseline (COPD trials)
- mMRC: 1 point
- CAT: 2 points
- SGRQ: 4 points
- K-BILD: 5 points (ILD)

**For diagnostic studies:** Is the diagnostic yield improvement large enough to change a workflow?

**For survival:** Is the absolute risk reduction (ARR) meaningful, not just relative risk reduction (RRR)?

### 2. Population applicability to Spanish pneumology patients

- Age distribution, sex, smoking history typical of the trial vs. typical SNS pulmonary patient.
- Exclusion criteria that would exclude most real patients (e.g., GOLD trial that excludes anyone with FEV1 < 50% predicted is a red flag for applicability).
- Geographic/ethnic representation.

### 3. Intervention availability in Spain

**For drugs:**
- AEMPS approval status
- SNS funding (financiación SNS)
- Indication específica
- Restricciones autonómicas si aplica

**For procedures:** Disponibilidad real en hospitales del SNS:
- Navegación electromagnética: disponible en pocos centros
- Criobiopsia transbronquial: cada vez más extendida
- Broncoscopia robótica (Monarch, Ion): todavía rara

**For diagnostic tests:** Disponibilidad en el laboratorio clínico habitual.

### 4. Translation to practice — specific actions

- Does this change a workflow you currently use?
- Does it support a workflow you already use (confirmatory)?
- Does it contradict current practice (and how strongly)?
- Are there implementation barriers?

### 5. Patient-relevant outcomes vs surrogate endpoints

- Is the primary endpoint patient-important (mortality, hospitalization, symptoms, quality of life) or a surrogate (biomarker, imaging finding, lung function alone)?
- If surrogate: is there evidence linking the surrogate to patient outcomes?

## Output schema

See `schema.json` in this skill folder for the formal JSON schema. Key top-level fields:

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

After the JSON block, provide a Spanish narrative summary structured as:

```
## Relevancia clínica

**¿Cambia mi práctica?** sí / sí con reservas / confirma práctica actual / no aplicable / prematuro
**Magnitud del efecto:** ... (significancia clínica vs estadística, MCID si aplica)
**Aplicabilidad al paciente del SNS:** ... (ajuste poblacional, exclusiones clave)
**Disponibilidad en España:** ... (AEMPS, financiación SNS, disponibilidad real)
**Outcomes relevantes para el paciente:** ... (patient-important vs surrogate)
**Acciones concretas:** ...
**Barreras de implementación:** ...
**Confianza del juicio:** alta / media / baja — razón
```

## Specialty-specific recognition

This kit is built for an interventional pulmonologist. Prioritize correct recognition of:

**Procedures:** EBUS-TBNA, EUS-FNA, navegación electromagnética (ENB), navegación virtual, broncoscopia robótica (Monarch, Ion), criobiopsia transbronquial, biopsia de pulmón quirúrgica (VATS), toracocentesis, biopsia pleural, pleuroscopia, colocación de stent traqueobronquial, ablación por radiofrecuencia/microondas, valvulopulmonar (válvulas endobronquiales).

**Conditions:** EPOC (estadios GOLD), asma (estadios GINA), nódulo pulmonar (criterios Fleischner, Lung-RADS, Brock model, Mayo Clinic model), cáncer de pulmón (estadios TNM IASLC 8ª/9ª ed.), fibrosis pulmonar idiopática (criterios ATS/ERS/JRS/ALAT), sarcoidosis (estadios Scadding), micobacteriosis no tuberculosa (criterios ATS/ERS/ESCMID/IDSA 2020), neumonía adquirida en la comunidad, derrame pleural (criterios Light), hipertensión pulmonar (clasificación clínica WSPH).

**Outcomes específicos:** diagnostic yield, sensitivity, specificity, PPV, NPV, AUC, recurrence rate, complication rate (specifically: pneumothorax, hemorrhage, infection, chest tube placement), all-cause mortality, disease-specific mortality, time-to-progression, progression-free survival, overall survival, quality-adjusted life year (QALY).

**SEPAR/SNS context:** Refer to SEPAR guidelines (GEMEPOC, GESNEUMOCARDIA, GETECC, etc.) when relevant. Consider SNS funding restrictions (e.g., biologic therapy for severe asthma only after GINA step 4 failure, nintedanib/pirfenidone only for IPF with confirmed HRCT pattern).

## Failure modes

- **Single small study with non-replicated finding** → mark `practice_changing: "premature"` regardless of effect size.
- **Industry-funded, single-center, surrogate endpoint** → `"premature"` until replication.
- **Don't extrapolate beyond the population studied.** If a trial enrolled non-smokers, don't conclude relevance for smokers.
- **Abstract only, full text not available.** Set `confidence_in_judgment: "low"` and note "Abstract-only assessment; full text not parsed."

## Examples

See `examples/practice-changing-rct-example.md` and `examples/premature-singlecenter-example.md` for fully worked examples.

## Output language

Respond in es-ES for the narrative section. JSON remains in English (field names and enum values are English-language conventions). Within JSON string values, preserve original-language terms when they appear in the source paper.
