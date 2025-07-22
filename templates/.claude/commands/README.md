# Claude Commands for PRP Framework

Pre-built commands optimized for AI engineering workflows with the Product Requirement Prompt (PRP) methodology.

## Command Categories

### 🔍 Analysis Commands
- **code-review** - Comprehensive code quality analysis
- **analyze-file** - Deep dive into specific files
- **explain-code** - Detailed code explanations
- **security-check** - Security vulnerability assessment

### 🧪 Testing Commands
- **generate-tests** - Create comprehensive test suites
- **test-application** - Run targeted testing
- **quick-fix** - Rapid issue resolution

### 🔧 Development Commands
- **fix-issue** - Resolve specific issues or bugs
- **refactor** - Improve code quality and structure
- **update-docs** - Maintain current documentation
- **check-libraries** - Manage dependencies

### 📋 Project Management
- **status-check** - Project health overview
- **create-tasks** - Break down features into tasks
- **create-prd** - Product Requirements Documents
- **deployment-check** - Production readiness
- **ui-check** - User experience review

### ⚙️ Framework Commands
- **auto-plan** - Auto Plan Mode control

## Enhanced with $ARGUMENTS

Most commands support the `$ARGUMENTS` placeholder for targeted functionality:

```bash
# Examples of argument usage
/code-review src/auth/handlers.py
/security-check auth
/generate-tests UserAuthenticationHandler
/fix-issue 123
/analyze-file config/settings.py
```

## Usage Patterns

### General Commands
```bash
# Basic usage (no arguments)
/status-check
/auto-plan
/deployment-check
```

### Targeted Commands
```bash
# File-specific operations
/analyze-file src/auth/middleware.py
/code-review src/api/

# Component-specific operations
/security-check database
/test-application auth

# Issue-specific operations
/fix-issue "login validation not working"
/quick-fix imports
```

### Advanced Usage
```bash
# With options and flags
/code-review --security
/generate-tests api/users --type integration
/refactor data_processor --pattern "repository pattern"
```

## Command Integration

### With PRP Methodology
Commands are designed to work with Product Requirement Prompts:

```markdown
## Implementation Commands
- `/code-review $COMPONENT` - Review implementation quality
- `/security-check $COMPONENT` - Validate security requirements
- `/generate-tests $COMPONENT` - Ensure comprehensive testing
```

### With AI Documentation
Commands reference the ai_docs/ structure:

```bash
# Commands automatically reference:
# - ai_docs/patterns/ for implementation patterns
# - ai_docs/examples/ for code examples
# - ai_docs/constraints/ for requirements
```

### With Auto Plan Mode
All commands work with Auto Plan Mode for safe execution:

1. Command analyzes request and context
2. Creates detailed execution plan
3. Waits for approval
4. Executes with monitoring
5. Updates project documentation

## Command Development

### Creating New Commands

1. **Choose a clear name** that describes the action
2. **Add argument support** using `$ARGUMENTS` placeholder
3. **Include usage examples** showing different patterns
4. **Document the output** format and expectations
5. **Test with various inputs** to ensure robustness

### Command Template
```markdown
# Command Name

Brief description of what this command does.

## Usage Examples

```bash
# Basic usage
/command-name

# With arguments
/command-name specific-target

# With options
/command-name target --option value
```

## Command Logic: $ARGUMENTS

**Target**: ${ARGUMENTS:-"general scope"}
**Purpose**: [What the command accomplishes]

### Step 1: Analysis
[How the command analyzes the target]

### Step 2: Processing
[What the command does with the analysis]

### Step 3: Output
[What results the command provides]

## Argument Handling

### When: `/command-name specific-case`
- Specialized handling for this case
- Targeted processing approach
- Customized output format

## Integration

**File Locations**: Where results are saved
**Related Commands**: Other commands that complement this one
**Dependencies**: What the command requires to function
```

## Best Practices

### For Command Users
1. **Start broad, then narrow**: Use general commands first, then targeted ones
2. **Combine commands**: Use multiple commands for comprehensive analysis
3. **Save results**: Commands often save detailed reports for reference
4. **Follow workflows**: Use commands in logical sequences

### For Command Developers
1. **Focus on single responsibility**: Each command should do one thing well
2. **Support arguments**: Make commands flexible with `$ARGUMENTS`
3. **Provide examples**: Show multiple usage patterns
4. **Integrate with framework**: Reference ai_docs/ and follow PRP patterns

## Command Workflows

### Development Workflow
```bash
# 1. Check project status
/status-check

# 2. Analyze specific component
/code-review src/new-feature/

# 3. Generate tests
/generate-tests NewFeatureHandler

# 4. Security review
/security-check new-feature

# 5. Document changes
/update-docs new-feature
```

### Issue Resolution Workflow
```bash
# 1. Quick diagnostics
/quick-fix "error description"

# 2. Detailed analysis if needed
/analyze-file problematic-file.py

# 3. Implement fix
/fix-issue 123

# 4. Verify with tests
/test-application affected-component
```

### Quality Assurance Workflow
```bash
# 1. Comprehensive code review
/code-review

# 2. Security assessment
/security-check

# 3. Test coverage analysis
/test-application

# 4. UI/UX review
/ui-check

# 5. Deployment readiness
/deployment-check
```

## Extending Commands

### Custom Command Ideas
- **Database commands**: Schema analysis, migration review
- **API commands**: Endpoint documentation, response validation
- **Performance commands**: Profiling, optimization suggestions
- **Documentation commands**: API doc generation, changelog updates

### Integration Points
- **CI/CD pipelines**: Automate command execution
- **IDE extensions**: Direct command access from editor
- **Monitoring systems**: Alert-triggered command execution
- **Development workflows**: Git hook integration

The command system is designed to be **extensible**, **consistent**, and **powerful** - supporting both rapid development and production-quality code delivery through the PRP methodology.