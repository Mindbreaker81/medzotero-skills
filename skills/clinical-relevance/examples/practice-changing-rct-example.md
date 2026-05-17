# Example: Practice-changing RCT

## Paper metadata (synthetic)

**Title:** Endobronchial Valves for Severe Heterogeneous Emphysema: A Multicenter Randomized Trial
**Authors:** García et al.
**Journal:** NEJM, 2024
**Study type:** rct
**Population:** Patients with severe heterogeneous emphysema, FEV1 < 30% predicted, intact fissures
**Intervention:** Endobronchial valves (EBV) placement
**Comparator:** Standard medical management
**Primary outcome:** Change in 6MWD at 12 months
**Results:** 6MWD improved by +45 m (95% CI 25-65 m, p<0.001), FEV1 +15% predicted, reduced hospitalizations

## Clinical relevance assessment (JSON)

```json
{
  "practice_changing": "yes",
  "effect_magnitude": {
    "primary_outcome": "6MWD at 12 months",
    "clinical_significance": "large",
    "mcid_referenced": "6MWD MCID = 30 m for chronic respiratory disease",
    "absolute_effect": "+45 m (exceeds MCID by 15 m)"
  },
  "population_applicability": {
    "fit_to_spanish_pneumology": "high",
    "key_exclusions_that_limit_applicability": [
      "Requires intact fissures on CT (may exclude some with prior adhesions)",
      "FEV1 < 30% predicted (excludes mild-moderate COPD)"
    ]
  },
  "intervention_availability_spain": {
    "available": "yes",
    "details": "EBV placement available in tertiary Spanish hospitals with interventional pulmonology programs",
    "aemps_status": "Approved for severe heterogeneous emphysema",
    "sns_funding": "Funded in SNS for selected centers after multidisciplinary committee approval"
  },
  "patient_relevance": {
    "endpoint_type": "patient-important",
    "details": "6MWD is a functional outcome directly linked to daily activity and quality of life; secondary outcomes include hospitalization reduction (patient-important)"
  },
  "actionable_changes": [
    "Refer eligible patients (severe heterogeneous emphysema, intact fissures) for EBV evaluation",
    "Discuss EBV as treatment option in multidisciplinary COPD meetings",
    "Prioritize patients with low exercise capacity despite optimal medical therapy"
  ],
  "implementation_barriers": [
    "Limited to centers with interventional pulmonology expertise",
    "Requires multidisciplinary committee approval for SNS funding",
    "Patient selection requires specialized CT analysis (Chartis assessment may be needed)"
  ],
  "confidence_in_judgment": "high"
}
```

## Relevancia clínica (narrativa es-ES)

**¿Cambia mi práctica?** Sí

**Magnitud del efecto:** Grande. Mejora de 45 m en 6MWD excede el MCID establecido de 30 m para enfermedad respiratoria crónica. La mejora en FEV1 (+15% predicho) también supera el MCID de 100 mL o 10% basal para ensayos de EPOC. La reducción en hospitalizaciones es clínicamente relevante.

**Aplicabilidad al paciente del SNS:** Alta. La población del ensayo (EPOC grave con enfisema heterogéneo y fisuras intactas) es representativa de pacientes vistos en neumología del SNS. Exclusiones clave: requiere fisuras intactas (puede excluir pacientes con adherencias previas) y FEV1 < 30% predicho (excluye EPOC leve-moderada).

**Disponibilidad en España:** Sí, con restricciones. Válvulas endobronquiales aprobadas por AEMPS para enfisema heterogéneo grave. Financiadas por SNS en centros seleccionados tras aprobación de comité multidisciplinar. Disponibles en hospitales terciarios con programa de neumología intervencionista.

**Outcomes relevantes para el paciente:** Patient-important. 6MWD es un outcome funcional directamente relacionado con actividad diaria y calidad de vida. Los outcomes secundarios incluyen reducción de hospitalizaciones (también patient-important).

**Acciones concretas:**
- Derivar pacientes elegibles (enfisema heterogéneo grave, fisuras intactas) para evaluación de válvulas endobronquiales
- Discutir EBV como opción terapéutica en comités multidisciplinares de EPOC
- Priorizar pacientes con baja capacidad de ejercicio a pesar de terapia médica óptima

**Barreras de implementación:**
- Limitado a centros con experiencia en neumología intervencionista
- Requiere aprobación de comité multidisciplinar para financiación SNS
- La selección de pacientes requiere análisis TC especializado (puede requerir evaluación Chartis)

**Confianza del juicio:** Alta. Ensayo multicéntrico, tamaño de muestra adecuado, outcomes patient-important, intervención disponible en España, efecto grande clínicamente significativo.
