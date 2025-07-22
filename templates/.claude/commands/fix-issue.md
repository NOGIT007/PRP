# Fix Issue

Find and fix a specific issue. Requires issue number or description as argument.

## Usage Examples

```bash
# Fix specific GitHub issue
/fix-issue 123

# Fix issue by description
/fix-issue "login form validation not working"

# Fix bug with priority
/fix-issue 456 --priority high

# Fix issue with specific approach
/fix-issue 789 --approach "refactor authentication"
```

## Issue Fix Process for: $ARGUMENTS

**Target Issue**: $ARGUMENTS
**Fix Scope**: Complete resolution with testing and documentation

### Step 1: Understand the Issue

**Issue Identification**: $ARGUMENTS

1. **Locate Issue Details**
   - Check GitHub issue #$ARGUMENTS (if numeric)
   - Review issue description: "$ARGUMENTS"
   - Understand expected vs actual behavior
   - Identify affected components

2. **Gather Context**
   - Review related code in the repository
   - Check recent commits that might be related
   - Look for similar issues in the issue tracker
   - Review user reports and error logs

3. **Reproduce the Issue**
   - Set up test environment
   - Follow reproduction steps for "$ARGUMENTS"
   - Confirm the issue exists
   - Document current behavior

### Step 2: Locate Relevant Code

**Code Investigation for**: $ARGUMENTS

1. **Find Affected Files**
   - Search codebase for relevant keywords
   - Identify modules/components involved
   - Check related configuration files
   - Review database schemas if applicable

2. **Analyze Code Flow**
   - Trace execution path
   - Identify decision points
   - Check error handling
   - Review logging statements

3. **Review Dependencies**
   - Check external library usage
   - Verify API integrations
   - Review environment variables
   - Check database connections

### Step 3: Implement Solution

**Solution Implementation for**: $ARGUMENTS

1. **Root Cause Analysis**
   - Identify the underlying cause
   - Understand why the issue occurred
   - Check for edge cases
   - Consider system interactions

2. **Design Fix**
   - Plan minimal, focused changes
   - Consider backward compatibility
   - Review security implications
   - Plan for error handling

3. **Implement Changes**
   ```python
   # Fix implementation for: $ARGUMENTS
   # TODO: Add specific code changes
   # Focus on addressing the root cause
   # Include proper error handling
   # Add logging for debugging
   ```

4. **Code Quality**
   - Follow project coding standards
   - Add proper documentation
   - Include type hints
   - Handle edge cases

### Step 4: Add Appropriate Tests

**Test Coverage for**: $ARGUMENTS

1. **Unit Tests**
   ```python
   def test_fix_for_issue_$ARGUMENTS():
       """Test that issue $ARGUMENTS is resolved."""
       # Test the specific scenario
       # Verify expected behavior
       # Check edge cases
       pass
   ```

2. **Integration Tests**
   - Test component interactions
   - Verify end-to-end functionality
   - Check API responses
   - Validate database operations

3. **Regression Tests**
   - Ensure existing functionality works
   - Check related features
   - Verify no new issues introduced
   - Test performance impact

4. **Manual Testing**
   - Test the original reproduction steps
   - Verify user workflow
   - Check different browsers/devices
   - Validate error messages

### Step 5: Documentation and PR

**Documentation for Issue**: $ARGUMENTS

1. **Code Documentation**
   - Update inline comments
   - Add docstring explanations
   - Document configuration changes
   - Update API documentation

2. **Prepare PR Description**
   ```markdown
   ## Fix: $ARGUMENTS
   
   ### Problem
   [Description of the issue]
   
   ### Solution
   [Explanation of the fix]
   
   ### Changes
   - [List of files modified]
   - [New functionality added]
   - [Tests added]
   
   ### Testing
   - [How to test the fix]
   - [Test cases covered]
   
   ### Closes #$ARGUMENTS
   ```

3. **Update Documentation**
   - Update README if needed
   - Add to CHANGELOG
   - Update configuration docs
   - Add troubleshooting notes

## Validation Checklist

**For Issue**: $ARGUMENTS

- [ ] Issue reproduction confirmed
- [ ] Root cause identified
- [ ] Fix implemented and tested
- [ ] Unit tests added/updated
- [ ] Integration tests pass
- [ ] No regression introduced
- [ ] Code follows project standards
- [ ] Documentation updated
- [ ] PR description complete
- [ ] Ready for review

## Common Issue Patterns

### Authentication Issues
**When**: Issues related to login, tokens, permissions
- Check JWT token handling
- Verify session management
- Review authentication middleware
- Test permission checks

### Database Issues
**When**: Data not saving, queries failing
- Check database connections
- Verify query syntax
- Review migration scripts
- Test with different data

### API Issues
**When**: Endpoints not working, wrong responses
- Check route definitions
- Verify request/response formats
- Review middleware
- Test with different inputs

### UI Issues
**When**: Interface problems, styling issues
- Check CSS/styling
- Verify JavaScript functionality
- Test responsive design
- Check browser compatibility

## Success Criteria

**Issue $ARGUMENTS is resolved when:**
- Original problem no longer occurs
- All tests pass
- No new issues introduced
- Code meets quality standards
- Documentation is updated
- Fix is ready for deployment

**Next Steps**: Create PR with fix for issue $ARGUMENTS