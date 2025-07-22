# PRP Methodology - Context Engineering for AI

The Product Requirement Prompt (PRP) methodology is a structured approach to context engineering that enables AI agents to deliver production-ready code on the first pass.

## What is a PRP?

**In short:** A PRP is PRD + curated codebase intelligence + agent/runbook—the minimum viable packet an AI needs to plausibly ship production-ready code on the first pass.

### The Three Pillars of PRP

#### 1. **Context** 🎯
Precise file paths and content, library versions and library context, code snippets examples. LLMs generate higher-quality code when given direct, in-prompt references instead of broad descriptions.

#### 2. **Structure** 🏗️
Explicit architectural decisions, naming conventions, and integration patterns. Where a PRD might say "secure user authentication," a PRP specifies "OAuth 2.0 with JWT tokens, using library X version Y, following pattern Z."

#### 3. **Constraints** 🛡️
Technical boundaries, performance requirements, and deployment constraints that guide implementation choices.

## PRP vs Traditional PRD

### Traditional PRD
- ✅ **What** the product must do
- ✅ **Why** customers need it
- ❌ Deliberately avoids **how** it will be built

### Product Requirement Prompt (PRP)
- ✅ **What** the product must do (inherited from PRD)
- ✅ **Why** customers need it (inherited from PRD)
- ✅ **How** it will be built (AI-critical addition)
- ✅ **Context** for immediate implementation
- ✅ **Structure** for consistent architecture
- ✅ **Constraints** for guided decisions

## PRP Structure Template

### Basic PRP Format

```markdown
# [Feature Name] - Product Requirement Prompt

## Product Context
**Goal**: [What this feature accomplishes]
**User Value**: [Why users need this]
**Success Metrics**: [How we measure success]

## Technical Context
**Architecture**: [System design decisions]
**Dependencies**: [Libraries and versions]
**Integration Points**: [How it connects to existing code]

## Implementation Constraints
**Performance**: [Speed and efficiency requirements]
**Security**: [Security considerations and patterns]
**Deployment**: [Environment and hosting constraints]

## Code Context
**File Structure**:
```
src/
├── feature/
│   ├── __init__.py
│   ├── models.py
│   └── handlers.py
```

**Key Libraries**:
- library-name==1.2.3 (purpose and usage pattern)
- another-lib>=2.0.0 (integration approach)

**Code Patterns**:
[Include relevant code snippets and examples]

## Acceptance Criteria
- [ ] Functional requirement 1
- [ ] Performance requirement 2
- [ ] Security requirement 3
- [ ] Integration requirement 4
```

## Context Engineering Best Practices

### 1. Precise File References

❌ **Vague**: "Add authentication to the app"

✅ **Precise**: 
```
Add authentication to src/auth/handlers.py
Integrate with existing User model in src/models/user.py
Following the pattern established in src/auth/oauth.py
```

### 2. Specific Library Context

❌ **Vague**: "Use a web framework"

✅ **Specific**:
```
Using FastAPI 0.104.1:
- Route definitions in src/api/routes/
- Dependency injection for auth
- Pydantic models for validation
- Following existing pattern in src/api/users.py
```

### 3. Concrete Examples

❌ **Abstract**: "Handle errors gracefully"

✅ **Concrete**:
```python
# Error handling pattern to follow:
try:
    result = await database_operation()
    return SuccessResponse(data=result)
except DatabaseError as e:
    logger.error(f"Database error: {e}")
    return ErrorResponse(error="Database unavailable")
except ValidationError as e:
    return ErrorResponse(error=f"Invalid input: {e}")
```

## Using ai_docs/ Directory

The `ai_docs/` directory is a crucial part of PRP methodology - it provides curated documentation that AI agents can reference during development.

### Structure
```
ai_docs/
├── libraries/
│   ├── fastapi-patterns.md
│   ├── sqlalchemy-best-practices.md
│   └── google-adk-guide.md
├── architecture/
│   ├── system-design.md
│   ├── database-schema.md
│   └── api-patterns.md
├── examples/
│   ├── auth-implementation.py
│   ├── database-operations.py
│   └── error-handling.py
└── constraints/
    ├── security-requirements.md
    ├── performance-targets.md
    └── deployment-guidelines.md
```

### Content Guidelines

#### Library Documentation
- Version-specific examples
- Common patterns and anti-patterns
- Integration approaches
- Configuration templates

#### Architecture Documentation
- System diagrams
- Data flow patterns
- Integration points
- Naming conventions

#### Example Code
- Working, tested examples
- Comment-heavy explanations
- Common use cases
- Error handling patterns

#### Constraints Documentation
- Technical limitations
- Performance requirements
- Security policies
- Deployment restrictions

## PRP in Practice

### Example: Adding User Authentication

#### Traditional PRD Approach
```markdown
# User Authentication Feature

## Goal
Users need to securely log in to access personalized features.

## Requirements
- Secure authentication
- Password management
- Session handling
- User registration
```

#### PRP Approach
```markdown
# User Authentication - Product Requirement Prompt

## Product Context
**Goal**: Users can securely authenticate to access personalized dashboard
**User Value**: Personalized experience with saved preferences
**Success Metrics**: <1s login time, >99.9% availability

## Technical Context
**Architecture**: JWT-based stateless authentication
**Dependencies**: 
- fastapi-users==12.1.2 (pre-configured auth flows)
- python-jose[cryptography]==3.3.0 (JWT handling)
- passlib[bcrypt]==1.7.4 (password hashing)

**Integration Points**:
- src/models/user.py (existing User model)
- src/database/session.py (database connection)
- src/api/dependencies.py (auth middleware)

## Implementation Constraints
**Performance**: Auth check <50ms, token refresh <100ms
**Security**: Bcrypt hashing, 15-min JWT expiry, secure headers
**Deployment**: Stateless for horizontal scaling

## Code Context
**File Structure**:
```
src/auth/
├── __init__.py
├── models.py      # User authentication models
├── schemas.py     # Pydantic schemas for auth
├── handlers.py    # Auth route handlers
├── dependencies.py # Auth dependencies
└── utils.py       # JWT utilities
```

**Existing Patterns** (from ai_docs/examples/auth-implementation.py):
```python
# Follow this dependency injection pattern:
async def get_current_user(
    token: str = Depends(oauth2_scheme),
    db: AsyncSession = Depends(get_db_session)
) -> User:
    # JWT validation logic here
    pass
```

**Database Integration** (extends src/models/user.py):
```python
class User(SQLAlchemyBaseUserTable[int], Base):
    # Add these fields to existing User model:
    created_at: Mapped[datetime] = mapped_column(default=datetime.utcnow)
    last_login: Mapped[Optional[datetime]] = mapped_column(nullable=True)
    is_verified: Mapped[bool] = mapped_column(default=False)
```

## Acceptance Criteria
- [ ] Login endpoint returns JWT token in <1s
- [ ] Password hashing uses bcrypt with cost factor 12
- [ ] JWT tokens expire in 15 minutes
- [ ] Refresh tokens valid for 7 days
- [ ] Auth middleware validates tokens on protected routes
- [ ] Registration includes email verification
- [ ] Failed login attempts are rate-limited
- [ ] Passwords meet complexity requirements
```

### Benefits of This Approach

1. **Immediate Implementation**: AI has everything needed to start coding
2. **Consistent Architecture**: Follows established patterns
3. **Production Ready**: Security and performance considered upfront
4. **Maintainable**: Clear structure and documentation
5. **Testable**: Specific criteria for validation

## Creating Effective PRPs

### Step 1: Start with Traditional PRD
- Define the user need
- Establish success criteria
- Outline basic requirements

### Step 2: Add Technical Context
- Choose specific libraries and versions
- Define architectural approach
- Identify integration points

### Step 3: Provide Code Context
- Reference existing patterns
- Include relevant examples
- Specify file organization

### Step 4: Define Constraints
- Performance requirements
- Security considerations
- Deployment limitations

### Step 5: Create Acceptance Criteria
- Specific, measurable outcomes
- Technical validation steps
- Integration requirements

## Common PRP Patterns

### API Endpoint PRP
```markdown
## Endpoint Context
**Route**: POST /api/v1/users
**Method**: Create new user
**Handler Location**: src/api/routes/users.py
**Schema**: src/schemas/user.py (UserCreate, UserResponse)
**Validation**: Pydantic with custom validators
**Database**: SQLAlchemy async session
**Response Format**: JSON with standard error handling
```

### Database Operation PRP
```markdown
## Database Context
**ORM**: SQLAlchemy 2.0 with async support
**Session Management**: src/database/session.py
**Model Location**: src/models/[entity].py
**Migration**: Alembic auto-generation
**Connection Pool**: AsyncEngine with 5-20 connections
**Query Patterns**: Repository pattern in src/repositories/
```

### Integration PRP
```markdown
## Integration Context
**External Service**: [Service Name] API v2.1
**Client Library**: [library-name]==1.2.3
**Configuration**: Environment variables in .env
**Error Handling**: Circuit breaker pattern
**Retry Logic**: Exponential backoff (3 attempts)
**Timeout**: 30s for API calls, 5s for health checks
```

## Tools for PRP Development

### Documentation Pipeline
```bash
# Extract library documentation
python scripts/extract_docs.py fastapi > ai_docs/libraries/fastapi-patterns.md

# Generate architecture diagrams
mermaid-cli -i docs/architecture.mmd -o ai_docs/architecture/system-design.png

# Validate examples
python -m pytest ai_docs/examples/ --doctest-modules
```

### Context Validation
```python
# Validate PRP completeness
def validate_prp(prp_content: str) -> PRPValidation:
    checks = [
        has_technical_context(prp_content),
        has_code_examples(prp_content),
        has_specific_constraints(prp_content),
        has_acceptance_criteria(prp_content)
    ]
    return PRPValidation(checks)
```

## Measuring PRP Effectiveness

### Success Metrics
- **First-Pass Success Rate**: % of features that work without revision
- **Implementation Speed**: Time from PRP to working code
- **Code Quality**: Automated quality scores
- **Integration Success**: % of features that integrate cleanly

### Continuous Improvement
- Track which PRPs lead to successful implementations
- Identify common patterns that work well
- Refine context engineering based on outcomes
- Update ai_docs/ based on new learnings

## Conclusion

The PRP methodology transforms AI-assisted development from "trial and error" to "precision engineering." By providing comprehensive context, clear structure, and specific constraints, PRPs enable AI agents to deliver production-ready code that integrates seamlessly with existing systems.

**Key Takeaways**:
1. **Context is King**: Specific examples outperform general descriptions
2. **Structure Enables Scale**: Consistent patterns reduce cognitive load
3. **Constraints Guide Quality**: Clear boundaries prevent poor decisions
4. **Documentation is Code**: The ai_docs/ directory is as important as src/

**Ready to create your first PRP?** Start with the template above and adapt it to your specific domain and technology stack.