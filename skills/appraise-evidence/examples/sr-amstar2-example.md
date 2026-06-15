# Example: Systematic review with AMSTAR-2 assessment — Macrolides for non-CF bronchiectasis

## Paper metadata (synthetic)

**Title:** Long-term macrolide therapy for the prevention of exacerbations in adults with non-cystic fibrosis bronchiectasis: a systematic review and meta-analysis
**Authors:** Ferreira et al.
**Journal:** European Respiratory Journal, 2023
**Study type:** Systematic review with meta-analysis of randomized controlled trials
**Population:** Adults with non-CF bronchiectasis and ≥2 exacerbations in the prior year
**Intervention:** Long-term macrolide (azithromycin or erythromycin) ≥6 months
**Comparator:** Placebo
**Primary outcome:** Frequency of pulmonary exacerbations
**Results:** 6 RCTs, 689 patients. Rate ratio for exacerbations 0.58 (95% CI 0.47 to 0.71). PROSPERO-registered; no assessment of publication bias (fewer than 10 studies).

---

## JSON Output

```json
{
  "study_type_resolved": "systematic-review",
  "ocebm_level": 1,
  "ocebm_question_type": "therapy",
  "appraisal_tool": "amstar-2",
  "appraisal_applicable": true,
  "amstar_2": {
    "items": [
      {
        "item_number": 1,
        "item_description": "Research questions and inclusion criteria include PICO components",
        "is_critical_domain": false,
        "judgment": "yes",
        "rationale": "Population, intervention, comparator and outcomes explicitly defined in PICO format."
      },
      {
        "item_number": 2,
        "item_description": "Protocol registered before commencement of the review",
        "is_critical_domain": true,
        "judgment": "yes",
        "rationale": "Prospectively registered in PROSPERO (CRD42022XXXXXX) with a priori outcomes and analysis plan."
      },
      {
        "item_number": 4,
        "item_description": "Comprehensive literature search strategy",
        "is_critical_domain": true,
        "judgment": "yes",
        "rationale": "MEDLINE, Embase, CENTRAL and trial registries searched; no language restriction; reference lists screened."
      },
      {
        "item_number": 7,
        "item_description": "List of excluded studies with justification",
        "is_critical_domain": true,
        "judgment": "partial-yes",
        "rationale": "Excluded studies listed but justification provided only for a subset of near-misses."
      },
      {
        "item_number": 9,
        "item_description": "Risk of bias assessed in individual studies",
        "is_critical_domain": true,
        "judgment": "yes",
        "rationale": "ROB 2 applied to all included RCTs by two independent reviewers."
      },
      {
        "item_number": 11,
        "item_description": "Appropriate statistical methods for meta-analysis",
        "is_critical_domain": true,
        "judgment": "yes",
        "rationale": "Random-effects model; rate ratios pooled; heterogeneity quantified with I-squared (28%)."
      },
      {
        "item_number": 13,
        "item_description": "Risk of bias accounted for when interpreting results",
        "is_critical_domain": true,
        "judgment": "yes",
        "rationale": "Sensitivity analysis restricted to low-risk-of-bias trials confirmed the primary estimate."
      },
      {
        "item_number": 15,
        "item_description": "Adequate investigation of publication bias",
        "is_critical_domain": true,
        "judgment": "no",
        "rationale": "No formal assessment of publication bias; authors note funnel plot not interpretable with fewer than 10 studies."
      }
    ],
    "overall_confidence": "moderate"
  },
  "grade_assessment": {
    "outcome": "frequency of pulmonary exacerbations",
    "starting_certainty": "high",
    "downgrades": [
      {
        "reason": "publication-bias",
        "magnitude": 1,
        "rationale": "Publication bias could not be excluded; small body of evidence dominated by industry-supported trials."
      }
    ],
    "upgrades": [],
    "final_certainty": "moderate",
    "rationale": "Body of RCT evidence with consistent direction and low heterogeneity, downgraded one level for undetermined publication bias."
  },
  "red_flags": [
    "One critical domain not satisfied (publication bias not assessed)",
    "Small number of trials (6); effect estimate sensitive to a single large trial",
    "Macrolide resistance and cardiac safety not pooled as outcomes"
  ],
  "appraiser_overall_judgment": "trustworthy-with-caveats",
  "appraisal_confidence": "high"
}
```

---

## Valoración crítica (es-ES)

**Tipo de estudio resuelto:** Revisión sistemática con metaanálisis de ensayos clínicos aleatorizados

**Nivel de evidencia OCEBM:** Nivel 1 (terapia)

**Herramienta de valoración:** AMSTAR-2

### Confianza global (AMSTAR-2)

**Confianza global:** Moderada — se cumple la mayoría de los dominios críticos salvo uno (item 15, sesgo de publicación no evaluado). Según las reglas de AMSTAR-2, un único dominio crítico no satisfecho rebaja la confianza a "moderada".

| Item | Dominio crítico | Juicio | Razón |
|------|-----------------|--------|-------|
| 2. Protocolo registrado a priori | Sí | Sí | Registro prospectivo en PROSPERO con resultados y plan de análisis predefinidos. |
| 4. Búsqueda bibliográfica exhaustiva | Sí | Sí | MEDLINE, Embase, CENTRAL y registros de ensayos; sin restricción de idioma. |
| 7. Lista de estudios excluidos con justificación | Sí | Parcial | Se listan, pero la justificación es parcial. |
| 9. Riesgo de sesgo de estudios individuales | Sí | Sí | ROB 2 por dos revisores independientes. |
| 11. Métodos estadísticos apropiados | Sí | Sí | Modelo de efectos aleatorios; I² 28%. |
| 13. Riesgo de sesgo considerado en la interpretación | Sí | Sí | Análisis de sensibilidad con ensayos de bajo riesgo. |
| 15. Evaluación del sesgo de publicación | Sí | No | No se evaluó; funnel plot no interpretable con <10 estudios. |

### Evaluación GRADE

**Resultado:** Frecuencia de exacerbaciones pulmonares — **Certeza inicial:** Alta (cuerpo de RCTs)
- **Sesgo de publicación (-1):** No pudo descartarse; cuerpo de evidencia pequeño.

**Certeza final:** Moderada

### Banderas rojas

- Un dominio crítico no satisfecho (sesgo de publicación)
- Solo 6 ensayos; estimación sensible a un único ensayo grande
- Resistencia a macrólidos y seguridad cardiaca no agrupadas como resultados

### Juicio global del evaluador

**Confiable con reservas** — Revisión metodológicamente sólida cuyo principal límite es la ausencia de evaluación del sesgo de publicación y el reducido número de ensayos.

**Confianza de la valoración:** alta
