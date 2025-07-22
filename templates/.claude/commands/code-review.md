# Code Review

Review code for quality and best practices. Use with arguments to target specific areas.

## Usage Examples

```bash
# General codebase review
/code-review

# Review specific file
/code-review src/auth/handlers.py

# Review specific directory
/code-review src/api/

# Security-focused review
/code-review --security

# Review recent changes
/code-review --recent
```

## Review Process

### Target: $ARGUMENTS
**Focus Area**: ${ARGUMENTS:-"entire codebase"}
**Review Scope**: ${ARGUMENTS:+"Targeted review of $ARGUMENTS"}

1. **Check Target Area**
   - Look at ${ARGUMENTS:-"recent code changes"}
   - Review ${ARGUMENTS:-"current files"} for quality
   - Check git diff for improvements in ${ARGUMENTS:-"all areas"}

2. **Best Practices Check**
   - **Python**: PEP 8 compliance, type hints, docstrings
   - **Google ADK**: Proper agent patterns, tool definitions  
   - **Security**: Input validation, credential handling
   - **Architecture**: Clean separation of concerns

3. **Code Quality Standards**
   - Type hints on functions
   - Good docstrings (Google style preferred)
   - No print() statements (use logging)
   - Proper error handling
   - Input validation and sanitization

4. **Framework-Specific Patterns**
   - **ADK Agents**: Tool registration, error handling
   - **Flask/FastAPI**: Route organization, middleware
   - **ML/AI**: Data validation, model handling
   - **Cloud**: Proper resource management

## Automated Checks

```bash
# Code formatting
ruff check ${ARGUMENTS:-.}
black --check ${ARGUMENTS:-.}

# Type checking  
mypy ${ARGUMENTS:-.}

# Security scan
bandit -r ${ARGUMENTS:-.}

# Test coverage
pytest --cov=${ARGUMENTS:-"."}${ARGUMENTS:+ "$ARGUMENTS"}
```

## Targeted Review Approaches

### File-Specific Review
**When**: `/code-review src/auth/handlers.py`
- Deep dive into specific file
- Check function complexity
- Validate error handling
- Review documentation

### Directory Review  
**When**: `/code-review src/api/`
- Consistency across module
- API design patterns
- Integration approaches
- Common utilities

### Security Review
**When**: `/code-review --security`
- Focus on security vulnerabilities
- Input validation patterns
- Authentication/authorization
- Secrets management

### Recent Changes Review
**When**: `/code-review --recent`
- Git diff analysis
- Impact assessment
- Regression potential
- Integration concerns

## Review Output

Provide specific, actionable recommendations for **${ARGUMENTS:-"the codebase"}**:
- ✅ **What's working well** in ${ARGUMENTS:-"the reviewed area"}
- ⚠️ **What needs fixing** (with examples)
- 🔒 **Security issues** to address
- 📚 **Learning opportunities** in the code
- 🎯 **Next steps** to improve quality

## Documentation

Save detailed findings in `/quality/code-review-${ARGUMENTS//\//-}-[date].md` for future reference.