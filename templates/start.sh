#!/bin/bash

echo "🚀 Starting PRP Project..."
echo "========================"

# Check if virtual environment exists
if [ ! -d ".venv" ]; then
    echo "❌ Virtual environment not found. Please run ./install.sh first"
    exit 1
fi

# Activate virtual environment
echo "✓ Activating virtual environment..."
source .venv/bin/activate

# Check if .env file exists
if [ ! -f .env ]; then
    echo "⚠️  No .env file found. Creating basic template..."
    echo "   Please configure your environment variables"
    if [ -f .env.example ]; then
        cp .env.example .env
    fi
fi

# Load environment variables
if [ -f .env ]; then
    echo "✓ Loading environment variables..."
    set -a
    source .env
    set +a
fi

# Determine what type of application to start
if [ -f "app.py" ]; then
    echo "🌐 Starting Flask application..."
    echo "   Available at: http://localhost:5000"
    uv run python app.py
elif [ -f "main.py" ]; then
    echo "🚀 Starting main application..."
    uv run python main.py
elif [ -f "src/main.py" ]; then
    echo "🚀 Starting application from src/..."
    uv run python src/main.py
elif command -v adk &> /dev/null && [ -f "pyproject.toml" ] && grep -q "google-adk" pyproject.toml; then
    echo "🤖 Starting Google ADK web interface..."
    echo "   Available at: http://localhost:8080"
    adk web
else
    echo "📋 No standard application entry point found."
    echo ""
    echo "Available options:"
    echo "1. Create app.py for Flask applications"
    echo "2. Create main.py for general Python applications"
    echo "3. Use 'adk web' for Google ADK agents"
    echo "4. Run 'claude' to start Claude Code development"
    echo ""
    echo "💡 Need help? Ask Claude: 'How do I start my application?'"
fi