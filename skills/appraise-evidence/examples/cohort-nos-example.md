# Example: Prospective cohort with NOS assessment — Long-term outcomes of cryobiopsy for ILD diagnosis

## Paper metadata (synthetic)

**Title:** Prospective multicenter cohort of transbronchial cryobiopsy for diagnosis of interstitial lung disease: 5-year follow-up
**Authors:** Hernández et al.
**Journal:** American Journal of Respiratory and Critical Care Medicine, 2023
**Study type:** Prospective multicenter cohort study
**Population:** 287 patients with suspected interstitial lung disease referred for surgical lung biopsy
**Intervention:** Transbronchial cryobiopsy as first-line diagnostic procedure
**Comparator:** Historical control group of surgical lung biopsy (VATS) from same institutions
**Primary outcome:** Diagnostic yield and complication rate at 5 years
**Results:** Diagnostic yield 84% (cryobiopsy) vs 92% (VATS). Pneumothorax requiring chest tube: 12% vs 18%. 5-year survival similar between groups (HR 0.98, 95% CI 0.82-1.17, p=0.81).

---

## JSON Output

```json
{
  "study_type_resolved": "cohort-prospective",
  "ocebm_level": 3,
  "ocebm_question_type": "diagnosis",
  "appraisal_tool": "nos",
  "appraisal_applicable": true,
  "nos_cohort": {
    "selection": {
      "representativeness_of_exposed_cohort": {
        "score": 1,
        "rationale": "Truly representative of patients with suspected ILD referred for biopsy in participating tertiary centers. Consecutive enrollment."
      },
      "selection_of_non_exposed_cohort": {
        "score": 1,
        "rationale": "Historical VATS controls from same institutions, same inclusion criteria, drawn from same time frame (-1 year to +1 year around cryobiopsy enrollment)."
      },
      "ascertainment_of_exposure": {
        "score": 1,
        "rationale": "Procedure type confirmed by operative report and imaging. No ambiguity about exposure classification."
      },
      "demonstration_that_outcome_was_not_present_at_start": {
        "score": 1,
        "rationale": "All patients had suspected ILD without prior definitive diagnosis. Baseline CT and clinical assessment documented absence of confirmed diagnosis."
      }
    },
    "comparability": {
      "comparability_of_cohorts_on_most_important_factor": {
        "score": 2,
        "rationale": "Study controlled for age, gender, ILD subtype distribution, and center. Both groups well-matched on baseline characteristics."
      },
      "comparability_of_cohorts_on_additional_factors": {
        "score": 0,
        "rationale": "No adjustment for smoking status or comorbidity index. However, baseline similarity was documented."
      }
    },
    "outcome": {
      "assessment_of_outcome": {
        "score": 1,
        "rationale": "Diagnostic yield determined by multidisciplinary discussion blinded to procedural approach. Survival status verified through national death registry."
      },
      "was_follow_up_long_enough": {
        "score": 1,
        "rationale": "5-year follow-up completed for 94% of cohort. Adequate to detect long-term survival differences."
      },
      "adequacy_of_follow_up_of_cohorts": {
        "score": 1,
        "rationale": "Loss to follow-up 6% (cryobiopsy) vs 5% (VATS). Attrition balanced and minimal."
      }
    },
    "total_stars": 8,
    "max_stars": 9
  },
  "grade_assessment": {
    "outcome": "diagnostic yield for interstitial lung disease",
    "starting_certainty": "low",
    "downgrades": [
      {
        "reason": "risk-of-bias",
        "magnitude": 1,
        "rationale": "Observational design with historical controls. Potential for secular trends in diagnostic practice."
      },
      {
        "reason": "indirectness",
        "magnitude": 1,
        "rationale": "Tertiary center expertise may not reflect community practice. Cryobiopsy requires specific operator training."
      }
    ],
    "upgrades": [],
    "final_certainty": "very-low",
    "rationale": "Observational study starting at low certainty, downgraded two levels for risk of bias (historical controls) and indirectness (tertiary center expertise)."
  },
  "red_flags": [
    "Historical control design vulnerable to secular trends in ILD diagnosis and management",
    "No central pathology review - inter-observer variability in ILD diagnosis not addressed",
    "Industry funding: cryobiopsy probes provided by manufacturer at reduced cost"
  ],
  "appraiser_overall_judgment": "use-with-caution",
  "appraisal_confidence": "medium"
}
```

---

## Valoración crítica (es-ES)

**Tipo de estudio resuelto:** Estudio de cohorte prospectivo, multicéntrico

**Nivel de evidencia OCEBM:** Nivel 3 (diagnóstico)

**Herramienta de valoración:** Newcastle-Ottawa Scale (NOS) para cohortes

### Valoración NOS (Newcastle-Ottawa Scale)

**Selección (máximo 4 estrellas):**
- ✅ Representatividad de la cohorte expuesta: 1 estrella — Verdaderamente representativa de pacientes con ILD sospechada remitidos para biopsia en centros terciarios participantes. Inscripción consecutiva.
- ✅ Selección de la cohorte no expuesta: 1 estrella — Controles históricos de VATS de las mismas instituciones, mismos criterios de inclusión, del mismo periodo temporal (-1 a +1 año alrededor de la inscripción de criobiopsia).
- ✅ Constatación de la exposición: 1 estrella — Tipo de procedimiento confirmado por informe operatorio e imagen. Sin ambigüedad sobre la clasificación de exposición.
- ✅ Demostración de que el resultado no estaba presente al inicio: 1 estrella — Todos los pacientes tenían ILD sospechada sin diagnóstico definitivo previo. TC basal y evaluación clínica documentaron ausencia de diagnóstico confirmado.

**Comparabilidad (máximo 2 estrellas):**
- ✅ Comparabilidad de cohortes en el factor más importante: 2 estrellas — El estudio controló por edad, género, distribución de subtipo de ILD y centro. Ambos grupos bien equilibrados en características basales.
- ❌ Comparabilidad de cohortes en factores adicionales: 0 estrellas — No ajuste por tabaquismo o índice de comorbilidad. Sin embargo, la similitud basal fue documentada.

**Resultado (máximo 3 estrellas):**
- ✅ Evaluación del resultado: 1 estrella — El rendimiento diagnóstico determinado por discusión multidisciplinar ciega al enfoque procedimental. Estado de supervivencia verificado a través del registro nacional de defunciones.
- ✅ Seguimiento suficientemente largo: 1 estrella — Seguimiento a 5 años completado para el 94% de la cohorte. Adecuado para detectar diferencias de supervivencia a largo plazo.
- ✅ Adecuación del seguimiento de cohortes: 1 estrella — Pérdida de seguimiento 6% (criobiopsia) vs 5% (VATS). Atrición equilibrada y mínima.

**Total estrellas:** 8/9

### Evaluación GRADE

**Resultado:** Rendimiento diagnóstico para enfermedad pulmonar intersticial

**Certeza inicial:** Baja (estudio observacional)

**Downgrades:**
- **Riesgo de sesgo (-1):** Diseño observacional con controles históricos. Potencial de tendencias seculares en la práctica diagnóstica de ILD.
- **Indirectez (-1):** La experiencia en centros terciarios puede no reflejar la práctica comunitaria. La criobiopsia requiere entrenamiento específico del operador.

**Upgrades:** Ninguno

**Certeza final:** Muy baja

**Ración:** Estudio observacional comenzando en certeza baja, degradado dos niveles por riesgo de sesgo (controles históricos) e indirectez (experiencia en centros terciarios).

### Banderas rojas

- Diseño de control histórico vulnerable a tendencias seculares en el diagnóstico y manejo de ILD
- No hay revisión patológica central - la variabilidad inter-observador en el diagnóstico de ILD no se aborda
- Financiación industrial: sondas de criobiopsia proporcionadas por el fabricante a coste reducido

### Juicio global del evaluador

**Usar con precaución** — El estudio tiene buena calidad metodológica para un estudio observacional (8/9 estrellas NOS), pero el diseño de control histórico y la indirectez de la experiencia en centros terciarios limitan la generalizabilidad. Los resultados sugieren que la criobiopsia puede ser una alternativa razonable a la biopsia quirúrgica en centros con experiencia, pero no pueden extrapolarse a todos los contextos.

**Confianza de la valoración:** media
