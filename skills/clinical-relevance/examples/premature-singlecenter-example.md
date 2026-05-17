# Example: Premature single-center study

## Paper metadata (synthetic)

**Title:** Novel Cryobiopsy Technique for Interstitial Lung Disease: A Pilot Study
**Authors:** Martínez et al.
**Journal:** Respiration, 2024
**Study type:** case-series (single-center)
**Population:** 30 patients with suspected ILD referred for diagnostic biopsy
**Intervention:** Novel cryobiopsy probe with larger freeze zone (2.5 mm vs standard 1.9 mm)
**Comparator:** Historical control with standard cryobiopsy
**Primary outcome:** Diagnostic yield (percentage of procedures achieving definitive histologic diagnosis)
**Results:** Diagnostic yield 93% vs historical 78% (p=0.04), complication rate similar (13% pneumothorax)

## Clinical relevance assessment (JSON)

```json
{
  "practice_changing": "premature",
  "effect_magnitude": {
    "primary_outcome": "Diagnostic yield",
    "clinical_significance": "moderate",
    "mcid_referenced": "No established MCID for diagnostic yield in ILD",
    "absolute_effect": "+15% absolute increase (93% vs 78% historical)"
  },
  "population_applicability": {
    "fit_to_spanish_pneumology": "moderate",
    "key_exclusions_that_limit_applicability": [
      "Single-center study at high-volume ILD referral center",
      "Small sample size (n=30)",
      "Operator expertise may not be generalizable to lower-volume centers"
    ]
  },
  "intervention_availability_spain": {
    "available": "not-yet",
    "details": "Novel cryobiopsy probe (2.5 mm freeze zone) is investigational device, not commercially available in Spain",
    "aemps_status": "Not approved for clinical use",
    "sns_funding": "Not applicable"
  },
  "patient_relevance": {
    "endpoint_type": "surrogate",
    "details": "Diagnostic yield is a surrogate endpoint. Patient-important outcomes would include time to definitive diagnosis, reduction in need for surgical biopsy, and impact on treatment decisions/outcomes"
  },
  "actionable_changes": [],
  "implementation_barriers": [
    "Device not commercially available in Spain",
    "Single-center data not sufficient for practice change",
    "No replication in other centers",
    "Industry-funded (device manufacturer) without independent analysis"
  ],
  "confidence_in_judgment": "medium"
}
```

## Relevancia clínica (narrativa es-ES)

**¿Cambia mi práctica?** Prematuro

**Magnitud del efecto:** Moderada. Aumento del 15% en yield diagnóstico (93% vs 78% histórico). Sin MCID establecido para yield diagnóstico en EPID. El tamaño de efecto es prometedor pero no justifica cambio de práctica sin replicación.

**Aplicabilidad al paciente del SNS:** Moderada. Estudio single-center en centro de referencia de alta complejidad para EPID. Tamaño de muestra pequeño (n=30). La experiencia del operador puede no ser generalizable a centros de menor volumen. Los pacientes del ensayo son representativos de la población española con sospecha de EPID, pero el contexto de atención es especializado.

**Disponibilidad en España:** No disponible aún. La sonda de criobiopsia novedosa (zona de congelación 2.5 mm vs estándar 1.9 mm) es dispositivo en investigación, no disponible comercialmente en España. Sin aprobación AEMPS para uso clínico.

**Outcomes relevantes para el paciente:** Surrogate. El yield diagnóstico es un endpoint surrogate. Los outcomes patient-important serían: tiempo hasta diagnóstico definitivo, reducción de necesidad de biopsia quirúrgica, impacto en decisiones terapéuticas y outcomes clínicos (supervivencia, progresión, calidad de vida). El estudio no reporta estos endpoints.

**Acciones concretas:** Ninguna en este momento. Esperar replicación multicéntrica y disponibilidad del dispositivo en España.

**Barreras de implementación:**
- Dispositivo no disponible comercialmente en España
- Datos single-center insuficientes para cambio de práctica
- Sin replicación en otros centros
- Financiación industry (fabricante del dispositivo) sin análisis independiente

**Confianza del juicio:** Media. El estudio tiene limitaciones metodológicas (single-center, sin control contemporáneo, financiación industry) y el dispositivo no está disponible. Los resultados son prometedores pero requieren validación antes de considerar cambio de práctica.
