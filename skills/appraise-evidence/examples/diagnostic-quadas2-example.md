# Example: Diagnostic accuracy with QUADAS-2 assessment — EBUS-TBNA for mediastinal staging

## Paper metadata (synthetic)

**Title:** Diagnostic accuracy of endobronchial ultrasound-guided transbronchial needle aspiration for mediastinal staging in non-small cell lung cancer
**Authors:** Navarro et al.
**Journal:** Chest, 2023
**Study type:** Prospective diagnostic accuracy study
**Population:** 240 patients with confirmed or suspected NSCLC and radiologically enlarged or PET-positive mediastinal nodes
**Index test:** EBUS-TBNA
**Reference standard:** Surgical lymph node sampling (mediastinoscopy or systematic nodal dissection) or ≥12-month clinical-radiological follow-up
**Target disorder:** Mediastinal nodal metastasis (N2/N3)
**Results:** Sensitivity 92% (95% CI 87% to 96%), specificity 100%, negative predictive value 91%. Negative EBUS results not all confirmed surgically (partial verification by follow-up).

---

## JSON Output

```json
{
  "study_type_resolved": "diagnostic-accuracy",
  "ocebm_level": 2,
  "ocebm_question_type": "diagnosis",
  "appraisal_tool": "quadas-2",
  "appraisal_applicable": true,
  "quadas_2": {
    "patient_selection": {
      "risk_of_bias": "low",
      "applicability": "low",
      "rationale": "Consecutive enrollment of patients with an appropriate indication for mediastinal staging; no inappropriate exclusions. Spectrum representative of the staging population."
    },
    "index_test": {
      "risk_of_bias": "low",
      "applicability": "low",
      "rationale": "EBUS-TBNA performed and interpreted using a pre-specified protocol; cytopathologists blinded to the reference standard result."
    },
    "reference_standard": {
      "risk_of_bias": "high",
      "applicability": "low",
      "rationale": "Differential verification: positive EBUS results confirmed cytologically, but negative results verified surgically in only part of the cohort and by follow-up in the remainder, which can overestimate sensitivity."
    },
    "flow_and_timing": {
      "risk_of_bias": "high",
      "rationale": "Not all patients received the surgical reference standard (partial verification bias). Interval between index test and reference standard up to 8 weeks in some cases."
    }
  },
  "grade_assessment": {
    "outcome": "sensitivity for N2/N3 mediastinal metastasis",
    "starting_certainty": "high",
    "downgrades": [
      {
        "reason": "risk-of-bias",
        "magnitude": 1,
        "rationale": "Differential/partial verification of negative index results introduces risk of bias in the sensitivity estimate."
      }
    ],
    "upgrades": [],
    "final_certainty": "moderate",
    "rationale": "Accurate index test in a representative population, downgraded one level for verification bias affecting negative results."
  },
  "red_flags": [
    "Partial/differential verification of negative EBUS results (not all confirmed surgically)",
    "Single-center expertise may not generalize to lower-volume centers",
    "Specificity of 100% with no false positives is optimistic and warrants confirmation"
  ],
  "appraiser_overall_judgment": "trustworthy-with-caveats",
  "appraisal_confidence": "high"
}
```

---

## Valoración crítica (es-ES)

**Tipo de estudio resuelto:** Estudio de precisión diagnóstica prospectivo

**Nivel de evidencia OCEBM:** Nivel 2 (diagnóstico)

**Herramienta de valoración:** QUADAS-2

### Riesgo de sesgo y aplicabilidad (QUADAS-2)

| Dominio | Riesgo de sesgo | Aplicabilidad | Razón |
|---------|-----------------|---------------|-------|
| Selección de pacientes | Bajo | Baja | Inclusión consecutiva con indicación apropiada de estadificación; sin exclusiones inadecuadas. |
| Prueba índice | Bajo | Baja | EBUS-TBNA con protocolo predefinido; citopatólogos cegados al estándar de referencia. |
| Estándar de referencia | Alto | Baja | Verificación diferencial: los resultados negativos se confirman quirúrgicamente solo en parte y por seguimiento en el resto, lo que puede sobreestimar la sensibilidad. |
| Flujo y tiempos | Alto | — | No todos los pacientes reciben el estándar quirúrgico (sesgo de verificación parcial); intervalo de hasta 8 semanas. |

### Evaluación GRADE

**Resultado:** Sensibilidad para metástasis mediastínica N2/N3 — **Certeza inicial:** Alta
- **Riesgo de sesgo (-1):** Verificación parcial/diferencial de los resultados índice negativos.

**Certeza final:** Moderada

### Banderas rojas

- Verificación parcial/diferencial de los EBUS negativos (no todos confirmados quirúrgicamente)
- Experiencia de un único centro de alto volumen, poco generalizable
- Especificidad del 100% sin falsos positivos, optimista y a confirmar

### Juicio global del evaluador

**Confiable con reservas** — Precisión diagnóstica alta en una población representativa, pero el sesgo de verificación de los resultados negativos exige cautela al interpretar la sensibilidad y el valor predictivo negativo.

**Confianza de la valoración:** alta
