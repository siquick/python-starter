# AGENTS.md

A lightweight, **agent-focused** operating manual for working in this repo (complements `README.md`).

This follows the community pattern described at [agents.md](https://agents.md/).

## Goal: “TypeScript repo feel” in Python

- **Deterministic environments**: use `uv` + lockfile.
- **Fast feedback**: Ruff + Pyright.
- **Single-command gates**: same commands locally + in CI.
- **Editor-first ergonomics**: `src/` layout, strict typing, VS Code defaults.

## Non-negotiable workflow (golden commands)

Run these from the repo root:

- **Install deps (dev)**: `uv sync --group dev`
- **Run app (dev entry point)**: `uv run python main.py`
- **Run as module (packaged path)**: `uv run python -m python_starter.main`
- **Format**: `uv run ruff format .`
- **Format check (CI parity)**: `uv run ruff format --check .`
- **Lint**: `uv run ruff check .`
- **Lint autofix (safe)**: `uv run ruff check --fix .`
- **Typecheck**: `uv run pyright`
- **Tests**: `uv run pytest`

## Creating new projects from this starter

When helping users create new projects from this template:

### Degit Workflow (Recommended)
```bash
# Clean copy without git history
degit your-org/python-starter new-project-name
cd new-project-name

# Option 1: Automated setup
./setup-project.sh  # Interactive script to customize project

# Option 2: Manual setup (see customization steps below)

# Initialize fresh git repo
git init
git add .
git commit -m "Initial commit from python-starter template"
```

### Project Customization Steps
1. **Update package name**: Rename `src/python_starter/` to `src/your_package_name`
2. **Update metadata**: Edit `pyproject.toml` (name, description, version)
3. **Update imports**: Fix all `from python_starter` imports to use new package name
4. **Update entry points**: Change console script in `pyproject.toml`
5. **Reset documentation**: Update README.md, clear CHANGELOG.md
6. **Fresh git history**: Push to new remote repository

### Common Customizations
- **Package name**: `python_starter` → `your_app_name`
- **Project name**: `"python-starter"` → `"your-project"`
- **Description**: Update in pyproject.toml and README
- **Version**: Reset to `"0.1.0"`
- **License**: Update copyright year if needed

### Expected “PR gate” order

If you change code, the expected local order (matches CI intent) is:

1. `uv run ruff format .`
2. `uv run ruff check .`
3. `uv run pyright`
4. `uv run pytest`

## Project constraints (opinionated defaults)

- **Python version policy**:
  - Single Python version per repo.
  - Pinned in `.python-version`.
  - `pyproject.toml` requires `>=3.12` (keep these aligned).
- **Layout**:
  - `src/` layout is required.
  - Import from `python_starter` (not from the repo root).
- **Typing posture**:
  - **Strict by default** (Pyright `typeCheckingMode = "strict"`).
  - Prefer small, typed functions over clever abstractions.
- **Toolchain**:
  - `uv` is the **only** supported way to manage deps and run tools.
  - Ruff is the **only** formatter/linter (don’t introduce Black/isort/flake8).

## What this repo is (and is not)

- **It is**: a starter that supports both:
  - **App/service usage**: runnable entrypoint, quick start.
  - **Library evolution**: `src/` package + `py.typed` marker ready.
- **It is not**: a framework-specific template (no FastAPI/Django opinions baked in).

## Files & responsibilities (high-level map)

- `pyproject.toml`
  - single source of truth for dependencies + tool configuration (Ruff/Pyright/pytest)
  - defines console script entrypoint (`python-starter`)
- `src/python_starter/`
  - real package code
  - `py.typed` is present for typed-package distribution
- `main.py`
  - convenience **development** entrypoint (adds `src/` to `sys.path`)
- `tests/`
  - pytest-based tests
- `.vscode/`
  - editor defaults for Ruff + Pyright + pytest
- `.github/workflows/ci.yml`
  - CI gates: format check, lint, typecheck, tests
- `.pre-commit-config.yaml`
  - local hooks for formatting/linting/type checking

## Making changes: do’s and don’ts

### ✅ Always do

- Keep changes **minimal** and **readable** (prefer small functions/files).
- Add/adjust tests when behavior changes.
- Keep type annotations accurate and run `uv run pyright`.
- Keep `uv.lock` consistent with dependency changes.
- Prefer **Ruff fixes** over manual churn when changing style.

### ⚠️ Ask first (or clearly justify in PR)

- Adding/removing dependencies (runtime or dev).
- Changing lint/type strictness (Ruff ruleset, Pyright strictness).
- Editing CI workflow semantics (not just formatting).
- Changing packaging posture (e.g., adding publish automation).

### ❌ Never do

- Don’t introduce alternative tooling that duplicates the stack (Black/isort/mypy/etc.) unless explicitly requested.
- Don’t loosen type checking to “make it pass” without a strong reason.
- Don’t delete or weaken tests to get green.
- Don’t write secrets into the repo (tokens, keys, `.env` contents).

## Dependency changes (uv-only)

- **Add runtime dep**: `uv add <package>`
- **Add dev dep**: `uv add --dev <package>`
- **Remove dep**: `uv remove <package>`
- **Update lock**: `uv lock`

When you add dependencies, ensure `pyproject.toml` and `uv.lock` reflect it.

## Testing guidance

- Prefer **unit tests** for logic in `src/python_starter/`.
- Use `capsys` for CLI/stdout behavior tests (see existing patterns).
- Keep tests deterministic (no network, time, randomness without seeding/mocking).

## If you’re acting as an autonomous coding agent

Use this checklist before you finish:

- `uv run ruff format .`
- `uv run ruff check .`
- `uv run pyright`
- `uv run pytest`
- Confirm you didn’t accidentally change toolchain posture (uv/Ruff/Pyright/pytest).


