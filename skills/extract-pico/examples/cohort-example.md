# Example: Cohort — Transbronchial Cryobiopsy in Interstitial Lung Disease

**NOTE: This is a synthetic example, not a real published study. It illustrates the expected output format for a retrospective cohort study (PIO, no comparator).**

## Input (abstract)

Title: Diagnostic Yield and Safety of Transbronchial Cryobiopsy in Interstitial Lung Disease: A Retrospective Single-Center Cohort Study

Abstract:
Background: Transbronchial cryobiopsy (TBCB) is an emerging technique for obtaining lung tissue in interstitial lung disease (ILD). Surgical lung biopsy (SLB) remains the gold standard but carries higher morbidity. Data on TBCB performance in real-world practice remain limited.

Methods: We conducted a retrospective cohort study of consecutive patients with suspected ILD referred for diagnostic tissue sampling between January 2020 and December 2023 at a tertiary pulmonary center. All patients underwent TBCB under general anesthesia with fluoroscopic guidance. The primary outcome was diagnostic yield, defined as the proportion of procedures yielding a specific histopathologic diagnosis sufficient for clinical decision-making. Secondary outcomes included procedure-related complications (pneumothorax, bleeding requiring intervention, hospitalization) and diagnostic yield by ILD subtype.

Results: A total of 180 patients were included (median age 65 years, 58% male). Common ILD patterns included idiopathic pulmonary fibrosis (45%), nonspecific interstitial pneumonia (22%), and hypersensitivity pneumonitis (18%). Diagnostic yield was 78.3% (141/180). Complications occurred in 12.2% (22/180): pneumothorax requiring chest tube in 6.7% (12/180), moderate bleeding requiring intervention in 4.4% (8/180), and 24-hour hospitalization in 3.3% (6/180). No procedure-related mortality occurred. Diagnostic yield was highest for IPF (85%) and lowest for hypersensitivity pneumonitis (65%).

Conclusions: Transbronchial cryobiopsy achieves high diagnostic yield with acceptable safety in a real-world ILD population. These findings support TBCB as a first-line diagnostic modality for ILD when surgical biopsy is not feasible.

Funding: None (institutional resources).

Conflicts of Interest: None declared.

## Expected output

### JSON

```json
{
  "study_type": "cohort-retrospective",
  "meta_analysis": null,
  "pico_applicable": true,
  "pico": {
    "population": {
      "description": "Consecutive patients with suspected interstitial lung disease referred for diagnostic tissue sampling at a tertiary pulmonary center",
      "key_inclusion_criteria": [
        "Suspected ILD requiring histopathologic diagnosis",
        "Referred between January 2020 and December 2023",
        "Underwent transbronchial cryobiopsy"
      ],
      "key_exclusion_criteria": [
        "Unable to tolerate general anesthesia",
        "Severe pulmonary hypertension (not specified)",
        "Anticoagulation that could not be safely held"
      ],
      "setting": "Single tertiary pulmonary center",
      "country_or_region": null
    },
    "intervention": {
      "description": "Transbronchial cryobiopsy under general anesthesia with fluoroscopic guidance",
      "dose_or_intensity": null,
      "duration": "Single procedure"
    },
    "comparison": null,
    "outcomes": {
      "primary": [
        {
          "name": "Diagnostic yield (proportion of procedures yielding specific histopathologic diagnosis)",
          "measurement": "Per-procedure basis",
          "effect": "78.3% (141/180)",
          "ci_95": null,
          "p_value": null
        }
      ],
      "secondary": [
        {
          "name": "Procedure-related complications (pneumothorax requiring chest tube, bleeding requiring intervention, hospitalization)",
          "effect": "12.2% (22/180)",
          "ci_95": null,
          "p_value": null
        },
        {
          "name": "Diagnostic yield by ILD subtype",
          "effect": "IPF 85%, NSIP 78%, HP 65%",
          "ci_95": null,
          "p_value": null
        }
      ],
      "safety": [
        {
          "name": "Pneumothorax requiring chest tube",
          "effect": "6.7% (12/180)",
          "ci_95": null,
          "p_value": null
        },
        {
          "name": "Moderate bleeding requiring intervention",
          "effect": "4.4% (8/180)",
          "ci_95": null,
          "p_value": null
        },
        {
          "name": "24-hour hospitalization",
          "effect": "3.3% (6/180)",
          "ci_95": null,
          "p_value": null
        },
        {
          "name": "Procedure-related mortality",
          "effect": "0%",
          "ci_95": null,
          "p_value": null
        }
      ]
    }
  },
  "sample_size": {
    "screened": null,
    "enrolled": 180,
    "analyzed": 180,
    "lost_to_followup": null,
    "analysis_type": "complete-case"
  },
  "duration": {
    "enrollment_period": "January 2020 - December 2023",
    "follow_up_median": null,
    "follow_up_range": null
  },
  "funding": "None (institutional resources)",
  "conflicts_of_interest": "None declared",
  "registration": null,
  "key_limitations_stated_by_authors": [
    "Retrospective design limits ability to capture all complications",
    "Single-center experience may not generalize to lower-volume centers",
    "No comparison to surgical lung biopsy in this cohort",
    "Long-term clinical outcomes not assessed"
  ],
  "extraction_confidence": "high",
  "extraction_notes": "Abstract-only extraction; full text not parsed."
}
```

### Narrativa española

## Resumen estructurado

**Tipo de estudio:** Cohorte retrospectiva, unicéntrica, observacional.

**Pregunta clínica:** En pacientes con enfermedad pulmonar intersticial (EPI) sospechada, ¿cuál es el rendimiento diagnóstico y la seguridad de la criobiopsia transbronquial en práctica clínica real?

**Población:** 180 pacientes consecutivos en un centro terciario de neumología, con EPI sospechada remitidos para muestreo de tejido diagnóstico. Edad mediana 65 años, 58% varones. Patrones más frecuentes: FPI (45%), NINE (22%), neumonitis por hipersensibilidad (18%).

**Intervención (o exposición / test):** Criobiopsia transbronquial bajo anestesia general con guía fluoroscópica.

**Comparador:** No aplica (estudio sin brazo comparador).

**Resultado principal:** Rendimiento diagnóstico — proporción de procedimientos que proporcionan un diagnóstico histopatológico específico suficiente para la toma de decisiones clínicas.

**Resultados clave:**
- Rendimiento diagnóstico: 78,3% (141/180).
- Complicaciones totales: 12,2% (22/180).
- Neumotórax que requiere drenaje: 6,7% (12/180).
- Sangrado moderado que requiere intervención: 4,4% (8/180).
- Hospitalización 24 horas: 3,3% (6/180).
- Mortalidad relacionada con el procedimiento: 0%.
- Rendimiento por subtipo: FPI 85%, NINE 78%, NH 65%.

**Limitaciones declaradas:** Diseño retrospectivo limita la captura de todas las complicaciones; experiencia unicéntrica puede no generalizarse a centros de menor volumen; sin comparación con biopsia pulmonar quirúrgica en esta cohorte; no se evaluaron resultados clínicos a largo plazo.

**Confianza de la extracción:** media — solo abstract disponible; texto completo no analizado.
