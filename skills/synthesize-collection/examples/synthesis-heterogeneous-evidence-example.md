# Example: Heterogeneous evidence — Transbronchial cryobiopsy vs surgical lung biopsy in ILD diagnosis

## Collection metadata (synthetic)

**Clinical question (PICO):**
- **P:** Adults with suspected interstitial lung disease (ILD) requiring histologic confirmation when HRCT is non-diagnostic
- **I:** Transbronchial lung cryobiopsy (TBLC)
- **C:** Surgical lung biopsy (SLB; VATS)
- **O:** Diagnostic yield, MDD-based diagnostic confidence, complications (pneumothorax, bleeding, mortality)

**Studies included (4 synthetic papers):**

| # | Study | Design | N | Country | Key finding |
|---|-------|--------|---|---------|-------------|
| 1 | Bianchi 2022 | RCT (COLDICE-like) | 65 | Italy | TBLC vs SLB diagnostic concordance 71% with high MDD agreement |
| 2 | Anderson 2021 | Multicenter prospective cohort | 312 | UK/USA | TBLC DY 79%, SLB DY 95%; pneumothorax 14% TBLC vs 6% SLB |
| 3 | Schmidt 2023 | Retrospective cohort | 478 | Germany | TBLC DY 88% (no SLB arm); 30-day mortality 0.4% |
| 4 | Yamamoto 2024 | RCT (small) | 50 | Japan | TBLC vs SLB diagnostic concordance 56%, more discordance in fibrotic NSIP |

## Evidence synthesis (JSON)

```json
{
  "clinical_question": "In adults with suspected ILD requiring histologic confirmation when HRCT is non-diagnostic, what is the comparative diagnostic yield and safety of transbronchial cryobiopsy versus surgical lung biopsy?",
  "number_of_studies": 4,
  "study_designs_summary": {
    "rct": 2,
    "cohort-prospective": 1,
    "cohort-retrospective": 1
  },
  "evidence_map": [
    {
      "study_id": "Bianchi2022",
      "design": "rct",
      "country": "Italy",
      "year": 2022,
      "n": 65,
      "population": "Suspected ILD, HRCT non-diagnostic, candidates for tissue diagnosis",
      "intervention": "Transbronchial cryobiopsy (1.9 mm probe)",
      "comparator": "Surgical lung biopsy (VATS) — same patient, paired design",
      "primary_outcome": {
        "name": "Histopathologic concordance (TBLC vs SLB) and MDD diagnostic agreement",
        "effect": "Histologic concordance 71%; MDD-based diagnostic agreement substantially higher (~95%)",
        "ci_95": "Concordance 95% CI 58-82%",
        "p_value": null
      },
      "ocebm_level": 2,
      "risk_of_bias": "low (ROB 2; small N is the main concern)",
      "key_limitations": "Small sample, single tertiary center, paired design limits external generalizability",
      "funding": "Institutional + AIPO grant"
    },
    {
      "study_id": "Anderson2021",
      "design": "cohort-prospective",
      "country": "United Kingdom / United States",
      "year": 2021,
      "n": 312,
      "population": "Suspected ILD across 6 academic centers",
      "intervention": "TBLC (per local protocol)",
      "comparator": "SLB (concurrent series, non-randomized)",
      "primary_outcome": {
        "name": "Diagnostic yield at MDD",
        "effect": "TBLC 79% vs SLB 95% (absolute difference -16%)",
        "ci_95": "-23% to -9%",
        "p_value": "<0.001"
      },
      "ocebm_level": 3,
      "risk_of_bias": "NOS 6/9 (selection bias: TBLC offered to higher-risk patients in some centers)",
      "key_limitations": "Indication bias; protocol heterogeneity across centers; pneumothorax rate 14% TBLC vs 6% SLB",
      "funding": "BTS grant; one author consulting fees from Erbe"
    },
    {
      "study_id": "Schmidt2023",
      "design": "cohort-retrospective",
      "country": "Germany",
      "year": 2023,
      "n": 478,
      "population": "Suspected ILD, single tertiary center, 2015-2022",
      "intervention": "TBLC",
      "comparator": null,
      "primary_outcome": {
        "name": "MDD diagnostic yield (no comparator arm)",
        "effect": "88% (single-arm)",
        "ci_95": "85% to 91%",
        "p_value": null
      },
      "ocebm_level": 4,
      "risk_of_bias": "NOS 5/9 (single arm, retrospective, era spans pre/post protocol changes)",
      "key_limitations": "No SLB comparator; learning curve confounding; 30-day mortality 0.4%",
      "funding": "Institutional"
    },
    {
      "study_id": "Yamamoto2024",
      "design": "rct",
      "country": "Japan",
      "year": 2024,
      "n": 50,
      "population": "Suspected ILD, fibrotic pattern predominant on HRCT",
      "intervention": "TBLC",
      "comparator": "SLB (paired design)",
      "primary_outcome": {
        "name": "Histopathologic concordance",
        "effect": "56% concordance",
        "ci_95": "41-71%",
        "p_value": null
      },
      "ocebm_level": 2,
      "risk_of_bias": "some concerns (ROB 2; small N, single center, possible measurement bias in pathology review)",
      "key_limitations": "Small N; selected for fibrotic pattern (where TBLC is known to underperform); pathologists not blinded",
      "funding": "Institutional"
    }
  ],
  "consistency_assessment": {
    "direction_of_effect": "mixed",
    "magnitude_consistency": "Diagnostic yield estimates for TBLC range widely (56% concordance to 88% MDD-based yield) depending on outcome definition and population.",
    "explanations_for_discordance": [
      "Outcome definition heterogeneity: histopathologic concordance (Bianchi, Yamamoto) vs MDD-based diagnostic yield (Anderson, Schmidt) are not directly comparable",
      "Population selection: Yamamoto enriched for fibrotic patterns where TBLC underperforms; Schmidt is single-arm with no SLB comparator",
      "Operator experience: Anderson's multicenter design captured variability that single-center studies (Bianchi, Schmidt, Yamamoto) do not",
      "Sample sizes vary 10-fold (50 vs 478), driving very different precision",
      "Publication era: practice patterns and probe technology evolved between 2021 and 2024"
    ]
  },
  "aggregate_quality": {
    "overall_grade_certainty": "low",
    "rationale": "Body of evidence: 2 small RCTs (one with discordant results in fibrotic subgroup) + 1 prospective cohort with indication bias + 1 single-arm retrospective. Start at High for RCT-anchored body, but downgrade 2 levels: -1 for inconsistency (concordance estimates 56-71% in two RCTs is meaningful divergence in the same metric), -1 for indirectness/imprecision (small RCTs, mixed populations, outcome definitions not aligned). Could downgrade further for risk of bias in the cohort studies but already at Low.",
    "risk_of_bias_distribution": "2 small RCTs (1 low-risk, 1 some concerns); 1 prospective cohort NOS 6/9 with indication bias; 1 retrospective single-arm NOS 5/9"
  },
  "evidence_gaps": [
    "No adequately powered RCT comparing TBLC vs SLB with MDD-based diagnostic yield as primary outcome",
    "No prospective evaluation in radiologically suspected non-fibrotic ILD subgroups",
    "Long-term diagnostic stability (>12 months) under-reported",
    "Patient-relevant outcomes (avoiding SLB, hospital stay, recovery time, satisfaction) sparsely reported",
    "Heterogeneity in TBLC technique (probe size, freeze duration, balloon use) not addressed in head-to-head comparisons",
    "No SNS/Spanish data; all studies are non-Spanish single- or multi-center academic series",
    "Cost-effectiveness analysis absent",
    "No standardized reporting of complications (pneumothorax requiring drainage vs not; bleeding grades)"
  ],
  "practice_implications": {
    "supported": [
      "TBLC may be a reasonable first-line tissue diagnostic procedure in selected patients with suspected ILD when HRCT is non-diagnostic, particularly when MDD-based diagnosis is the goal rather than histopathologic concordance with SLB",
      "TBLC requires multidisciplinary discussion (MDD) integration to compensate for histopathologic divergence from SLB"
    ],
    "not_supported": [
      "Routine TBLC as a direct substitute for SLB without MDD integration",
      "TBLC in predominantly fibrotic patterns as first-line — Yamamoto 2024 suggests reduced concordance in this subgroup",
      "Generalization of single-center retrospective yields (e.g., 88%) to community practice"
    ],
    "requires_individualization": [
      "Choice of TBLC vs SLB depends on patient surgical risk, local cryobiopsy expertise, MDD availability, and HRCT pattern (fibrotic vs not)",
      "Probe size and technique parameters (freeze duration, balloon occlusion) should follow local protocol with documented outcomes",
      "Decision should be made in MDD, not by single specialist"
    ],
    "high_priority_research": [
      "Adequately powered multicenter RCT with MDD-based diagnostic yield as primary outcome",
      "Prospective cohort in SNS context to characterize TBLC performance and complication rates in Spanish centers",
      "Standardized outcome definitions (concordance vs MDD-based yield) and complication grading",
      "Patient-reported outcomes and cost-effectiveness from public health system perspective",
      "Subgroup analysis by HRCT pattern (fibrotic vs cellular vs mixed) to refine indication"
    ]
  },
  "synthesis_confidence": "medium",
  "synthesis_notes": "Body of evidence is heterogeneous in design, outcome definitions, populations, and sample sizes. A pooled meta-analysis is not appropriate here. Synthesis is presented as narrative + structured map; conclusions are deliberately conservative. The clinician should not interpret this as 'TBLC equivalent to SLB' or as 'TBLC inferior to SLB' — the truth is conditional on outcome definition and patient subgroup."
}
```

## Síntesis de evidencia (es-ES)

**Pregunta clínica (PICO):** En adultos con sospecha de EPID que requieren confirmación histológica cuando la TCAR no es diagnóstica, ¿cuál es el rendimiento diagnóstico y la seguridad comparada de la criobiopsia transbronquial frente a la biopsia pulmonar quirúrgica?

### Mapa de evidencia

| Estudio | Diseño | N | País | Resultado principal | OCEBM | RoB |
|---------|--------|---|------|---------------------|-------|-----|
| Bianchi 2022 | ECA pareado | 65 | Italia | Concordancia histológica 71% (IC 58–82) | 2 | bajo |
| Anderson 2021 | Cohorte prospectiva multicéntrica | 312 | UK/EE. UU. | DY MDD 79% TBLC vs 95% SLB (Δ -16%) | 3 | NOS 6/9 |
| Schmidt 2023 | Cohorte retrospectiva | 478 | Alemania | DY MDD 88% (un solo brazo) | 4 | NOS 5/9 |
| Yamamoto 2024 | ECA pareado | 50 | Japón | Concordancia histológica 56% (IC 41–71) | 2 | algunas dudas |

### Consistencia y discordancia

- **Dirección del efecto:** mixta — los resultados varían sustancialmente según la definición del outcome y la población.
- **Magnitud:** muy heterogénea (concordancia 56–71% en los ECA; DY MDD 79–88% en estudios observacionales).
- **Posibles explicaciones de discordancia:**
  - **Definición del outcome:** concordancia histológica vs DY basado en MDD no son comparables directamente.
  - **Selección de población:** Yamamoto enriqueció patrones fibróticos (donde la TBLC rinde peor); Schmidt no tiene comparador SLB.
  - **Experiencia del operador:** Anderson capturó variabilidad multicéntrica; los demás son centros únicos.
  - **Tamaño muestral:** rango 50–478, con precisiones muy distintas.
  - **Era de publicación:** 2021–2024, con cambios en técnica y protocolo entre estudios.

### Calidad global

- **Distribución de diseños:** 2 ECA pequeños + 1 cohorte prospectiva + 1 retrospectiva (un solo brazo).
- **Distribución de RoB:** 1 ECA bajo riesgo, 1 ECA con dudas; cohorte prospectiva NOS 6/9 con sesgo de indicación; retrospectiva NOS 5/9.
- **Certeza GRADE para rendimiento diagnóstico:** **baja**. Se parte de alta por anclaje en ECA, pero se baja 2 niveles: -1 por inconsistencia (concordancias 56–71% en ECA es divergencia importante en la misma métrica), -1 por imprecisión/indirección (ECA pequeños, poblaciones mixtas, definiciones no alineadas).

### Gaps de evidencia

- No hay ECA con potencia adecuada usando DY basado en MDD como outcome primario.
- Sin evaluación prospectiva en subgrupos no fibróticos.
- Estabilidad diagnóstica a largo plazo poco reportada.
- Outcomes relevantes para el paciente (evitar SLB, estancia hospitalaria, recuperación, satisfacción) escasamente reportados.
- Heterogeneidad en técnica TBLC (sonda, duración del congelado, balón) no abordada.
- Ausencia de datos del SNS / España.
- Ausencia de coste-efectividad.
- No estandarización en reporte de complicaciones (neumotórax con/sin drenaje; grados de hemorragia).

### Implicaciones para la práctica

- **Apoyado por la evidencia:** la TBLC puede ser una opción razonable de primera línea en pacientes seleccionados con sospecha de EPID y TCAR no diagnóstica, **siempre con integración en MDD**, sustituyendo el endpoint de "concordancia histológica con SLB" por "diagnóstico definitivo en MDD".
- **No apoyado:** sustitución rutinaria de SLB por TBLC sin MDD; uso de TBLC como primera línea en patrones predominantemente fibróticos; extrapolación de rendimientos de centros únicos retrospectivos a la práctica comunitaria.
- **Requiere individualización:** elección TBLC vs SLB según riesgo quirúrgico del paciente, experiencia local, disponibilidad de MDD y patrón en TCAR; parámetros técnicos según protocolo local con outcomes documentados; decisión en MDD, no por especialista único.
- **Investigación prioritaria:** ECA multicéntrico con potencia adecuada y DY-MDD como primario; cohorte prospectiva en el SNS; estandarización de definiciones de outcome y grado de complicaciones; outcomes reportados por el paciente y coste-efectividad; análisis por subgrupo según patrón TCAR.

**Confianza de la síntesis:** media — el cuerpo evidencial es heterogéneo en diseño, definiciones de outcome, poblaciones y tamaños muestrales. No procede metaanálisis. Las conclusiones son deliberadamente conservadoras: la evidencia **no** demuestra "TBLC equivalente a SLB" ni "TBLC inferior a SLB"; la respuesta depende de la definición del outcome y del subgrupo del paciente.
