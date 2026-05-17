# Example: Consistent evidence — Robotic-assisted bronchoscopy vs ENB for peripheral pulmonary nodules

## Collection metadata (synthetic)

**Clinical question (PICO):**
- **P:** Adults with peripheral pulmonary nodules 8–30 mm requiring tissue diagnosis
- **I:** Robotic-assisted bronchoscopy (RAB; Ion or Monarch platforms)
- **C:** Electromagnetic navigation bronchoscopy (ENB; superDimension or equivalent)
- **O:** Diagnostic yield (primary), pneumothorax rate (safety)

**Studies included (4 synthetic papers):**

| # | Study | Design | N | Country | Primary outcome | RoB |
|---|-------|--------|---|---------|-----------------|-----|
| 1 | García 2024 | RCT | 343 | USA | DY 82.4% vs 71.6% (Δ +10.8%, 95% CI 3.2–18.4) | low |
| 2 | Müller 2023 | Prospective cohort | 220 | Germany | DY 79.5% vs 70.0% (Δ +9.5%, 95% CI 0.1–18.9) | NOS 7/9 |
| 3 | Tanaka 2024 | Retrospective cohort | 412 | Japan | DY 84.1% vs 73.8% (Δ +10.3%, 95% CI 3.1–17.5) | NOS 6/9 |
| 4 | Pérez 2025 | Prospective cohort | 156 | Spain | DY 80.8% vs 72.4% (Δ +8.4%, 95% CI -1.2–18.0) | NOS 7/9 |

## Evidence synthesis (JSON)

```json
{
  "clinical_question": "In adults with peripheral pulmonary nodules 8-30 mm, does robotic-assisted bronchoscopy improve diagnostic yield compared with electromagnetic navigation bronchoscopy?",
  "number_of_studies": 4,
  "study_designs_summary": {
    "rct": 1,
    "cohort-prospective": 2,
    "cohort-retrospective": 1
  },
  "evidence_map": [
    {
      "study_id": "Garcia2024",
      "design": "rct",
      "country": "United States",
      "year": 2024,
      "n": 343,
      "population": "Peripheral nodules 8-30 mm, outer third of lung field, candidates for bronchoscopic biopsy",
      "intervention": "Robotic-assisted bronchoscopy (Ion) with cone-beam CT confirmation",
      "comparator": "ENB (superDimension)",
      "primary_outcome": {
        "name": "Diagnostic yield at index procedure (12-mo confirmation)",
        "effect": "82.4% vs 71.6% (absolute difference +10.8%)",
        "ci_95": "3.2% to 18.4%",
        "p_value": "0.006"
      },
      "ocebm_level": 2,
      "risk_of_bias": "low (ROB 2)",
      "key_limitations": "Single technology platform per arm; academic centers only",
      "funding": "Investigator-initiated; partial unrestricted grant from Intuitive Surgical"
    },
    {
      "study_id": "Muller2023",
      "design": "cohort-prospective",
      "country": "Germany",
      "year": 2023,
      "n": 220,
      "population": "Peripheral nodules 10-30 mm, multicenter (3 academic centers)",
      "intervention": "Robotic-assisted bronchoscopy (Ion)",
      "comparator": "ENB (historical and concurrent superDimension)",
      "primary_outcome": {
        "name": "Diagnostic yield at index procedure",
        "effect": "79.5% vs 70.0% (absolute difference +9.5%)",
        "ci_95": "0.1% to 18.9%",
        "p_value": "0.048"
      },
      "ocebm_level": 3,
      "risk_of_bias": "NOS 7/9 (some selection bias in historical comparator)",
      "key_limitations": "Non-randomized; partial historical control; limited long-term follow-up",
      "funding": "Institutional"
    },
    {
      "study_id": "Tanaka2024",
      "design": "cohort-retrospective",
      "country": "Japan",
      "year": 2024,
      "n": 412,
      "population": "Peripheral nodules 8-30 mm, single tertiary center",
      "intervention": "Robotic-assisted bronchoscopy (Monarch)",
      "comparator": "ENB (superDimension), retrospective consecutive series 2018-2022",
      "primary_outcome": {
        "name": "Diagnostic yield at index procedure",
        "effect": "84.1% vs 73.8% (absolute difference +10.3%)",
        "ci_95": "3.1% to 17.5%",
        "p_value": "0.005"
      },
      "ocebm_level": 4,
      "risk_of_bias": "NOS 6/9 (retrospective; era effect possible)",
      "key_limitations": "Retrospective; single center; potential learning-curve confounding",
      "funding": "Institutional"
    },
    {
      "study_id": "Perez2025",
      "design": "cohort-prospective",
      "country": "Spain",
      "year": 2025,
      "n": 156,
      "population": "Peripheral nodules 10-30 mm, two SNS tertiary centers (Barcelona, Madrid)",
      "intervention": "Robotic-assisted bronchoscopy (Ion)",
      "comparator": "ENB (concurrent superDimension)",
      "primary_outcome": {
        "name": "Diagnostic yield at index procedure",
        "effect": "80.8% vs 72.4% (absolute difference +8.4%)",
        "ci_95": "-1.2% to 18.0%",
        "p_value": "0.09"
      },
      "ocebm_level": 3,
      "risk_of_bias": "NOS 7/9",
      "key_limitations": "Smaller sample, CI crosses null; restricted to two centers with established robotic programs",
      "funding": "SEPAR grant; no industry funding"
    }
  ],
  "consistency_assessment": {
    "direction_of_effect": "consistent",
    "magnitude_consistency": "Effect sizes are tightly clustered around an absolute increase of 8-11% in diagnostic yield favoring RAB across all four studies, regardless of design.",
    "explanations_for_discordance": [
      "Pérez 2025 has wider CI (crosses null) due to smaller N, not due to a different underlying effect",
      "Tanaka 2024 has slightly higher absolute yields in both arms, likely reflecting tertiary-center selection and operator experience"
    ]
  },
  "aggregate_quality": {
    "overall_grade_certainty": "moderate",
    "rationale": "Body of evidence: 1 low-RoB RCT + 3 cohort studies (1 retrospective). Start at High for the RCT-anchored body. Downgrade 1 level for indirectness/imprecision because most evidence beyond the single RCT is observational and the only Spanish study has wide CI. No serious inconsistency (results are concordant). Industry funding present in 1/4 studies but not dominant.",
    "risk_of_bias_distribution": "1 RCT low-risk (ROB 2); 2 prospective cohort NOS 7/9; 1 retrospective cohort NOS 6/9"
  },
  "evidence_gaps": [
    "No head-to-head RCT replicating García 2024 in non-US populations",
    "No RCT comparing Ion vs Monarch platforms directly",
    "Long-term outcomes (12+ months) not reported beyond García 2024",
    "Cost-effectiveness analysis absent in all four studies",
    "Patient-reported outcomes (anxiety, satisfaction) not assessed",
    "Underrepresentation of community/non-academic centers; operator learning curve not characterized",
    "No data on subcentimeter nodules (<8 mm) where diagnostic yield is most uncertain"
  ],
  "practice_implications": {
    "supported": [
      "Robotic-assisted bronchoscopy yields a clinically meaningful absolute increase (~10%) in diagnostic yield over ENB for peripheral nodules 8-30 mm in centers with the technology and trained operators",
      "Safety profile (pneumothorax rates) is comparable between RAB and ENB across the body of evidence"
    ],
    "not_supported": [
      "Universal replacement of ENB with RAB across all centers — current evidence is concentrated in academic/tertiary centers with established interventional pulmonology programs",
      "Use in nodules <8 mm — no evidence base"
    ],
    "requires_individualization": [
      "Choice between Ion and Monarch platforms (no direct comparison; choice depends on local availability and training)",
      "Decision to invest in RAB infrastructure depends on case volume, center expertise, and local availability of ENB"
    ],
    "high_priority_research": [
      "Multicenter RCT in European/SNS context (extending Pérez 2025) with adequate power",
      "Direct head-to-head trial Ion vs Monarch",
      "Cost-effectiveness analysis from a public-health-system perspective (SNS)",
      "Diagnostic yield in nodules <8 mm and ground-glass nodules"
    ]
  },
  "synthesis_confidence": "high",
  "synthesis_notes": "Four studies, consistent direction and magnitude of effect, mixed designs but anchored by one low-RoB RCT. Body of evidence is sufficient for a working synthesis but not for a formal systematic review with pooled meta-analysis (heterogeneity in comparator definition and outcome timing precludes simple pooling here)."
}
```

## Síntesis de evidencia (es-ES)

**Pregunta clínica (PICO):** En adultos con nódulos pulmonares periféricos de 8–30 mm que requieren diagnóstico anatomopatológico, ¿la broncoscopia asistida por robot mejora el rendimiento diagnóstico frente a la navegación electromagnética?

### Mapa de evidencia

| Estudio | Diseño | N | País | Resultado principal (Δ DY, IC 95%) | OCEBM | RoB |
|---------|--------|---|------|-------------------------------------|-------|-----|
| García 2024 | RCT | 343 | EE. UU. | +10,8% (3,2 a 18,4) | 2 | bajo (ROB 2) |
| Müller 2023 | Cohorte prospectiva | 220 | Alemania | +9,5% (0,1 a 18,9) | 3 | NOS 7/9 |
| Tanaka 2024 | Cohorte retrospectiva | 412 | Japón | +10,3% (3,1 a 17,5) | 4 | NOS 6/9 |
| Pérez 2025 | Cohorte prospectiva | 156 | España | +8,4% (-1,2 a 18,0) | 3 | NOS 7/9 |

### Consistencia y discordancia

- **Dirección del efecto:** consistente — las cuatro series muestran ventaja de la broncoscopia robótica sobre la navegación electromagnética.
- **Magnitud:** muy similar entre estudios, con diferencias absolutas de rendimiento diagnóstico entre +8,4% y +10,8%.
- **Posibles explicaciones de discordancia menor:** Pérez 2025 cruza el nulo por tamaño muestral pequeño, no por efecto distinto; Tanaka 2024 muestra rendimientos absolutos algo más altos en ambos brazos, probablemente por selección de centro terciario y experiencia del operador.

### Calidad global

- **Distribución de diseños:** 1 ECA + 2 cohortes prospectivas + 1 cohorte retrospectiva.
- **Distribución de RoB:** 1 ECA bajo riesgo; 2 cohortes prospectivas NOS 7/9; 1 retrospectiva NOS 6/9.
- **Certeza GRADE para rendimiento diagnóstico:** moderada. Se parte de alta por el ECA, se baja un nivel por imprecisión/indirección al ser la mayor parte del cuerpo evidencial observacional y porque el único estudio español tiene IC amplio. No hay inconsistencia importante.

### Gaps de evidencia

- No hay ECA replicado fuera de EE. UU.
- No hay comparación directa Ion vs Monarch.
- Resultados a largo plazo solo en García 2024.
- Coste-efectividad ausente en todos los estudios.
- Sin datos en nódulos <8 mm.
- Infrarrepresentación de centros no académicos; curva de aprendizaje no caracterizada.
- Outcomes reportados por el paciente (ansiedad, satisfacción) no evaluados.

### Implicaciones para la práctica

- **Apoyado por la evidencia:** la broncoscopia robótica aporta un incremento clínicamente relevante (~10% absoluto) en rendimiento diagnóstico para nódulos periféricos 8–30 mm en centros con tecnología y operadores entrenados; perfil de seguridad comparable.
- **No apoyado:** sustitución universal de ENB por broncoscopia robótica en todos los centros; uso en nódulos <8 mm.
- **Requiere individualización:** elección entre plataformas Ion y Monarch (sin comparación directa); decisión de inversión en RAB depende del volumen del centro.
- **Investigación prioritaria:** ECA multicéntrico europeo con potencia adecuada (extendiendo Pérez 2025); comparación directa Ion vs Monarch; análisis coste-efectividad desde la perspectiva del SNS; rendimiento en nódulos subcentimétricos y vidrio deslustrado.

**Confianza de la síntesis:** alta — cuatro estudios, dirección y magnitud consistentes, anclada por un ECA de bajo riesgo de sesgo. Suficiente para síntesis de trabajo, no para metaanálisis formal por heterogeneidad en definición del comparador y tiempo del outcome.
