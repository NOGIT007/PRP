#!/bin/bash

# PRP Project Installation Script

echo "🚀 PRP Project Installation"
echo "=========================="

# Check if Python 3.11+ is installed
echo "✓ Checking Python version..."
python_version=$(python3 --version 2>&1 | awk '{print $2}')
required_version="3.11"

if ! python3 -c "import sys; exit(0 if sys.version_info >= (3,11) else 1)"; then
    echo "❌ Error: Python 3.11 or higher is required. Current version: $python_version"
    echo "   Please install Python 3.11+ from https://python.org"
    exit 1
fi
echo "  Python $python_version detected ✓"

# Check if uv is installed
echo "✓ Checking for uv package manager..."
if ! command -v uv &> /dev/null; then
    echo "❌ Error: uv is not installed. Installing now..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    source ~/.cargo/env
    if ! command -v uv &> /dev/null; then
        echo "❌ uv installation failed. Please install manually:"
        echo "   curl -LsSf https://astral.sh/uv/install.sh | sh"
        exit 1
    fi
fi
echo "  uv is installed ✓"

# Create virtual environment with uv
echo "✓ Creating virtual environment..."
uv venv

# Activate virtual environment
echo "✓ Activating virtual environment..."
source .venv/bin/activate

# Install dependencies
echo "✓ Installing dependencies..."
if [ -f pyproject.toml ]; then
    uv sync
    echo "  Dependencies installed ✓"
else
    echo "❌ Error: pyproject.toml not found"
    echo "   Make sure you're in the project directory"
    exit 1
fi

echo "✅ PRP Project Installation Complete!"
echo ""
echo "🎯 Next steps:"
echo "1. Edit .env file with your configuration"
echo "2. Start Claude Code: 'claude' (from project directory)"
echo "3. Ask Claude: 'Help me create a PRD for this project'"
echo "4. Begin building with Auto Plan Mode guidance!"
echo ""
echo "Happy building! 🚀"