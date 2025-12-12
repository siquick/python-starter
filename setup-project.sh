#!/bin/bash
# setup-project.sh - Initialize a new project from python-starter template
# Run this after using degit to create your new project

set -e

echo "🚀 Setting up new Python project from starter template"
echo ""

# Get new project name
read -p "Enter your project name (snake_case): " project_name
read -p "Enter your package name (snake_case, defaults to project_name): " package_name

# Default package name to project name if not provided
package_name=${package_name:-$project_name}

# Convert to different formats
project_name_hyphenated=$(echo "$project_name" | tr '_' '-')
package_name_underscored=$(echo "$package_name" | tr '-' '_')

echo ""
echo "📝 Project configuration:"
echo "  Project name: $project_name"
echo "  Package name: $package_name_underscored"
echo "  CLI command: $project_name_hyphenated"
echo ""

# Confirm
read -p "Continue with these settings? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Setup cancelled."
    exit 1
fi

echo "🔧 Updating project files..."

# Update pyproject.toml
sed -i '' "s/name = \"python-starter\"/name = \"$project_name_hyphenated\"/g" pyproject.toml
sed -i '' "s/python-starter = \"python_starter.main:main\"/$project_name_hyphenated = \"${package_name_underscored}.main:main\"/g" pyproject.toml
sed -i '' 's/version = "0.1.0"/version = "0.1.0"/g' pyproject.toml  # Keep at 0.1.0 for new projects

# Rename package directory if different
if [ "$package_name_underscored" != "python_starter" ]; then
    mv "src/python_starter" "src/$package_name_underscored"

    # Update imports in main.py
    sed -i '' "s/from python_starter.main import main/from ${package_name_underscored}.main import main/g" main.py

    # Update imports in tests
    sed -i '' "s/from python_starter.main import main/from ${package_name_underscored}.main import main/g" tests/test_main.py
fi

# Update README placeholder
sed -i '' "s/python-starter/$project_name_hyphenated/g" README.md
sed -i '' "s/python_starter/$package_name_underscored/g" README.md

# Clear CHANGELOG
cat > CHANGELOG.md << EOF
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - $(date +%Y-%m-%d)

### Added
- Initial release
EOF

echo "✅ Project setup complete!"
echo ""
echo "📋 Next steps:"
echo "1. Review and customize pyproject.toml"
echo "2. Update README.md with your project description"
echo "3. Install dependencies: uv sync --group dev"
echo "4. Start developing: uv run python main.py"
echo "5. Push to your new repository"
echo ""
echo "🎉 Happy coding!"
