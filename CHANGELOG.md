# Changelog

All notable changes to medzotero-skills will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-05-17

### Added
- **5 biomedical literature analysis skills** for interventional pulmonology:
  - `extract-pico` - Structured PICO extraction with study type detection
  - `appraise-evidence` - Critical appraisal using ROB 2, AMSTAR-2, NOS, QUADAS-2, PROBAST, AGREE II, ROBINS-I, GRADE, and OCEBM
  - `clinical-relevance` - Clinical relevance assessment for Spanish healthcare context (SNS, AEMPS, SEPAR)
  - `synthesize-collection` - Multi-paper evidence synthesis with evidence mapping
  - `compare-guidelines` - Guideline comparison against SEPAR, ATS, ERS, GOLD, GINA, IASLC, NICE, AASM, and others
- **JSON schemas** for each skill (v1.0.0) for machine-readable output validation
- **2 synthetic examples** per skill demonstrating expected output format
- **LLM-for-Zotero deployment script** (`deploy/flatten-for-llm-for-zotero.sh`) for Agent Mode compatibility
- **Specialized recognition** for pulmonology procedures, conditions, and outcomes
- **Spanish narrative output** alongside English JSON for clinician-friendly results

### Changed
- **README** with comprehensive usage instructions for Claude Code, LLM-for-Zotero, and Codex CLI
- **Troubleshooting section** in README for known LLM-for-Zotero issues

### Fixed
- **synthesize-collection**: Prevent Zotero metadata modification during Agent Mode execution
- **synthesize-collection**: Improve Zotero search specificity to find original research (exclude guidelines)
- **synthesize-collection**: Handle truncated abstracts gracefully without hanging
- **synthesize-collection**: Handle single-paper selection appropriately
- **compare-guidelines**: Enforce strict topic relevance in guideline selection (e.g., exclude cardiac guidelines for pulmonary embolism)

### Technical Details
- All skills use JSON-first output with Spanish narrative summaries
- Skills are compatible with Claude Code (full context), LLM-for-Zotero Agent Mode (simplified ~50-80 lines), and Codex CLI (via AGENTS.md reference)
- Schema versions: All schemas at v1.0.0
- Specialty context: Interventional pulmonology with Spain/SEPAR/AEMPS focus
- MCIDs included for pulmonary outcomes (6MWD, FEV1, mMRC, CAT, SGRQ, K-BILD)

## [Unreleased]

### Planned
- Phase 2: Zotero plugin development (see `docs/medzotero-skills-plan.md` for go/no-go criteria)

[1.0.0]: https://github.com/Mindbreaker81/medzotero-skills/releases/tag/v1.0.0
