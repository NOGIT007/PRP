# Create Task List from PRD

Break down your PRD into simple, actionable tasks.

## Task Creation Process

1. **Read the PRD**
   - Review `/docs/prd.md` thoroughly
   - Identify main features to build
   - Note any dependencies

2. **Create Simple Tasks**
   - One clear goal per task
   - Include what success looks like
   - Add simple validation steps
   - Estimate difficulty (Small/Medium/Large)

3. **Task Structure**
   ```markdown
   # [Number] - [Task Name]
   
   ## Goal
   [What you're trying to achieve]
   
   ## Steps
   1. [Simple action]
   2. [Next action]
   
   ## How to Test
   - [Simple test to verify it works]
   
   ## Size
   [Small/Medium/Large]
   
   ## Learning Notes
   - [What concepts this teaches]
   - [Useful patterns to remember]
   ```

4. **Task Organization**
   - Save each task as `/tasks/[XX]-[task-name].md`
   - Keep a master list in `/tasks/README.md`
   - Update `/tasks/task_history.md` when completed

Perfect for breaking down complex projects into learnable chunks!