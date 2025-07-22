# Quick Fix Common Issues

Rapidly fix common problems. Use arguments to target specific issue types.

## Usage Examples

```bash
# General troubleshooting
/quick-fix

# Fix import errors
/quick-fix imports

# Fix dependency issues
/quick-fix dependencies

# Fix code formatting
/quick-fix formatting

# Fix security issues
/quick-fix security

# Fix specific error message
/quick-fix "ModuleNotFoundError: No module named 'fastapi'"
```

## Quick Fix Target: $ARGUMENTS

**Focus Area**: ${ARGUMENTS:-"general troubleshooting"}
**Fix Scope**: ${ARGUMENTS:+"Targeted fixes for $ARGUMENTS"}

## Common Issues & Targeted Fixes

### Import Errors
**When**: `/quick-fix imports` or `/quick-fix "ImportError"`
```bash
# Check virtual environment
source .venv/bin/activate

# Update dependencies
uv sync

# Verify file paths
find . -name "*.py" -exec python -m py_compile {} \;

# Check PYTHONPATH
export PYTHONPATH="${PYTHONPATH}:$(pwd)/src"
```

### Dependency Issues
**When**: `/quick-fix dependencies` or `/quick-fix "No module named"`
```bash
# Recreate virtual environment
rm -rf .venv
uv venv
source .venv/bin/activate
uv sync

# Check for conflicts
uv pip check

# Update specific package
uv add ${ARGUMENTS#*named }${ARGUMENTS#*named } --upgrade
```

### Code Formatting
**When**: `/quick-fix formatting`
```bash
# Auto-fix formatting
ruff check --fix .
black .

# Sort imports
isort .

# Remove unused imports
autoflake --remove-all-unused-imports --recursive --in-place .
```

### Security Issues
**When**: `/quick-fix security`
```bash
# Security scan and fix
bandit -r . --format json -o security-report.json

# Update vulnerable dependencies
safety check
pip-audit --fix

# Remove secrets from git history
git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch .env' HEAD
```

### Connection Problems
**When**: `/quick-fix connection` or `/quick-fix database`
- Check `.env` file has correct values for ${ARGUMENTS:-"all services"}
- Test ${ARGUMENTS:-"external"} connections separately
- Verify ${ARGUMENTS:-"authentication"} credentials

### Application Not Starting
**When**: `/quick-fix startup` or `/quick-fix "cannot start"`
- Check for error messages in logs
- Verify all required services are running
- Try restarting the ${ARGUMENTS:-"application"}

### Environment Issues
**When**: `/quick-fix environment`
```bash
# Reset environment
rm -rf .venv
uv venv
source .venv/bin/activate
uv sync

# Check Python version
python --version

# Verify uv installation
uv --version
```

### Git Issues  
**When**: `/quick-fix git`
```bash
# Check status
git status

# Reset changes
git checkout -- .

# Clean untracked files
git clean -fd

# Fix merge conflicts
git mergetool
```

## Error-Specific Fixes

### For Specific Error Messages
**When**: `/quick-fix "specific error message"`

Analyze the error message: **"$ARGUMENTS"**

**Common patterns:**
- **ModuleNotFoundError**: Install missing package with `uv add [package]`
- **ImportError**: Check file paths and PYTHONPATH
- **ConnectionError**: Verify service availability and credentials
- **PermissionError**: Check file permissions with `chmod`
- **SyntaxError**: Run `python -m py_compile` to identify location

## Quick Diagnostics for $ARGUMENTS

- Check logs for error messages related to ${ARGUMENTS:-"the issue"}
- Verify environment variables for ${ARGUMENTS:-"all services"}
- Test individual components of ${ARGUMENTS:-"the system"}
- Check network connectivity for ${ARGUMENTS:-"external services"}
- Validate configuration files for ${ARGUMENTS:-"the application"}

## Automated Fix Scripts

```bash
# Quick health check
./scripts/health-check.sh${ARGUMENTS:+ --focus="$ARGUMENTS"}

# Auto-fix common issues
./scripts/auto-fix.sh${ARGUMENTS:+ --target="$ARGUMENTS"}

# Reset to working state
./scripts/reset-environment.sh
```

## Output

Provide immediate, actionable solutions for **${ARGUMENTS:-"the identified issues"}**:
- 🚨 **Immediate fixes** for ${ARGUMENTS:-"critical problems"}
- ⚡ **Quick commands** to resolve ${ARGUMENTS:-"common issues"}
- 🔍 **Diagnostic steps** to identify root cause
- 📋 **Prevention tips** to avoid ${ARGUMENTS:-"similar issues"} in future

Keep it simple - most issues have simple fixes!