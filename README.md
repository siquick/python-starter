# Python Starter Kit

A modern Python starter kit with TypeScript-like developer experience. Features deterministic environments, fast feedback loops, single-command workflows, and consistent quality gates.

## ✨ Features

- **🎯 TypeScript-like DX**: Strict typing, fast feedback, consistent tooling
- **⚡ uv**: Lightning-fast Python package manager and virtual environment
- **🔍 Ruff**: Ultra-fast Python linter and formatter
- **📝 Pyright**: Microsoft's Python type checker for excellent IntelliSense
- **🧪 pytest**: Comprehensive testing with coverage reporting
- **🔄 Dual-path support**: Works as both an application and a library
- **🚀 GitHub Actions CI**: Automated quality gates on every PR
- **📦 Modern packaging**: `src/` layout with proper dependency management

## 🚀 Quick Start (1 minute)

## Option 1: Clone for Development
```bash
# Clone this starter
git clone https://github.com/your-org/python-starter.git my-project
cd my-project

# Install uv (if not already installed)
curl -LsSf https://astral.sh/uv/install.sh | sh

# Set up the project
uv sync --group dev

# Run the app
uv run python main.py

# That's it! You're ready to develop with full TypeScript-like tooling.
```

## Option 2: Create New Project with Degit (Recommended)
```bash
# Install degit globally (if not already installed)
npm install -g degit

# Create clean copy without git history
degit your-org/python-starter my-new-project
cd my-new-project

# Run automated setup (optional, helps customize the template)
./setup-project.sh

# Or customize manually (see section below)

# Initialize new git repo
git init
git add .
git commit -m "Initial commit from python-starter template"

# Install uv (if not already installed)
curl -LsSf https://astral.sh/uv/install.sh | sh

# Set up the project
uv sync --group dev

# Push to your new repo
git remote add origin https://github.com/your-username/my-new-project.git
git push -u origin main
```

## 🆕 Starting a New Project

After using degit or cloning:

### Option 1: Automated Setup
Run the interactive setup script:
```bash
./setup-project.sh
```
This will prompt you for project/package names and automatically update all the necessary files.

### Option 2: Manual Setup

### 1. Update Project Metadata
```bash
# Edit these files to customize for your project:
# - pyproject.toml (name, description, version)
# - src/python_starter/ (rename to your package name)
# - README.md (project description, setup instructions)
# - CHANGELOG.md (reset for your project)
```

### 2. Rename the Package (if needed)
```bash
# If you want a different package name than 'python_starter':
mv src/python_starter src/your_package_name

# Update imports in:
# - main.py
# - tests/test_main.py
# - pyproject.toml (project.scripts entry point)
```

### 3. Reset Version and History
```bash
# Reset version to 0.1.0 in pyproject.toml
# Clear CHANGELOG.md and start fresh
# Update LICENSE copyright year if needed
```

### 4. Push to New Repository
```bash
# Create new repo on GitHub/GitLab/etc.
git remote add origin https://github.com/your-username/your-repo.git
git push -u origin main
```

## 📋 Daily Commands

```bash
# Development
uv run python main.py          # Run the application
uv run python -m python_starter # Run as installed package

# Quality gates (single commands, just like pnpm)
uv run ruff check .            # Lint code
uv run ruff format .           # Format code
uv run pyright                 # Type check
uv run pytest                  # Run tests with coverage

# Dependencies
uv add requests                 # Add runtime dependency
uv add --dev black             # Add development dependency
uv remove requests              # Remove dependency

# Environment
uv sync                         # Install/update all dependencies
uv lock                         # Update lockfile
```

## 📁 Project Structure

```
python-starter/
├── src/python_starter/         # Main package (src/ layout)
│   ├── __init__.py            # Package initialization
│   ├── main.py                # Main application logic
│   └── py.typed               # Type marker for libraries
├── tests/                     # Test suite
│   ├── __init__.py
│   └── test_main.py
├── main.py                    # Development entry point
├── pyproject.toml             # Project configuration
├── uv.lock                    # Locked dependencies
├── .vscode/                   # VS Code configuration
│   ├── settings.json
│   └── launch.json
├── .github/workflows/ci.yml   # GitHub Actions CI
├── .gitignore
├── .editorconfig
├── LICENSE
├── CHANGELOG.md
└── README.md
```

## 🛠️ Tooling Philosophy

### uv - The Only Dependency Manager
- **Why uv?** Blazingly fast, reproducible, single-binary
- **No choices**: One tool for everything (install, run, lock, publish)
- **Lockfile committed**: `uv.lock` ensures identical environments

### Ruff - Linter & Formatter
- **Why Ruff?** Written in Rust, 10-100x faster than alternatives
- **One tool**: Handles both linting and formatting
- **Strict rules**: Catches bugs and enforces consistency

### Pyright - Type Checker
- **Why Pyright?** Microsoft's type checker, excellent IntelliSense
- **Fast feedback**: Near-instant type checking
- **Strict by default**: Catches type errors before runtime

### pytest - Testing
- **Why pytest?** Python's most popular testing framework
- **Coverage included**: Automatic coverage reporting
- **Convention over configuration**: Standard test discovery

## 🔄 Development Workflows

### Adding Dependencies

```bash
# Runtime dependencies
uv add requests fastapi

# Development dependencies
uv add --dev pytest-cov mypy

# Update lockfile
uv lock
```

### Running Quality Checks

```bash
# Format code
uv run ruff format .

# Lint code
uv run ruff check .

# Fix auto-fixable issues
uv run ruff check --fix .

# Type check
uv run pyright

# Run tests
uv run pytest

# Run specific test
uv run pytest tests/test_main.py -v
```

### VS Code Integration

The starter kit includes optimized VS Code settings:

- **Format on save**: Automatic formatting with Ruff
- **Type checking**: Real-time type checking with Pyright
- **Import sorting**: Automatic import organization
- **Test runner**: Integrated pytest support
- **Debugging**: Pre-configured debug launch configurations

## 📦 Dual-Path Support

This starter works as both an **application** and a **library**:

### Application Mode (Default)
- Run directly: `uv run python main.py`
- Console script: `python -m python_starter`
- Perfect for CLIs, services, scripts

### Library Mode (Migration Path)
When you want to publish a library:

1. **Add version matrix testing** to CI
2. **Configure publishing** in `pyproject.toml`
3. **Add documentation** and examples
4. **Consider multi-version support**

```toml
# Add to pyproject.toml for library publishing
[tool.hatch.build.targets.wheel]
packages = ["src/python_starter"]

[project.urls]
Homepage = "https://github.com/your-org/python-starter"
Repository = "https://github.com/your-org/python-starter"
```

## 🔧 Customization

### Changing Python Version

```bash
# Update .python-version
echo "3.11" > .python-version

# Update pyproject.toml
# requires-python = ">=3.11"

# Reinstall environment
uv sync --dev
```

### Modifying Lint Rules

Edit `[tool.ruff.lint]` in `pyproject.toml`:

```toml
[tool.ruff.lint]
select = [
    "E", "W", "F", "I", "B", "C4", "UP",
    # Add more rules as needed
]
ignore = [
    "B027",  # Allow empty methods in abstract classes
    # Add rule codes to ignore
]
```

### Type Checking Strictness

Modify `[tool.pyright]` in `pyproject.toml`:

```toml
[tool.pyright]
typeCheckingMode = "basic"  # "strict" (default) | "basic" | "off"
```

## 🚦 CI/CD

### Quality Gates
Every PR runs:
- **Formatting check**: `ruff format --check`
- **Linting**: `ruff check`
- **Type checking**: `pyright`
- **Testing**: `pytest` with coverage
- **Coverage reporting**: Upload to Codecov

### Library Publishing (Optional)
Add this to CI for PyPI publishing:

```yaml
# .github/workflows/release.yml
name: Release
on:
  release:
    types: [published]

jobs:
  publish:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - uses: astral-sh/setup-uv@v3
    - run: uv build
    - run: uv publish --token ${{ secrets.PYPI_API_TOKEN }}
```

## 🐛 Troubleshooting

### Common Issues

**"Command not found: uv"**
```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

**"Module not found" during development**
```bash
# The src/ layout requires proper path setup
uv run python main.py  # Uses the dev entry point
```

**VS Code not recognizing types**
- Ensure Pyright extension is installed
- Check `.vscode/settings.json` is present
- Restart VS Code's Python language server

**Tests not running**
```bash
# Ensure pytest is installed
uv sync --dev

# Run tests explicitly
uv run pytest tests/
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Make your changes
4. Run quality checks: `uv run ruff check && uv run pyright && uv run pytest`
5. Commit your changes: `git commit -m 'Add amazing feature'`
6. Push to the branch: `git push origin feature/amazing-feature`
7. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **uv** by Astral for the amazing Python package manager
- **Ruff** by Astral for the blazingly fast linter/formatter
- **Pyright** by Microsoft for excellent type checking
- **TypeScript** community for inspiring the developer experience

---

**Happy coding!** 🎉
