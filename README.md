# medzotero-skills

Kit de skills médicos para investigación biomédica en Zotero, especializado en neumología.

## Propósito

Construir 5 skills portables en markdown para análisis crítico de literatura biomédica, compatibles con:
- Claude Code
- LLM-for-Zotero
- Codex CLI

## Skills

### 1. extract-pico
**Qué hace:** Extrae estructuradamente el diseño PICO (Población, Intervención, Comparador, Outcome) y el tipo de estudio de un paper.

**Cuándo usarlo:**
- Para obtener un resumen estructurado rápido de un artículo
- Para identificar el diseño metodológico (RCT, cohorte, caso-control, etc.)
- Para extraer los endpoints primarios y secundarios
- Para entender la población estudiada y los criterios de inclusión/exclusión

**Triggers:** `extract pico`, `summarize`, `analyze`, `what's the design`

---

### 2. appraise-evidence
**Qué hace:** Evalúa la calidad metodológica y el nivel de evidencia de un paper usando herramientas estandarizadas (ROB 2 para RCTs, AMSTAR-2 para revisiones, NOS para estudios observacionales, QUADAS-2 para pruebas diagnósticas, PROBAST para modelos predictivos, AGREE II para guías, ROBINS-I para estudios no aleatorizados, GRADE para fuerza de recomendación, OCEBM para nivel de evidencia).

**Cuándo usarlo:**
- Para evaluar la validez interna de un estudio
- Para identificar sesgos potenciales (selección, desempeño, detección, atrición, reporte)
- Para determinar la fuerza de la evidencia (alta, moderada, baja, muy baja)
- Para decidir si confiar en los resultados antes de aplicarlos a la práctica

**Triggers:** `appraise`, `critical appraisal`, `risk of bias`, `level of evidence`, `grade`, `should i trust`, `is this study good`

---

### 3. clinical-relevance
**Qué hace:** Evalúa la relevancia clínica del paper para la práctica en España, considerando: significancia clínica (MCIDs neumológicos), aplicabilidad al contexto español (SNS, AEMPS, SEPAR), tamaño de efecto, NNT/NNH, coste-efectividad, y recomendaciones prácticas.

**Cuándo usarlo:**
- Para decidir si cambiar tu práctica basándote en un paper
- Para evaluar si los resultados son clínicamente significativos (no solo estadísticamente)
- Para entender la aplicabilidad en el sistema de salud español
- Para identificar barreras de implementación (coste, disponibilidad, formación)

**Triggers:** `clinical relevance`, `practice changing`, `change my practice`, `applicable to my patients`, `should i act`, `relevancia clínica`

---

### 4. synthesize-collection
**Qué hace:** Sintetiza evidencia de múltiples papers sobre la misma pregunta clínica. Genera un mapa de evidencia, evalúa consistencia entre estudios, calcula GRADE agregado, identifica gaps de evidencia, y deriva implicaciones para la práctica.

**Cuándo usarlo:**
- Cuando tienes varios papers sobre la misma pregunta clínica
- Para entender el panorama completo de la evidencia
- Para identificar inconsistencias o heterogeneidad entre estudios
- Para determinar si la evidencia es suficientemente robusta para cambiar la práctica
- Para identificar áreas donde falta investigación

**Triggers:** `synthesize collection`, `evidence synthesis`, `what does the evidence say`, `summarize my collection`, `evidence gaps`, `síntesis de evidencia`

---

### 5. compare-guidelines
**Qué hace:** Compara un paper contra guías clínicas vigentes (SEPAR, ATS, ERS, GOLD, GINA, IASLC, NICE, AASM, etc.). Determina si el paper se alinea, extiende, refina, contradice o es prematuro para cambiar las recomendaciones actuales. Incluye un caveat obligatorio sobre el cutoff de conocimiento del modelo.

**Cuándo usarlo:**
- Para entender cómo un paper se relaciona con la práctica recomendada
- Para saber si un estudio contradice guías establecidas
- Para evaluar si un paper justifica actualizar una recomendación
- Para identificar qué guías son relevantes a un tema específico
- Para saber si un hallazgo es consistente con SEPAR/ATS/ERS/GOLD/GINA

**Triggers:** `compare guidelines`, `what do guidelines say`, `does this contradict`, `should guidelines change`, `consistent with separ/ats/ers/gold/gina`, `comparar con guías`

## Estado

✅ Fase 1 completa: 5 skills implementados. Ver `docs/medzotero-skills-plan.md` para el plan detallado y los criterios go/no-go para la Fase 2 (plugin).

### Estado actual

- ✅ `extract-pico` — SKILL.md, schema.json y 2 ejemplos sintéticos
- ✅ `appraise-evidence` — SKILL.md y schema.json (ROB 2, AMSTAR-2, NOS, QUADAS-2, PROBAST, AGREE II, ROBINS-I, GRADE, OCEBM)
- ✅ `clinical-relevance` — SKILL.md, schema.json, 2 ejemplos sintéticos, contexto AEMPS/SNS/SEPAR + MCIDs neumológicas
- ✅ `synthesize-collection` — SKILL.md, schema.json, 2 ejemplos sintéticos (mapa de evidencia, consistencia, GRADE agregado, gaps, implicaciones para la práctica)
- ✅ `compare-guidelines` — SKILL.md, schema.json, 2 ejemplos sintéticos, mapeo de guías mayores (SEPAR, ATS, ERS, GOLD, GINA, IASLC, NICE, AASM…) con caveat obligatorio de cutoff de entrenamiento

## Despliegue en LLM-for-Zotero

LLM-for-Zotero usa un formato de skill diferente al de Claude Code: requiere `id` + `match` patterns (regex) en lugar de `name` + `description`, y los skills solo se disparan en **Agent Mode**.

### Script `deploy/flatten-for-llm-for-zotero.sh`

Convierte los `SKILL.md` (formato Claude Code) a versiones ultra-minimal compatibles con LLM-for-Zotero Agent Mode. Características:

- Genera un `.md` por skill en `${ZOTERO_DATA_DIR:-$HOME/Zotero}/llm-for-zotero/skills/`
- Skills desplegados:
  - `extract-pico.md` — disparadores: `extract pico`, `summarize`, `analyze`, `what's the design`
  - `appraise-evidence.md` — disparadores: `appraise`, `critical appraisal`, `risk of bias`, `level of evidence`, `grade`, `should i trust`, `is this study good`
  - `clinical-relevance.md` — disparadores: `clinical relevance`, `practice changing`, `change my practice`, `applicable to my patients`, `should i act`, `relevancia clínica`
  - `synthesize-collection.md` — disparadores: `synthesize collection`, `evidence synthesis`, `what does the evidence say`, `summarize my collection`, `evidence gaps`, `síntesis de evidencia`
  - `compare-guidelines.md` — disparadores: `compare guidelines`, `what do guidelines say`, `does this contradict`, `should guidelines change`, `consistent with separ/ats/ers/gold/gina`, `comparar con guías`
- Cada skill incluye frontmatter LLM-for-Zotero (`id` + `match` patterns)
- Versiones simplificadas (~50-80 líneas) para que entren en el contexto del modelo incluso con PDFs largos
- Excluye los `examples/` y los `schema.json` formales para reducir tokens (se mantienen en el repo para Claude Code y el plugin futuro)

### Uso en LLM-for-Zotero

```bash
# 1. Ejecuta el script de despliegue
./deploy/flatten-for-llm-for-zotero.sh

# 2. Reinicia Zotero

# 3. En Zotero:
#    - Activa Agent Mode en Preferences → llm-for-zotero
#    - Abre Standalone Window con Cmd+Shift+L (macOS) o Ctrl+Shift+L (Linux/Windows)
#    - Selecciona un paper o usa los triggers para activar skills
```

### Flujo de trabajo recomendado

Para análisis completo de un paper:

1. **`extract-pico`** — Extrae PICO y diseño del estudio
2. **`appraise-evidence`** — Evalúa calidad metodológica y nivel de evidencia
3. **`clinical-relevance`** — Determina relevancia para práctica en España
4. **`compare-guidelines`** — Compara con guías vigentes (opcional)

Para síntesis de múltiples papers:

1. Selecciona múltiples papers sobre la misma pregunta clínica
2. **`synthesize-collection`** — Genera mapa de evidencia y síntesis

### Limitaciones conocidas de LLM-for-Zotero

- **Selección múltiple:** Zotero no permite seleccionar múltiples papers en Agent Mode. Para `synthesize-collection`, el agente puede buscar en tu biblioteca o puedes pegar abstracts adicionales.
- **Triggers:** Si un trigger no funciona automáticamente, selecciona el skill manualmente con `/` y el nombre del skill.
- **Contexto:** Los skills están simplificados (~50-80 líneas) para caber en el contexto junto con PDFs largos. Para análisis más detallados, usa Claude Code directamente.

### Troubleshooting

**Problema:** El skill no se activa automáticamente con el trigger
- **Solución:** Selecciona el skill manualmente con `/` y el nombre (ej. `/extract-pico`)

**Problema:** `synthesize-collection` modifica metadatos de Zotero
- **Solución:** Asegúrate de haber ejecutado el script después del fix (commit `0073306`). El skill ahora tiene reglas explícitas para NO modificar metadatos.

**Problema:** `compare-guidelines` devuelve guías irrelevantes (ej. guías cardiacas para TEP)
- **Solución:** Asegúrate de haber ejecutado el script después del fix (commit `60f4599`). El skill ahora filtra por relevancia temática estricta.

**Problema:** `synthesize-collection` encuentra guías en lugar de estudios originales
- **Solución:** Asegúrate de haber ejecutado el script después del fix (commit `c088e6d`). El skill ahora filtra por tipo de ítem (solo artículos de investigación, excluye guías).

**Problema:** El agente se queda atascado con abstracts truncados
- **Solución:** Asegúrate de haber ejecutado el script después del fix (commit `5096413`). El skill ahora procede con información disponible o pide el abstract completo.

### Formato esperado (LLM-for-Zotero)

```yaml
---
id: extract-pico
match: /extract pico/i
match: /summarize/i
---
[instrucciones del skill]
```

### Personalización

Si necesitas modificar el contenido del skill desplegado, edita el `cat > ... << 'EOF'` dentro del script. Si quieres incluir los `examples/`, descomenta las líneas relevantes (puede causar errores "Agent stopped" con PDFs largos).

## Licencia

MIT © 2026 Edmundo Rosales
