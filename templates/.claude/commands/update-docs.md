# Update Documentation

Keep your project documentation current and helpful.

## Documentation Review Areas

1. **Core Documentation Files**
   - `README.md` - Project overview and setup
   - `CLAUDE.md` - Claude Code specific guidance
   - `/docs/prd.md` - Product requirements
   - Installation and setup guides

2. **Code Documentation**
   - Function docstrings (Google style preferred)
   - Class documentation
   - Module-level documentation
   - API documentation

3. **Learning Documentation**
   - New patterns and insights discovered
   - Troubleshooting guides
   - Best practices learned
   - Common gotchas and solutions

4. **Process Documentation**
   - Development workflow
   - Testing procedures
   - Deployment process
   - Security guidelines

## Documentation Update Process

### Quick Updates
1. Fix any outdated information
2. Add missing setup steps
3. Update dependency versions
4. Correct broken links

### Content Improvements
1. Add examples to complex concepts
2. Create troubleshooting sections
3. Document new features
4. Add visual diagrams where helpful

### Learning Documentation
```markdown
# Learning Notes - [Date]

## New Concepts Learned
- [Concept]: [What you learned and why it's important]

## Useful Patterns
- [Pattern]: [When to use it and example]

## Gotchas to Remember
- [Issue]: [What went wrong and how to avoid it]

## Resources Found
- [Link]: [What it teaches]
```

## Documentation Standards

### Code Documentation
```python
def example_function(param: str) -> bool:
    """
    Brief description of what this function does.
    
    Args:
        param: Description of the parameter
        
    Returns:
        Description of what's returned
        
    Raises:
        ExceptionType: When this exception is raised
        
    Example:
        >>> example_function("test")
        True
    """
```

### README Structure
```markdown
# Project Name

Brief project description

## Quick Start
[Minimal setup steps]

## Installation
[Detailed setup instructions]

## Usage
[How to use the main features]

## Development
[How to contribute/develop]

## Troubleshooting
[Common issues and solutions]
```

## Automated Documentation

### Generate API Docs
```bash
# Generate from docstrings
pdoc --html your_module/

# Or use sphinx
sphinx-quickstart docs/
```

### Documentation Tools
```bash
# Check for broken links
linkchecker docs/

# Spell check
aspell check README.md

# Markdown linting
markdownlint docs/
```

## Documentation Maintenance

### Regular Reviews
- Monthly documentation review
- Update after major changes
- Validate setup instructions
- Check for outdated screenshots

### User Feedback
- Ask users what's confusing
- Track common support questions
- Update docs based on real issues
- Add FAQ sections

## Output Format
Create documentation updates that are:
- **Clear**: Easy to understand
- **Current**: Reflects latest changes
- **Complete**: Covers all necessary topics
- **Concise**: No unnecessary complexity

**Save updates**: Track major documentation changes in `/docs/changelog.md`

Good documentation is code for humans!