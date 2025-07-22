# Auto Plan Mode - Safe Development with Claude

Auto Plan Mode is the heart of the PRP framework. It makes Claude Code development safe, educational, and systematic.

## What is Auto Plan Mode?

Auto Plan Mode is a system prompt that makes Claude automatically enter "planning mode" before executing any development tasks. Instead of immediately making changes, Claude:

1. **Analyzes** your request
2. **Creates** a detailed plan
3. **Waits** for your approval
4. **Executes** only after you say "PROCEED"

## Why Auto Plan Mode?

### 🛡️ Safety First
- No surprise changes to your code
- See what will happen before it happens
- Easy to stop if something looks wrong

### 🎓 Perfect for Learning
- Understand the "why" behind every change
- Learn patterns and best practices
- Build confidence through transparency

### 📋 Systematic Development
- Connects with your task management
- Updates progress automatically
- Follows project patterns and constraints

## How It Works

### The Planning Process

When you ask Claude to do something like "Add authentication to my app", Auto Plan Mode kicks in:

```
🎯 AUTO PLAN MODE ACTIVATED

## Task Analysis
- **Request**: Add authentication to my app
- **Related Task File**: /tasks/03-authentication.md (if exists)
- **Project Impact**: Security, user management, database schema
- **Learning Opportunity**: Flask-Login, password hashing, session management

## Execution Plan
### Files to Modify/Create:
- `src/auth.py` - CREATE - Authentication blueprint
- `src/models.py` - MODIFY - Add User model
- `requirements.txt` - MODIFY - Add flask-login, werkzeug
- `templates/login.html` - CREATE - Login form

### Commands to Run:
1. `uv add flask-login werkzeug` - Install auth dependencies
2. `uv sync` - Update environment
3. `python -m pytest tests/test_auth.py` - Run auth tests

### Validation Steps:
- [ ] Test: Login/logout functionality works
- [ ] Security: Passwords are properly hashed
- [ ] Integration: Auth integrates with existing routes

### Task History Update:
- Will update `/tasks/task_history.md` with authentication completion

## Risk Assessment:
- **Medium**: Changes affect security and user data
- **Rollback Plan**: Git revert if auth breaks existing functionality

## Learning Outcome:
- **You'll Learn**: Flask authentication patterns, password security, session management
- **Pattern**: Reusable auth system for future web projects

🚨 APPROVAL REQUIRED: Type 'PROCEED' to execute this plan
```

### Your Response Options

- **"PROCEED"** - Execute the plan as described
- **"NO"** - Cancel the plan, no changes made
- **"Modify the plan to..."** - Claude will revise and re-plan
- **Ask questions** - "Why do we need werkzeug?" gets explained

## Configuration

### Basic Setup

Auto Plan Mode is enabled through your `.claude/settings.local.json`:

```json
{
  "systemPromptAppend": "$(cat .claude/auto_plan_mode.txt)"
}
```

### Customizing Auto Plan Mode

Edit `.claude/auto_plan_mode.txt` to adjust behavior:

```txt
## SKIP PLANNING FOR:
- Reading files (`cat`, `ls`, status checks)
- Documentation viewing
- Using existing `.claude/commands/` (they're already planned)
- Simple questions about the project
- Testing commands (add this if you want)
```

## Best Practices

### Working with Auto Plan Mode

#### ✅ Do This
- **Read the full plan** before approving
- **Ask questions** if anything is unclear
- **Suggest modifications** if needed
- **Learn from each plan** - they're educational!

#### ❌ Avoid This
- Don't approve without reading
- Don't skip the learning opportunity
- Don't disable it just because it's "slower"

### Making the Most of Planning

#### For Learning
- **Ask "why"** questions about plan decisions
- **Request explanations** of new concepts
- **Ask for alternatives** - "Is there another way to do this?"

#### For Complex Tasks
- **Break down big requests** into smaller parts
- **One feature at a time** works better than "build everything"
- **Use existing tasks** as reference points

## Common Scenarios

### When Plans are Skipped

Auto Plan Mode won't activate for:
- **Reading files**: `cat README.md`, `ls -la`
- **Status checks**: Using `.claude/commands/status-check`
- **Documentation questions**: "What does this function do?"
- **Simple queries**: "How do I install Python?"

### When Plans are Always Required

Auto Plan Mode always activates for:
- **Code changes**: Creating or modifying source files
- **Dependencies**: Adding or updating packages
- **Configuration**: Changing settings or environment
- **Database operations**: Schema changes, data migration
- **Deployment**: Publishing or hosting changes

## Advanced Features

### Integration with Task Management

Auto Plan Mode automatically:
- **Checks** for related tasks in `/tasks/`
- **References** existing task files
- **Updates** task history when appropriate
- **Suggests** creating new tasks for complex features

### Learning Documentation

Each plan includes:
- **Learning Outcome**: What concepts you'll learn
- **Pattern**: Reusable patterns for future projects
- **Best Practices**: Industry-standard approaches

## Troubleshooting

### Auto Plan Mode Not Activating

**Check these things:**

1. **Location**: Are you in the project directory with `.claude/settings.local.json`?
2. **File exists**: Does `.claude/auto_plan_mode.txt` exist?
3. **Syntax**: Is the JSON syntax correct in settings?
4. **Request type**: Are you asking for something that triggers planning?

### Plans Are Too Detailed

**To simplify:**
- Edit `.claude/auto_plan_mode.txt`
- Remove sections you don't need
- Focus on just "Files to Change" and "Commands to Run"

### Plans Are Too Basic

**To get more detail:**
- Ask: "Can you explain more about the security implications?"
- Request: "Add more validation steps to the plan"
- Specify: "Include testing steps in the plan"

## Getting the Most Value

### For Beginners
- **Read every plan** - they're learning materials
- **Ask questions** - Claude loves explaining concepts
- **Start small** - build confidence with simple tasks

### For Experienced Developers
- **Focus on new technologies** - let plans teach new frameworks
- **Use for complex changes** - planning prevents mistakes
- **Customize heavily** - adapt to your workflow

### For Teams
- **Share plan screenshots** - great for code reviews
- **Document patterns** - build team knowledge
- **Standardize approaches** - consistent development practices

## Conclusion

Auto Plan Mode transforms Claude Code from a tool that makes changes into a collaborative development partner that:

- **Teaches** you as you build
- **Protects** your code from mistakes
- **Organizes** your development process
- **Documents** your learning journey

It's especially powerful when combined with PRP's task management system and pre-built commands. The result is a development experience that's both safe and educational.

**Ready to experience Auto Plan Mode?**

1. Set up a PRP project
2. Start Claude Code in the project directory  
3. Ask Claude to help build something
4. Watch the magic happen! ✨