# Security Review

Review the project for security issues and best practices.

## Security Review Areas

1. **Credential Management**
   - Check `.env` file handling
   - No secrets in code or git history
   - Proper environment variable usage
   - Service account key management

2. **Input Validation**
   - User input sanitization
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

## Security Checklist

### Code Security
- [ ] No hardcoded secrets
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
truffleHog --no_filter .

# Python security audit
bandit -r .

# Dependency vulnerabilities
pip-audit

# Check git history for secrets
git-secrets --scan-history
```

## Recommendations Output
Provide specific, actionable security improvements:
- **🔒 Critical Issues**: Fix immediately
- **⚠️ Important**: Address soon
- **💡 Best Practices**: Implement when possible
- **📚 Learning**: Security concepts to understand

## Documentation
Save security findings and fixes in `/security/security-review-[date].md`

Security is not optional - build it in from the start!