# Auto Plan Mode

Activate defensive planning mode for all development tasks.

## What This Does

Automatically enters planning mode before:
- Code modifications
- File creation/updates
- System operations
- Database changes
- Deployment tasks

## Usage

This command integrates with your existing workflow by making Claude:
1. Analyze your request against existing tasks
2. Create a detailed execution plan
3. Wait for your approval
4. Execute only after "PROCEED"
5. Update task history when appropriate

## Integration

Works seamlessly with:
- Your existing `.claude/commands/`
- Task management in `/tasks/`
- Your project's development workflow
- Security constraints and best practices

Perfect for learning - you see the plan before execution!