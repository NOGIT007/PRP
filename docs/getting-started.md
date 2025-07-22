# Getting Started with PRP

Welcome to PRP (Personal Rapid Prototyping) - the ultimate framework for building AI/ML projects with Claude Code!

## What You'll Learn

This guide will help you:
- ✅ Set up your first PRP project
- ✅ Understand Auto Plan Mode
- ✅ Use Claude Code effectively
- ✅ Build with Google ADK and cloud services
- ✅ Manage tasks and track learning

## Prerequisites

### Required
- **Python 3.11+** - [Download here](https://python.org)
- **uv package manager** - [Install guide](https://astral.sh/uv/)
- **Claude Code access** - Available at [claude.ai/code](https://claude.ai/code)

### Optional (install as needed)
- **Google Cloud CLI** - For GCP projects
- **Git** - For version control
- **VS Code** - Great editor for Python

## Your First PRP Project

### 1. Create a New Project

```bash
# Clone the PRP framework
git clone https://github.com/NOGIT007/PRP.git my-first-project
cd my-first-project

# Run the initialization script
./scripts/init-project.sh my-awesome-project
cd my-awesome-project

# This will:
# ✓ Check Python version
# ✓ Install uv if needed
# ✓ Create virtual environment
# ✓ Install dependencies
# ✓ Create .env file
# ✓ Set up project structure
```

### 2. Start Claude Code

```bash
# Make sure you're in the project directory
cd my-awesome-project

# Start Claude Code (this enables Auto Plan Mode)
claude
```

### 3. Your First Interaction

In Claude Code, try asking:

> "Help me understand this project structure and create a simple web app"

You'll see Auto Plan Mode activate:

```
🎯 AUTO PLAN MODE ACTIVATED

## Task Analysis
- **Request**: Create a simple web app
- **Related Task File**: None yet - this is project setup
- **Project Impact**: Core application development
- **Learning Opportunity**: Flask/FastAPI basics, project structure

## Execution Plan
### Files to Create/Modify:
- `app.py` - CREATE - Main Flask application
- `templates/index.html` - CREATE - Basic HTML template
- `pyproject.toml` - MODIFY - Add Flask dependency

### Commands to Run:
1. `uv add flask` - Add Flask to dependencies
2. `uv sync` - Install new dependencies
3. `python app.py` - Test the application

🚨 APPROVAL REQUIRED: Type 'PROCEED' to execute this plan
```

**Type "PROCEED"** and watch Claude safely build your app!

## Understanding the PRP Structure

```
my-awesome-project/
├── 📋 README.md              # Project overview
├── 🛠️ install.sh             # Setup script
├── 🛠️ start.sh               # Start script
├── ⚙️ pyproject.toml         # Dependencies
├── 🔧 .env                   # Environment config
├── 📁 .claude/               # Claude Code configuration
│   ├── settings.local.json   # Permissions & servers
│   ├── auto_plan_mode.txt    # Auto Plan Mode prompt
│   └── commands/             # Pre-built commands
├── 📁 src/                   # Your code
├── 📁 tests/                 # Your tests
├── 📁 docs/                  # Documentation
├── 📁 tasks/                 # Task management
│   └── task_history.md       # Progress tracking
└── 📁 quality/               # Code quality reports
```

## Key Concepts

### 🛡️ Auto Plan Mode
- **Safe Development**: Claude plans before executing
- **Learning Focus**: Understand what happens before it happens
- **Approval Required**: Nothing happens without your "PROCEED"

### 📋 Task Management
- Break big goals into small tasks in `/tasks/`
- Track your progress in `task_history.md`
- Learn patterns as you build

### 🏗️ Pre-built Commands
Use `.claude/commands/` for common tasks:
- `status-check` - See where your project stands
- `create-tasks` - Break down features into tasks
- `quick-fix` - Fix common issues
- `code-review` - Get code quality feedback

## Next Steps

### 1. Define Your Project
Ask Claude:
> "Help me create a PRD (Product Requirements Document) for [your project idea]"

### 2. Break It Down
Ask Claude:
> "Create tasks from my PRD so I can build this step by step"

### 3. Start Building
Ask Claude:
> "Help me implement the first task"

### 4. Keep Learning
- Each plan explains what you're learning
- Update your task history as you progress
- Use the pre-built commands for common needs

## Example Projects You Can Build

### 🤖 AI Agent
- Natural language interfaces
- Google ADK integration
- Vertex AI deployment

### 📊 Data Science Project
- Data analysis and visualization
- ML model development
- Interactive dashboards

### 🌐 Web Application
- Flask or FastAPI backend
- Database integration
- User authentication

### ☁️ Cloud Application
- Google Cloud Platform
- Serverless functions
- Auto-scaling deployment

## Getting Help

### In Claude Code
- Ask: "What can I do with this PRP project?"
- Use: `.claude/commands/status-check` for project overview
- Try: "Help me understand [any concept]"

### Common Questions

**Q: What if I want to use a different tech stack?**
A: Ask Claude to modify `pyproject.toml` and update the dependencies for your needs.

**Q: How do I deploy to the cloud?**
A: Use the `deployment-check` command, then ask Claude for deployment guidance.

**Q: Can I use this for learning?**
A: Absolutely! Auto Plan Mode is designed for learning - you see every step explained.

## Ready to Build? 🚀

1. **Set up your first project** (follow steps above)
2. **Start Claude Code** in your project directory
3. **Ask Claude to help** with whatever you want to build
4. **Watch Auto Plan Mode** keep you safe and learning

Happy prototyping! 🎉