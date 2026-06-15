#!/usr/bin/env python3
"""Validate the JSON output blocks in each skill's examples against its schema.

For every skill in ``skills/<name>/`` this script:
  1. Loads ``schema.json``.
  2. Extracts each fenced ```json block from every file in ``examples/``.
  3. Validates each JSON document against the skill's schema.

Exits non-zero if any block fails to parse or validate, so it can gate CI.
"""

from __future__ import annotations

import json
import re
import sys
from pathlib import Path

try:
    from jsonschema import Draft202012Validator
except ImportError:  # pragma: no cover - dependency hint
    sys.exit("Missing dependency: pip install jsonschema")

REPO_ROOT = Path(__file__).resolve().parent.parent
SKILLS_DIR = REPO_ROOT / "skills"
JSON_BLOCK = re.compile(r"```json\s*\n(.*?)\n```", re.DOTALL)


def iter_json_blocks(md_path: Path):
    """Yield (index, parsed_json_or_None, raw_text) for each ```json block."""
    text = md_path.read_text(encoding="utf-8")
    for i, match in enumerate(JSON_BLOCK.finditer(text), start=1):
        raw = match.group(1)
        try:
            yield i, json.loads(raw), raw
        except json.JSONDecodeError as exc:
            yield i, None, f"JSON parse error: {exc}"


def main() -> int:
    if not SKILLS_DIR.is_dir():
        print(f"No skills directory at {SKILLS_DIR}", file=sys.stderr)
        return 1

    failures: list[str] = []
    checked = 0

    for skill_dir in sorted(p for p in SKILLS_DIR.iterdir() if p.is_dir()):
        schema_path = skill_dir / "schema.json"
        examples_dir = skill_dir / "examples"
        if not schema_path.is_file():
            failures.append(f"{skill_dir.name}: missing schema.json")
            continue
        if not examples_dir.is_dir():
            # A skill may legitimately ship without examples; warn, don't fail.
            print(f"  (no examples/ for {skill_dir.name})")
            continue

        schema = json.loads(schema_path.read_text(encoding="utf-8"))
        try:
            Draft202012Validator.check_schema(schema)
        except Exception as exc:  # noqa: BLE001 - report any meta-schema violation
            failures.append(f"{schema_path.relative_to(REPO_ROOT)}: invalid JSON Schema: {exc}")
            continue
        validator = Draft202012Validator(schema)

        for md_path in sorted(examples_dir.glob("*.md")):
            blocks = list(iter_json_blocks(md_path))
            if not blocks:
                failures.append(f"{md_path.relative_to(REPO_ROOT)}: no ```json block found")
                continue
            for index, parsed, raw in blocks:
                rel = md_path.relative_to(REPO_ROOT)
                if parsed is None:
                    failures.append(f"{rel} [block {index}]: {raw}")
                    continue
                errors = sorted(validator.iter_errors(parsed), key=lambda e: e.path)
                checked += 1
                if errors:
                    for err in errors:
                        loc = "/".join(str(p) for p in err.path) or "<root>"
                        failures.append(f"{rel} [block {index}] at {loc}: {err.message}")
                else:
                    print(f"  OK  {rel} [block {index}] -> {skill_dir.name}")

    print()
    if failures:
        print(f"FAILED: {len(failures)} problem(s) across {checked} validated block(s):")
        for f in failures:
            print(f"  - {f}")
        return 1
    print(f"PASSED: {checked} JSON block(s) validated against their schemas.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
