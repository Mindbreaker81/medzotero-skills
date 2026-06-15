# eval

Automated checks that keep the skills internally consistent. They run in CI on every
push and pull request (see `.github/workflows/ci.yml`) and can also be run locally.

## Checks

### `validate_examples.py` — schema validation
Extracts every ```json block from each `skills/<name>/examples/*.md` and validates it
against that skill's `schema.json` (JSON Schema draft 2020-12). Fails if any example
JSON is malformed or violates its schema. This is what catches drift between the
documented output shape and the schema.

```bash
pip install -r eval/requirements.txt
python3 eval/validate_examples.py
```

### `test_deploy.sh` — deploy smoke test
Runs `deploy/flatten-for-llm-for-zotero.sh` into a throwaway directory and asserts each
generated LLM-for-Zotero file is well-formed: frontmatter present, `id` matches the
filename, at least one well-formed `match:` pattern, and a non-empty body. This guards
the single-source-of-truth pipeline (SKILL.md → Zotero file).

```bash
bash eval/test_deploy.sh
```

## Run everything

```bash
pip install -r eval/requirements.txt
python3 eval/validate_examples.py && bash eval/test_deploy.sh
```
