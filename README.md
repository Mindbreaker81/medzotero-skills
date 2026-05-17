# medzotero-skills

Kit de skills médicos para investigación biomédica en Zotero, especializado en neumología.

## Propósito

Construir 5 skills portables en markdown para análisis crítico de literatura biomédica, compatibles con:
- Claude Code
- LLM-for-Zotero
- Codex CLI

## Skills

1. **extract-pico** — Extracción estructurada PICO y tipo de estudio
2. **appraise-evidence** — Valoración crítica (OCEBM, GRADE, ROB 2, AMSTAR-2)
3. **clinical-relevance** — Relevancia para práctica clínica en España (SNS, AEMPS, SEPAR)
4. **synthesize-collection** — Síntesis de evidencia multi-paper
5. **compare-guidelines** — Comparación con guías clínicas vigentes

## Estado

🚧 Proyecto en fase inicial. Ver `docs/medzotero-skills-plan.md` para el plan detallado.

### Estado actual

- ✅ `extract-pico` — SKILL.md, schema.json y 2 ejemplos sintéticos
- ✅ `appraise-evidence` — SKILL.md y schema.json (ROB 2, AMSTAR-2, NOS, QUADAS-2, PROBAST, AGREE II, ROBINS-I, GRADE, OCEBM)
- ⏳ `clinical-relevance`, `synthesize-collection`, `compare-guidelines` (planificados)

## Despliegue en LLM-for-Zotero

LLM-for-Zotero usa un formato de skill diferente al de Claude Code: requiere `id` + `match` patterns (regex) en lugar de `name` + `description`, y los skills solo se disparan en **Agent Mode**.

### Script `deploy/flatten-for-llm-for-zotero.sh`

Convierte los `SKILL.md` (formato Claude Code) a versiones ultra-minimal compatibles con LLM-for-Zotero Agent Mode. Características:

- Genera un `.md` por skill en `${ZOTERO_DATA_DIR:-$HOME/Zotero}/llm-for-zotero/skills/`
- Skills desplegados:
  - `extract-pico.md` — disparadores: `extract pico`, `summarize`, `analyze`, `what's the design`
  - `appraise-evidence.md` — disparadores: `appraise`, `critical appraisal`, `risk of bias`, `level of evidence`, `grade`, `should i trust`, `is this study good`
- Cada skill incluye frontmatter LLM-for-Zotero (`id` + `match` patterns)
- Versiones simplificadas (~50-80 líneas) para que entren en el contexto del modelo incluso con PDFs largos
- Excluye los `examples/` y los `schema.json` formales para reducir tokens (se mantienen en el repo para Claude Code y el plugin futuro)

### Uso

```bash
# 1. Ejecuta el script
./deploy/flatten-for-llm-for-zotero.sh

# 2. Reinicia Zotero

# 3. En Zotero:
#    - Activa Agent Mode en Preferences → llm-for-zotero
#    - Abre Standalone Window con Cmd+Shift+L (macOS) o Ctrl+Shift+L (Linux/Windows)
#    - Selecciona el skill con / o escribe "extract pico"
```

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
