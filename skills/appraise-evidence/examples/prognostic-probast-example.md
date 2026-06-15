# Example: Prognostic model with PROBAST assessment — Malignancy risk model for pulmonary nodules

## Paper metadata (synthetic)

**Title:** External validation of a clinical-radiological model to estimate the probability of malignancy in incidentally detected pulmonary nodules
**Authors:** Iglesias et al.
**Journal:** Thorax, 2024
**Study type:** Prognostic model — external validation
**Population:** 1,120 patients with incidentally detected solid pulmonary nodules 8-30 mm
**Predictors:** Age, smoking history, nodule diameter, spiculation, upper-lobe location, emphysema
**Outcome:** Malignancy confirmed histologically or by ≥2-year radiological follow-up
**Results:** AUC 0.84 (95% CI 0.81 to 0.87); good calibration in the 8-20 mm range, overestimation of risk above 20 mm.

---

## JSON Output

```json
{
  "study_type_resolved": "prognostic-model",
  "ocebm_level": 2,
  "ocebm_question_type": "prognosis",
  "appraisal_tool": "probast",
  "appraisal_applicable": true,
  "probast": {
    "participants": {
      "risk_of_bias": "low",
      "applicability": "low",
      "rationale": "Consecutive patients from an incidental-nodule pathway; data sources and inclusion criteria appropriate for the intended use."
    },
    "predictors": {
      "risk_of_bias": "low",
      "applicability": "low",
      "rationale": "Predictors defined and measured identically to the original model, assessed without knowledge of outcome."
    },
    "outcome": {
      "risk_of_bias": "low",
      "applicability": "low",
      "rationale": "Malignancy ascertained histologically or by adequate radiological follow-up; outcome definition independent of the predictors."
    },
    "analysis": {
      "risk_of_bias": "high",
      "applicability": "low",
      "rationale": "Calibration reported but no recalibration attempted despite overestimation above 20 mm; participants with missing follow-up excluded as complete-case (potential selection)."
    },
    "overall_rob": "high"
  },
  "grade_assessment": null,
  "red_flags": [
    "Miscalibration (risk overestimation) for nodules larger than 20 mm without recalibration",
    "Complete-case handling of missing follow-up data",
    "Single health-system validation; thresholds for clinical action not re-derived"
  ],
  "appraiser_overall_judgment": "use-with-caution",
  "appraisal_confidence": "high"
}
```

---

## Valoración crítica (es-ES)

**Tipo de estudio resuelto:** Modelo pronóstico — validación externa

**Nivel de evidencia OCEBM:** Nivel 2 (pronóstico)

**Herramienta de valoración:** PROBAST

### Riesgo de sesgo y aplicabilidad (PROBAST)

| Dominio | Riesgo de sesgo | Aplicabilidad | Razón |
|---------|-----------------|---------------|-------|
| Participantes | Bajo | Baja | Pacientes consecutivos de una vía de nódulo incidental; fuentes de datos apropiadas. |
| Predictores | Bajo | Baja | Predictores medidos igual que en el modelo original, sin conocer el resultado. |
| Resultado | Bajo | Baja | Malignidad confirmada histológicamente o por seguimiento radiológico adecuado. |
| Análisis | Alto | Baja | Se informa calibración pero no se recalibra pese a la sobreestimación >20 mm; manejo de datos faltantes por caso completo. |

**Riesgo de sesgo global:** Alto (determinado por el dominio de análisis)

### Evaluación GRADE

No aplicable: GRADE no se aplica de forma estándar a la derivación/validación de un modelo pronóstico (`grade_assessment: null`).

### Banderas rojas

- Mala calibración (sobreestimación) para nódulos >20 mm sin recalibración
- Manejo por caso completo de los datos de seguimiento faltantes
- Validación en un único sistema sanitario; umbrales de actuación no re-derivados

### Juicio global del evaluador

**Usar con precaución** — Buena discriminación (AUC 0.84) y dominios de participantes/predictores/resultado de bajo riesgo, pero el dominio de análisis (mala calibración no corregida y datos faltantes) eleva el riesgo de sesgo global y limita la confianza en las probabilidades absolutas, especialmente en nódulos grandes.

**Confianza de la valoración:** alta
