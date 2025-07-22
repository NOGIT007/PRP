# Command Arguments Guide

The PRP framework supports dynamic commands using the `$ARGUMENTS` placeholder, making commands more powerful and targeted.

## What are Command Arguments?

Command arguments allow you to pass specific parameters to Claude commands, making them dynamic and context-aware instead of generic.

### Basic Syntax
```bash
# In command definition
echo "Process $ARGUMENTS with specific focus" > .claude/commands/example.md

# In Claude session
/example "user authentication"
# This replaces $ARGUMENTS with "user authentication"
```

## Enhanced Commands with Arguments

### 🔍 Code Analysis Commands

#### `/code-review $ARGUMENTS`
**Purpose**: Target code review to specific areas

```bash
# Review specific file
/code-review src/auth/handlers.py

# Review directory
/code-review src/api/

# Security-focused review
/code-review --security

# Review recent changes
/code-review --recent
```

#### `/analyze-file $ARGUMENTS`
**Purpose**: Deep analysis of specific files

```bash
# Analyze Python file
/analyze-file src/auth/middleware.py

# Analyze with performance focus
/analyze-file database/queries.py --performance

# Security analysis
/analyze-file api/endpoints.py --security
```

#### `/explain-code $ARGUMENTS`
**Purpose**: Get detailed explanations of code concepts

```bash
# Explain specific function
/explain-code calculate_user_permissions

# Explain algorithm
/explain-code "binary search implementation"

# Explain with beginner focus
/explain-code JWT_validation --level beginner
```

### 🛡️ Security and Quality Commands

#### `/security-check $ARGUMENTS`
**Purpose**: Focus security review on specific components

```bash
# General security review
/security-check

# Authentication security
/security-check auth

# Database security
/security-check database

# API security focus
/security-check api

# Critical issues only
/security-check --critical
```

#### `/quick-fix $ARGUMENTS`
**Purpose**: Target specific types of issues

```bash
# General troubleshooting
/quick-fix

# Fix import errors
/quick-fix imports

# Fix specific error
/quick-fix "ModuleNotFoundError: No module named 'fastapi'"

# Fix formatting issues
/quick-fix formatting
```

### 🧪 Testing Commands

#### `/generate-tests $ARGUMENTS`
**Purpose**: Generate tests for specific components

```bash
# Generate tests for function
/generate-tests calculate_user_score

# Generate tests for class
/generate-tests UserAuthenticationHandler

# Generate integration tests
/generate-tests api/users --type integration

# Generate performance tests
/generate-tests database/queries --type performance
```

#### `/test-application $ARGUMENTS`
**Purpose**: Run targeted testing

```bash
# General testing
/test-application

# Unit tests only
/test-application unit

# Test specific component
/test-application auth

# Performance testing
/test-application --performance
```

### 🔧 Development Commands

#### `/fix-issue $ARGUMENTS`
**Purpose**: Fix specific issues or bugs

```bash
# Fix GitHub issue
/fix-issue 123

# Fix by description
/fix-issue "login form validation not working"

# Fix with priority
/fix-issue 456 --priority high
```

#### `/refactor $ARGUMENTS`
**Purpose**: Refactor specific code components

```bash
# Refactor function
/refactor calculate_user_score

# Refactor for performance
/refactor src/database/queries.py --focus performance

# Refactor with pattern
/refactor data_processor --pattern "repository pattern"
```

### 📋 Project Management Commands

#### `/create-prd $ARGUMENTS`
**Purpose**: Create PRDs for specific project types

```bash
# General PRD
/create-prd

# AI agent PRD
/create-prd ai-agent

# Web application PRD
/create-prd web-app

# Data pipeline PRD
/create-prd data-pipeline
```

#### `/ui-check $ARGUMENTS`
**Purpose**: Focus UI review on specific areas

```bash
# General UI review
/ui-check

# Check specific page
/ui-check login

# Mobile focus
/ui-check mobile

# Accessibility focus
/ui-check accessibility
```

## How $ARGUMENTS Works

### Variable Substitution
The `$ARGUMENTS` placeholder is replaced with everything that follows the command:

```bash
# Command: /fix-issue 123 --priority high
# $ARGUMENTS becomes: "123 --priority high"

# Command: /code-review src/auth/handlers.py
# $ARGUMENTS becomes: "src/auth/handlers.py"
```

### Conditional Logic
Commands can use shell-style conditional syntax:

```bash
# Default value if no arguments
${ARGUMENTS:-"default value"}

# Use arguments if provided
${ARGUMENTS:+"Processing $ARGUMENTS"}

# File path manipulation
${ARGUMENTS//\//-}  # Replace slashes with dashes
```

### Multiple Argument Patterns
```bash
# Single argument
/command specific-value

# Multiple words
/command "multiple word argument"

# Flags and options
/command target --option value

# File paths
/command src/module/file.py
```

## Creating Custom Argument Commands

### Template Structure
```markdown
# Command Name

Description of what this command does with arguments.

## Usage Examples

```bash
# Example usage patterns
/command-name argument1
/command-name "complex argument"
/command-name path/to/file --option
```

## Command Logic: $ARGUMENTS

**Target**: $ARGUMENTS
**Scope**: [What the command will do with the arguments]

### Processing $ARGUMENTS
[How the command interprets and uses the arguments]

### Argument-Specific Logic
**When**: `/command-name specific-case`
- Special handling for this case
- Customized output
- Targeted processing

### Output
Provide results tailored to **$ARGUMENTS**:
- Specific findings
- Targeted recommendations
- Customized actions
```

### Best Practices for Argument Commands

1. **Clear Usage Examples**
   - Show multiple usage patterns
   - Include common use cases
   - Demonstrate argument variations

2. **Argument Validation**
   - Handle missing arguments gracefully
   - Provide helpful error messages
   - Support default behaviors

3. **Flexible Processing**
   - Support different argument types
   - Handle file paths correctly
   - Process flags and options

4. **Consistent Output**
   - Maintain output format
   - Scale detail to argument scope
   - Include argument context in results

## Advanced Argument Techniques

### Argument Parsing
```bash
# Extract first argument
FIRST_ARG="${ARGUMENTS%% *}"

# Extract remaining arguments
REST_ARGS="${ARGUMENTS#* }"

# Check for specific flags
if [[ "$ARGUMENTS" == *"--verbose"* ]]; then
    # Verbose mode
fi
```

### File Path Handling
```bash
# Safe file path for output
SAFE_PATH="${ARGUMENTS//\//-}"
SAFE_PATH="${SAFE_PATH// /_}"

# Check if argument is a file
if [[ -f "$ARGUMENTS" ]]; then
    # Process as file
else
    # Process as concept/keyword
fi
```

### Context-Aware Processing
```bash
# Different behavior based on argument type
case "$ARGUMENTS" in
    *.py)
        # Python file processing
        ;;
    *.js)
        # JavaScript file processing
        ;;
    --*)
        # Flag processing
        ;;
    *)
        # Default processing
        ;;
esac
```

## Integration with PRP Methodology

Argument-enhanced commands work seamlessly with PRP context engineering:

### In Product Requirement Prompts
```markdown
## Implementation Context
**Focus Area**: $ARGUMENTS
**Command Usage**: `/code-review $ARGUMENTS` for targeted analysis
**Testing Strategy**: `/generate-tests $ARGUMENTS` for component coverage
```

### With AI Documentation
```markdown
**Reference**: ai_docs/patterns/$ARGUMENTS-pattern.md
**Examples**: ai_docs/examples/$ARGUMENTS/
**Constraints**: ai_docs/constraints/$ARGUMENTS-requirements.md
```

## Troubleshooting Arguments

### Common Issues

1. **Spaces in Arguments**
   ```bash
   # Wrong: /command my file name
   # Right: /command "my file name"
   ```

2. **File Path Issues**
   ```bash
   # Use relative paths from project root
   /command src/auth/handlers.py
   ```

3. **Special Characters**
   ```bash
   # Escape or quote special characters
   /command "argument with $pecial characters"
   ```

### Debugging Arguments
```bash
# Add debug output to commands
echo "Debug: Processing arguments: '$ARGUMENTS'"
echo "Debug: Argument count: $(echo $ARGUMENTS | wc -w)"
```

## Command Examples Repository

The PRP framework includes these argument-enhanced commands:

- **Analysis**: `code-review`, `analyze-file`, `explain-code`
- **Security**: `security-check`, `quick-fix`
- **Testing**: `generate-tests`, `test-application`
- **Development**: `fix-issue`, `refactor`
- **Management**: `create-prd`, `ui-check`

Each command demonstrates different argument handling patterns and provides a foundation for creating your own custom commands.

**Ready to use dynamic commands?** Try `/code-review src/` to review your source directory, or `/fix-issue "describe your problem"` to get targeted help!