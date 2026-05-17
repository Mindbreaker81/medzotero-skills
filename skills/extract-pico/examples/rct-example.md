# Example: RCT — Robotic vs ENB bronchoscopy

**NOTE: This is a synthetic example, not a real published study. It illustrates the expected output format for an RCT.**

## Input (abstract)

Title: Robotic-Assisted Bronchoscopy versus Electromagnetic Navigation Bronchoscopy for Diagnosis of Peripheral Pulmonary Nodules: A Multicenter Randomized Controlled Trial

Abstract:
Background: Peripheral pulmonary nodules (PPNs) present diagnostic challenges. Electromagnetic navigation bronchoscopy (ENB) is an established technique, but robotic-assisted bronchoscopy offers potential improvements in reach and stability.

Methods: We conducted a multicenter, open-label, randomized controlled trial at 8 academic centers in the United States. Adults (age ≥18 years) with solid or part-solid nodules 8-30 mm located in the outer third of the lung field were randomized 1:1 to robotic-assisted bronchoscopy (Ion platform) with cone-beam CT confirmation or ENB (superDimension). The primary outcome was diagnostic yield, defined as the proportion of nodules with definitive pathologic diagnosis at the index procedure, confirmed with 12-month follow-up. Secondary outcomes included procedural complications and diagnostic yield by nodule size and location.

Results: Between January 2023 and June 2024, 412 patients were screened, 350 enrolled, and 343 analyzed (7 lost to follow-up). Diagnostic yield was 82.4% (141/171) in the robotic arm vs 71.6% (123/172) in the ENB arm (absolute difference 10.8%, 95% CI 3.2% to 18.4%; p=0.006). Pneumothorax requiring chest tube occurred in 2.1% vs 3.8% (p=0.31). Any pneumothorax occurred in 5.7% vs 6.2% (p=0.84).

Conclusions: Robotic-assisted bronchoscopy achieved higher diagnostic yield than ENB for peripheral pulmonary nodules, with comparable safety. These findings support robotic bronchoscopy as a preferred approach for peripheral nodule diagnosis.

Trial Registration: NCT05XXXXXX (ClinicalTrials.gov)

Funding: Investigator-initiated; partial unrestricted educational grant from Intuitive Surgical. Sponsor had no role in design, conduct, analysis, or manuscript.

Conflicts of Interest: Three authors received consulting fees from Intuitive Surgical or Medtronic outside this work.

## Expected output

### JSON

```json
{
  "study_type": "rct",
  "meta_analysis": null,
  "pico_applicable": true,
  "pico": {
    "population": {
      "description": "Adults with peripheral pulmonary nodules 8-30 mm requiring tissue diagnosis",
      "key_inclusion_criteria": [
        "Age ≥18 years",
        "Solid or part-solid nodule 8-30 mm on CT",
        "Located in outer third of lung field",
        "Candidate for bronchoscopic biopsy"
      ],
      "key_exclusion_criteria": [
        "Endobronchial lesion visible on standard bronchoscopy",
        "ECOG performance status >2",
        "Active anticoagulation that cannot be held"
      ],
      "setting": "Multicenter, 8 academic centers",
      "country_or_region": "United States"
    },
    "intervention": {
      "description": "Robotic-assisted bronchoscopy (Ion platform) with cone-beam CT confirmation",
      "dose_or_intensity": null,
      "duration": "Single procedure"
    },
    "comparison": {
      "description": "Electromagnetic navigation bronchoscopy (superDimension) per standard institutional protocol",
      "type": "active-comparator"
    },
    "outcomes": {
      "primary": [
        {
          "name": "Diagnostic yield (proportion of nodules with definitive pathologic diagnosis at index procedure)",
          "measurement": "Per-nodule basis, 12-month follow-up to confirm or reclassify",
          "effect": "82.4% (robotic) vs 71.6% (ENB)",
          "ci_95": "Absolute difference 10.8% (95% CI 3.2% to 18.4%)",
          "p_value": "0.006"
        }
      ],
      "secondary": [
        {
          "name": "Procedural complications (pneumothorax requiring chest tube)",
          "effect": "2.1% vs 3.8%",
          "ci_95": null,
          "p_value": "0.31"
        }
      ],
      "safety": [
        {
          "name": "Any pneumothorax",
          "effect": "5.7% vs 6.2%",
          "ci_95": null,
          "p_value": "0.84"
        }
      ]
    }
  },
  "sample_size": {
    "screened": 412,
    "enrolled": 350,
    "analyzed": 343,
    "lost_to_followup": 7,
    "analysis_type": "modified-itt"
  },
  "duration": {
    "enrollment_period": "January 2023 - June 2024",
    "follow_up_median": "12 months",
    "follow_up_range": "6-18 months"
  },
  "funding": "Investigator-initiated; partial unrestricted educational grant from Intuitive Surgical. Sponsor had no role in design, conduct, analysis, or manuscript.",
  "conflicts_of_interest": "3 authors received consulting fees from Intuitive Surgical or Medtronic outside this work.",
  "registration": {
    "id": "NCT05XXXXXX",
    "registry": "ClinicalTrials.gov"
  },
  "key_limitations_stated_by_authors": [
    "Single technology platform per arm; results may not generalize to other robotic systems",
    "Operator experience higher in academic centers may not reflect community practice",
    "Diagnostic yield definition does not capture downstream clinical management impact"
  ],
  "extraction_confidence": "high",
  "extraction_notes": "Full text parsed. All key fields explicit in paper."
}
```

### Narrativa española

## Resumen estructurado

**Tipo de estudio:** Ensayo clínico aleatorizado, multicéntrico, abierto, comparativo.

**Pregunta clínica:** En adultos con nódulos pulmonares periféricos de 8-30 mm, ¿la broncoscopia asistida por robot (Ion) mejora el rendimiento diagnóstico frente a la navegación electromagnética (superDimension)?

**Población:** 350 pacientes en 8 centros académicos de EE. UU. con nódulos periféricos en tercio externo, candidatos a biopsia broncoscópica. Excluye lesiones endobronquiales visibles y ECOG >2.

**Intervención (o exposición / test):** Broncoscopia robótica con confirmación por cone-beam CT.

**Comparador:** Navegación electromagnética según protocolo institucional.

**Resultado principal:** Rendimiento diagnóstico — proporción de nódulos con diagnóstico anatomopatológico definitivo en el procedimiento índice, con seguimiento a 12 meses.

**Resultados clave:**
- Rendimiento diagnóstico: 82,4% robótica vs 71,6% navegación electromagnética (diferencia absoluta 10,8%, IC 95% 3,2% a 18,4%; p=0,006).
- Neumotórax que requiere drenaje: 2,1% vs 3,8% (sin diferencia significativa).
- Cualquier neumotórax: 5,7% vs 6,2% (sin diferencia).

**Limitaciones declaradas:** Una sola plataforma por brazo (no generalizable a otros sistemas robóticos); experiencia operadora alta en centros académicos puede no reflejar la práctica comunitaria; la definición de rendimiento diagnóstico no captura el impacto en el manejo clínico posterior.

**Confianza de la extracción:** alta — texto completo analizado, todos los campos explícitos en el paper.
