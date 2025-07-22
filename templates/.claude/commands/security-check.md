# Security Review

Review project security with optional focus area. Use arguments to target specific components.

## Usage Examples

```bash
# General security review
/security-check

# Focus on authentication
/security-check auth

# Database security review
/security-check database

# API security focus
/security-check api

# Critical issues only
/security-check --critical
```

## Security Review Areas

### Target: $ARGUMENTS
**Focus Area**: ${ARGUMENTS:-"comprehensive security review"}
**Security Scope**: ${ARGUMENTS:+"Targeted security analysis of $ARGUMENTS"}

### Core Security Areas

1. **Credential Management**
   - Check `.env` file handling in ${ARGUMENTS:-"all components"}
   - No secrets in code or git history
   - Proper environment variable usage
   - Service account key management

2. **Input Validation** 
   - User input sanitization in ${ARGUMENTS:-"all endpoints"}
   - SQL injection prevention (if using databases)
   - Command injection prevention
   - File upload security

3. **Authentication & Authorization**
   - Proper authentication implementation
   - Session management
   - API key security  
   - Access control mechanisms

4. **Data Security**
   - Sensitive data encryption
   - Secure data transmission (HTTPS)
   - Data retention policies
   - Privacy compliance

5. **Cloud Security**
   - IAM permissions (principle of least privilege)
   - Network security
   - Resource access controls
   - Logging and monitoring

## Targeted Security Reviews

### Authentication Focus
**When**: `/security-check auth`
- JWT token security
- Password handling
- Session management
- Multi-factor authentication
- Login/logout flows

### Database Security
**When**: `/security-check database`
- Connection security
- Query parameterization
- Access controls
- Encryption at rest
- Backup security

### API Security
**When**: `/security-check api`
- Input validation
- Rate limiting
- CORS configuration
- API key management
- Response data exposure

### Critical Issues Only
**When**: `/security-check --critical`
- High-severity vulnerabilities
- Immediate security risks
- Compliance violations
- Data exposure risks

## Security Checklist for $ARGUMENTS

### Code Security
- [ ] No hardcoded secrets in ${ARGUMENTS:-"codebase"}
- [ ] Input validation on all user inputs
- [ ] Proper error handling (no sensitive info in errors)
- [ ] SQL parameterization (if applicable)
- [ ] File path validation

### Environment Security  
- [ ] `.env` files not in git
- [ ] Secure random key generation
- [ ] Environment-specific configurations
- [ ] Service account best practices

### Deployment Security
- [ ] HTTPS enforcement
- [ ] Security headers configured
- [ ] Resource limits set
- [ ] Monitoring and alerting enabled

## Security Tools

```bash
# Scan for secrets
truffleHog --no_filter ${ARGUMENTS:-.}

# Python security audit
bandit -r ${ARGUMENTS:-.}

# Dependency vulnerabilities
pip-audit${ARGUMENTS:+ --requirement $ARGUMENTS/requirements.txt}

# Check git history for secrets
git-secrets --scan-history${ARGUMENTS:+ -- $ARGUMENTS}
```

## Recommendations Output

Provide specific, actionable security improvements for **${ARGUMENTS:-"the entire project"}**:
- 🔒 **Critical Issues**: Fix immediately
- ⚠️ **Important**: Address soon  
- 💡 **Best Practices**: Implement when possible
- 📚 **Learning**: Security concepts to understand

## Documentation

Save security findings and fixes in `/security/security-review-${ARGUMENTS//\//-}-[date].md`

Security is not optional - build it in from the start!