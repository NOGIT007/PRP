# PRP - Product Requirement Prompt Framework

**AI Engineering Resources for Claude Code**

A comprehensive library of assets and context engineering for Agentic Engineering, optimized for Claude Code. This repository provides the Product Requirement Prompt (PRP) methodology, pre-configured commands, and extensive documentation to enable AI-assisted development that delivers production-ready code on the first pass.

## 🎯 What is PRP?

### Product Requirement Prompt (PRP)

**In short:** A PRP is PRD + curated codebase intelligence + agent/runbook—the minimum viable packet an AI needs to plausibly ship production-ready code on the first pass.

Product Requirement Prompt (PRP) is a structured prompt methodology first established in summer 2024 with context engineering at heart. A PRP supplies an AI coding agent with everything it needs to deliver a vertical slice of working software—no more, no less.

### How PRP Differs from Traditional PRD

A traditional PRD clarifies what the product must do and why customers need it, but deliberately avoids how it will be built.

A PRP keeps the goal and justification sections of a PRD yet adds three AI-critical layers:

#### **Context**
Precise file paths and content, library versions and library context, code snippets examples. LLMs generate higher-quality code when given direct, in-prompt references instead of broad descriptions. Usage of an `ai_docs/` directory to pipe in library and other docs.

#### **Structure** 
Explicit architectural decisions, naming conventions, and integration patterns. Where a PRD might say "secure user authentication," a PRP specifies "OAuth 2.0 with JWT tokens, using library X version Y, following pattern Z."

#### **Constraints**
Technical boundaries, performance requirements, and deployment constraints that guide implementation choices.

## 🚀 Quick Start

```bash
# Clone PRP framework
git clone https://github.com/NOGIT007/PRP.git your-project-name
cd your-project-name

# Initialize new project
./scripts/init-project.sh my-project

# Start Claude Code with Auto Plan Mode
cd my-project
claude

# Ask Claude to help you build something with PRP methodology!
```

## 📁 Framework Structure

```
PRP/
├── 📋 README.md                    # This file
├── 🛠️ scripts/
│   ├── init-project.sh            # New project setup
│   └── deploy-to-github.sh        # GitHub deployment
├── 📖 docs/
│   ├── getting-started.md         # Beginner guide
│   ├── auto-plan-mode.md          # Auto Plan Mode documentation
│   ├── prp-methodology.md         # PRP prompt engineering guide
│   └── google-adk-guide.md        # ADK development patterns
├── 🎛️ templates/
│   ├── .claude/                   # Claude Code configuration
│   │   ├── settings.local.json    # Permissions & MCP servers
│   │   ├── auto_plan_mode.txt     # Auto Plan Mode system prompt
│   │   └── commands/              # Pre-built Claude commands
│   ├── ai_docs/                   # Documentation pipeline
│   ├── pyproject.toml             # Python dependencies template
│   ├── install.sh                 # Installation script
│   ├── start.sh                   # Startup script
│   └── .env.example               # Environment template
└── 🧪 examples/
    ├── neo4j-agent/              # Database agent example
    ├── simple-web-app/           # Flask web app
    └── vertex-ai-deployment/     # Cloud deployment example
```

## ✨ Key Features

### 🛡️ Auto Plan Mode
- **Safe Development**: Claude plans before executing
- **Learning Focused**: Understand what happens before it happens
- **Context Aware**: Integrates with PRP methodology
- **Production Ready**: Delivers working code on first pass

### 📋 PRP Methodology
- **Context Engineering**: Precise specifications for AI agents
- **Structured Prompts**: Everything AI needs to deliver production code
- **Curated Intelligence**: Pre-built patterns and examples
- **Documentation Pipeline**: ai_docs/ for library context

### 🏗️ Google ADK Ready
- **Agent Development Kit** patterns
- **Vertex AI Agent Engine** deployment
- **MCP Integration** for tool development
- **Evaluation Framework** for testing

### 🎛️ Production Commands
Complete set of commands for professional development:
- **Project Management**: status-check, create-tasks, create-prd
- **Code Quality**: code-review, security-check, test-agent
- **Deployment**: deployment-check, ui-check
- **Maintenance**: quick-fix, update-docs, check-libraries

### ☁️ Cloud Native
- **GCP Integration**: Ready for Google Cloud Platform
- **Vertex AI**: AI model deployment and management
- **Security**: Best practices for credentials and permissions

## 🎓 Perfect for AI Engineering

Whether you're:
- **Building AI Agents** - Complete ADK workflow with PRP methodology
- **Developing with Claude Code** - Auto Plan Mode + context engineering
- **Deploying to Production** - Battle-tested patterns and security
- **Learning AI Engineering** - Comprehensive documentation and examples

## 📚 Documentation

- [**Getting Started**](docs/getting-started.md) - Your first PRP project
- [**PRP Methodology**](docs/prp-methodology.md) - Context engineering guide
- [**Auto Plan Mode**](docs/auto-plan-mode.md) - Safe development with Claude
- [**Google ADK Guide**](docs/google-adk-guide.md) - Agent development patterns

## 🤝 Contributing

This framework grows with the AI engineering community! As you build with PRP:
1. Document new patterns you discover
2. Add helpful commands to `.claude/commands/`
3. Share examples of successful projects
4. Improve the methodology

See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

## 📄 License

MIT License - Build amazing things! 🚀

---

**Created by Kennet Kusk** | **Powered by Claude Code + PRP Methodology**