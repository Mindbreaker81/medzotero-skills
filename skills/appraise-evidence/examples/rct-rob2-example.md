# Example: RCT with ROB 2 assessment — Robotic-assisted bronchoscopy for pulmonary nodules

## Paper metadata (synthetic)

**Title:** Randomized trial of robotic-assisted bronchoscopy versus electromagnetic navigation for diagnosis of peripheral pulmonary nodules
**Authors:** Chen et al.
**Journal:** Lancet Respiratory Medicine, 2024
**Study type:** Multicenter randomized controlled trial
**Population:** 412 patients with peripheral pulmonary nodules 8-30 mm requiring tissue diagnosis
**Intervention:** Robotic-assisted bronchoscopy (Ion platform) with cone-beam CT confirmation
**Comparator:** Electromagnetic navigation bronchoscopy (superDimension)
**Primary outcome:** Diagnostic yield (proportion with definitive pathologic diagnosis at index procedure)
**Results:** Diagnostic yield 82.4% (robotic) vs 71.6% (ENB), absolute difference 10.8% (95% CI 3.2% to 18.4%), p=0.006. Pneumothorax requiring chest tube: 2.1% vs 3.8%, p=0.31.

---

## JSON Output

```json
{
  "study_type_resolved": "rct",
  "ocebm_level": 2,
  "ocebm_question_type": "diagnosis",
  "appraisal_tool": "rob-2",
  "appraisal_applicable": true,
  "rob_2": {
    "domain_1_randomization": {
      "judgment": "low",
      "rationale": "Central web-based randomization system with permuted blocks, stratified by center and nodule size. Allocation concealed until procedure assignment."
    },
    "domain_2_deviations": {
      "judgment": "low",
      "rationale": "Blinding of interventionalists not possible due to device differences, but outcome assessors (pathologists) blinded to allocation. No protocol deviations reported."
    },
    "domain_3_missing_data": {
      "judgment": "low",
      "rationale": "412 randomized, 406 analyzed (98.3% complete). 6 patients lost due to technical failure unrelated to allocation, balanced between arms (3 per arm). ITT analysis performed."
    },
    "domain_4_measurement": {
      "judgment": "low",
      "rationale": "Primary outcome (diagnostic yield) objectively defined as definitive pathologic diagnosis at index procedure with 12-month follow-up confirmation. Pathologists blinded to intervention."
    },
    "domain_5_selection_of_reported_result": {
      "judgment": "low",
      "rationale": "Trial registered prospectively (NCT05384721). Primary and secondary outcomes pre-specified in protocol. No evidence of selective outcome reporting."
    },
    "overall": "low"
  },
  "grade_assessment": {
    "outcome": "diagnostic yield for peripheral pulmonary nodules",
    "starting_certainty": "high",
    "downgrades": [
      {
        "reason": "indirectness",
        "magnitude": 1,
        "rationale": "Operator experience in academic centers may not reflect community practice. Only two specific technology platforms compared."
      }
    ],
    "upgrades": [],
    "final_certainty": "moderate",
    "rationale": "High-quality RCT with low risk of bias, downgraded one level for indirectness (operator experience, technology-specificity)."
  },
  "red_flags": [
    "Industry funding: partial unrestricted educational grant from Intuitive Surgical (manufacturer of robotic platform)",
    "3 authors received consulting fees from Intuitive Surgical or Medtronic outside this work",
    "Single technology platform per arm limits generalizability to other robotic or navigation systems"
  ],
  "appraiser_overall_judgment": "trustworthy-with-caveats",
  "appraisal_confidence": "high"
}
```

---

## Valoración crítica (es-ES)

**Tipo de estudio resuelto:** Ensayo clínico aleatorizado, multicéntrico

**Nivel de evidencia OCEBM:** Nivel 2 (diagnóstico)

**Herramienta de valoración:** ROB 2 (Cochrane Risk of Bias 2.0)

### Riesgo de sesgo (ROB 2)

| Dominio | Juicio | Ración |
|---------|--------|--------|
| 1. Proceso de aleatorización | Bajo | Sistema de aleatorización web centralizado con bloques permutados, estratificado por centro y tamaño de nódulo. Ocultación de la asignación hasta el momento del procedimiento. |
| 2. Desviaciones de las intervenciones previstas | Bajo | El cegamiento de los intervencionistas no fue posible debido a las diferencias de dispositivo, pero los evaluadores de resultados (patólogos) estaban cegados a la asignación. No se reportaron desviaciones del protocolo. |
| 3. Datos de resultado faltantes | Bajo | 412 aleatorizados, 406 analizados (98.3% completos). 6 pacientes perdidos por fallo técnico no relacionado con la asignación, equilibrado entre brazos (3 por brazo). Análisis por intención de tratar. |
| 4. Medición del resultado | Bajo | El resultado primario (rendimiento diagnóstico) definido objetivamente como diagnóstico anatomopatológico definitivo en el procedimiento índice con confirmación a 12 meses. Patólogos cegados a la intervención. |
| 5. Selección del resultado reportado | Bajo | Ensayo registrado prospectivamente (NCT05384721). Resultados primarios y secundarios pre-especificados en protocolo. No hay evidencia de reporte selectivo de resultados. |

**Riesgo de sesgo global:** Bajo

### Evaluación GRADE

**Resultado:** Rendimiento diagnóstico para nódulos pulmonares periféricos

**Certeza inicial:** Alta (ensayo RCT)

**Downgrades:**
- **Indirectness (-1):** La experiencia operativa en centros académicos puede no reflejar la práctica comunitaria. Solo dos plataformas tecnológicas específicas comparadas.

**Upgrades:** Ninguno

**Certeza final:** Moderada

**Ración:** RCT de alta calidad con bajo riesgo de sesgo, degradado un nivel por indirectez (experiencia operativa, especificidad tecnológica).

### Banderas rojas

- Financiación industrial: subvención educativa irrestricta parcial de Intuitive Surgical (fabricante de la plataforma robótica)
- 3 autores recibieron honorarios de consultoría de Intuitive Surgical o Medtronic fuera de este trabajo
- Una sola plataforma tecnológica por brazo limita la generalizabilidad a otros sistemas robóticos o de navegación

### Juicio global del evaluador

**Confiable con reservas** — El estudio está bien diseñado y tiene bajo riesgo de sesgo metodológico, pero el conflicto de intereses potencial y la especificidad tecnológica requieren consideración antes de generalizar los resultados a otros contextos.

**Confianza de la valoración:** alta
