# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.1] - 2025-12-12

### Changed

- Removed all emojis from documentation files (README.md, AGENTS.md, CHANGELOG.md)
- Updated AGENTS.md to require CHANGELOG.md updates with current system date
- Added comprehensive documentation for ty type checker as future alternative

## [0.1.0] - 2025-12-12

### Added
- Initial release of Python Starter Kit
- TypeScript-like developer experience with uv, Ruff, Pyright, and pytest
- Dual-path support for both applications and libraries
- Comprehensive VS Code configuration
- GitHub Actions CI with quality gates
- Pre-commit hooks for code quality
- Modern `src/` layout with proper packaging
- Complete documentation and getting started guide
- Degit workflow support for creating new projects from template
- Interactive setup script for project customization
- Documentation for ty type checker as future alternative

### Features
- **uv** for dependency management and virtual environments
- **Ruff** for ultra-fast linting and formatting
- **Pyright** for strict type checking and IntelliSense
- **pytest** with coverage reporting
- Format-on-save and real-time type checking in VS Code
- Single-command workflows: `uv run ruff check`, `uv run pyright`, `uv run pytest`
- Committed lockfile for reproducible environments
- Pre-configured CI that mirrors local development commands
