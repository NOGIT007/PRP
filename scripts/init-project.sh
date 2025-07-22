#!/bin/bash

# PRP Project Initialization Script

echo "🚀 Initializing New PRP Project"
echo "==============================="

# Get project name
if [ -z "$1" ]; then
    read -p "Enter project name: " PROJECT_NAME
else
    PROJECT_NAME="$1"
fi

# Validate project name
if [ -z "$PROJECT_NAME" ]; then
    echo "❌ Project name is required"
    exit 1
fi

# Create project directory
echo "✓ Creating project directory: $PROJECT_NAME"
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

# Copy template files
echo "✓ Copying PRP framework files..."
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PRP_ROOT="$(dirname "$SCRIPT_DIR")"

# Copy templates
cp -r "$PRP_ROOT/templates/"* .

# Make scripts executable
chmod +x install.sh start.sh

# Create project structure
echo "✓ Creating project structure..."
mkdir -p src tests docs tasks quality security ux
mkdir -p tests/unit tests/integration tests/e2e
mkdir -p docs/architecture docs/api
mkdir -p tasks/completed tasks/backlog

# Create basic files
echo "✓ Creating basic project files..."

# Create README.md
cat > README.md << EOF
# $PROJECT_NAME

Built with the PRP (Personal Rapid Prototyping) framework.

## Quick Start

\`\`\`bash
# Install dependencies
./install.sh

# Start development
./start.sh

# Start Claude Code with Auto Plan Mode
claude
\`\`\`

## Project Overview

[Describe what this project does]

## Tech Stack

- **Language**: Python 3.11+
- **Framework**: [Add your main framework]
- **Database**: [Add if using database]
- **Cloud**: [Add if using cloud services]

## Development

This project uses:
- **Auto Plan Mode**: Claude plans before executing changes
- **Task Management**: Structured approach in \`/tasks/\`
- **Quality Tools**: Automated testing and code quality checks

## Getting Started

1. Edit \`.env\` with your configuration
2. Run \`./install.sh\` to set up the environment
3. Start Claude Code with \`claude\` in this directory
4. Ask Claude: "Help me create a PRD for this project"

## Next Steps

- [ ] Configure environment variables in \`.env\`
- [ ] Create Product Requirements Document
- [ ] Set up development workflow
- [ ] Begin building core features

Built with ❤️ using PRP framework
EOF

echo "✅ PRP Project '$PROJECT_NAME' Created Successfully!"
echo ""
echo "🎯 Next Steps:"
echo "1. cd $PROJECT_NAME"
echo "2. ./install.sh                    # Set up development environment"
echo "3. Edit .env file with your config # Configure environment variables"
echo "4. claude                          # Start Claude Code with Auto Plan Mode"
echo "5. Ask Claude: 'Help me create a PRD for this project'"
echo ""
echo "🎉 Happy prototyping with PRP! 🚀"