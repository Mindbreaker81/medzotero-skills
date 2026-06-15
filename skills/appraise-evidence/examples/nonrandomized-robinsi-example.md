# Example: Non-randomized comparative study with ROBINS-I assessment — Electromagnetic navigation vs standard bronchoscopy

## Paper metadata (synthetic)

**Title:** Electromagnetic navigation bronchoscopy versus conventional transbronchial biopsy for peripheral lung lesions: a comparative cohort study
**Authors:** Romero et al.
**Journal:** Respiration, 2023
**Study type:** Non-randomized comparative cohort (concurrent controls)
**Population:** 318 patients with peripheral pulmonary lesions referred for bronchoscopic biopsy
**Intervention:** Electromagnetic navigation bronchoscopy (ENB)
**Comparator:** Conventional fluoroscopy-guided transbronchial biopsy
**Primary outcome:** Diagnostic yield per lesion
**Results:** Diagnostic yield 79% (ENB) vs 64% (conventional), adjusted odds ratio 2.1 (95% CI 1.3 to 3.4). Treatment assignment based on operator preference and device availability.

---

## JSON Output

```json
{
  "study_type_resolved": "non-randomized-controlled",
  "ocebm_level": 3,
  "ocebm_question_type": "therapy",
  "appraisal_tool": "robins-i",
  "appraisal_applicable": true,
  "robins_i": {
    "confounding": {
      "judgment": "serious",
      "rationale": "Treatment assignment driven by operator preference and lesion characteristics; lesion size and location are strong confounders only partially addressed by adjustment."
    },
    "selection": {
      "judgment": "moderate",
      "rationale": "Concurrent controls from the same period; some selection of easier lesions into the conventional arm cannot be excluded."
    },
    "classification_of_interventions": {
      "judgment": "low",
      "rationale": "Intervention groups defined unambiguously by procedure type recorded prospectively."
    },
    "deviations_from_intended_interventions": {
      "judgment": "low",
      "rationale": "No relevant crossovers; procedures performed as assigned."
    },
    "missing_data": {
      "judgment": "low",
      "rationale": "Outcome available for 312/318 lesions (98%); missingness balanced between groups."
    },
    "measurement_of_outcomes": {
      "judgment": "moderate",
      "rationale": "Diagnostic yield adjudicated by pathology, but assessors not blinded to procedure type."
    },
    "selection_of_reported_result": {
      "judgment": "low",
      "rationale": "Outcomes consistent with a registered analysis plan; no evidence of selective reporting."
    },
    "overall": "serious"
  },
  "grade_assessment": {
    "outcome": "diagnostic yield for peripheral lung lesions",
    "starting_certainty": "low",
    "downgrades": [
      {
        "reason": "risk-of-bias",
        "magnitude": 1,
        "rationale": "Serious residual confounding by indication and unblinded outcome assessment."
      }
    ],
    "upgrades": [],
    "final_certainty": "very-low",
    "rationale": "Observational evidence starting at low certainty, further downgraded for serious risk of bias from confounding by indication."
  },
  "red_flags": [
    "Confounding by indication: device assigned by operator preference and lesion features",
    "Outcome assessors not blinded to procedure",
    "Adjusted estimate may not fully remove allocation-related confounding"
  ],
  "appraiser_overall_judgment": "use-with-caution",
  "appraisal_confidence": "medium"
}
```

---

## Valoración crítica (es-ES)

**Tipo de estudio resuelto:** Estudio comparativo no aleatorizado (cohorte con controles concurrentes)

**Nivel de evidencia OCEBM:** Nivel 3 (terapia)

**Herramienta de valoración:** ROBINS-I

### Riesgo de sesgo por dominios (ROBINS-I)

| Dominio | Juicio | Razón |
|---------|--------|-------|
| Confusión | Serio | Asignación según preferencia del operador y características de la lesión; tamaño y localización son confusores fuertes solo parcialmente ajustados. |
| Selección de participantes | Moderado | Controles concurrentes; no puede excluirse selección de lesiones más sencillas al brazo convencional. |
| Clasificación de las intervenciones | Bajo | Grupos definidos sin ambigüedad por tipo de procedimiento registrado prospectivamente. |
| Desviaciones de las intervenciones | Bajo | Sin cruces relevantes; procedimientos según lo asignado. |
| Datos faltantes | Bajo | Resultado disponible en 312/318 lesiones (98%); pérdidas equilibradas. |
| Medición de los resultados | Moderado | Rendimiento adjudicado por patología, pero evaluadores no cegados al procedimiento. |
| Selección del resultado reportado | Bajo | Resultados consistentes con un plan de análisis registrado. |

**Riesgo de sesgo global:** Serio

### Evaluación GRADE

**Resultado:** Rendimiento diagnóstico para lesiones pulmonares periféricas — **Certeza inicial:** Baja (evidencia observacional)
- **Riesgo de sesgo (-1):** Confusión por indicación seria y evaluación no cegada.

**Certeza final:** Muy baja

### Banderas rojas

- Confusión por indicación: dispositivo asignado por preferencia del operador y características de la lesión
- Evaluadores de resultados no cegados al procedimiento
- El estimador ajustado puede no eliminar por completo la confusión relacionada con la asignación

### Juicio global del evaluador

**Usar con precaución** — La señal a favor de la navegación electromagnética es plausible pero el diseño no aleatorizado, con confusión por indicación seria, impide inferencias causales firmes. Requiere confirmación en un ensayo aleatorizado.

**Confianza de la valoración:** media
