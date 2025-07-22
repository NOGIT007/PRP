# Refactor Code

Refactor specific code components for better quality, performance, or maintainability.

## Usage Examples

```bash
# Refactor specific function
/refactor calculate_user_score

# Refactor entire class
/refactor UserAuthenticationHandler

# Refactor module for performance
/refactor src/database/queries.py --focus performance

# Refactor for readability
/refactor complex_algorithm --focus readability

# Refactor with specific pattern
/refactor data_processor --pattern "repository pattern"
```

## Refactoring Target: $ARGUMENTS

**Target**: $ARGUMENTS
**Refactoring Scope**: Comprehensive code improvement with preserved functionality

### Step 1: Analysis and Planning

**Analyzing**: $ARGUMENTS for refactoring opportunities

#### Current State Assessment
1. **Code Quality Metrics**
   ```bash
   # Analyze current complexity
   radon cc "$ARGUMENTS" -a
   radon mi "$ARGUMENTS"
   
   # Check current style
   ruff check "$ARGUMENTS"
   mypy "$ARGUMENTS"
   ```

2. **Identify Issues**
   - Code complexity (cyclomatic complexity > 10)
   - Long functions (> 50 lines)
   - Repeated code patterns
   - Poor naming conventions
   - Missing type hints
   - Insufficient error handling

3. **Refactoring Goals**
   - 🎯 **Primary Goal**: [Main improvement target]
   - 🛡️ **Safety**: Preserve existing functionality
   - 🚀 **Performance**: Improve efficiency where possible
   - 📚 **Readability**: Enhance code clarity

### Step 2: Design Improved Structure

**Refactoring Plan for**: $ARGUMENTS

#### Before (Current Structure)
```python
# Current implementation of $ARGUMENTS
# TODO: Show current problematic code structure
def current_implementation():
    # Long, complex function
    # Mixed concerns
    # Poor error handling
    pass
```

#### After (Proposed Structure)
```python
# Refactored implementation of $ARGUMENTS
class RefactoredImplementation:
    """Improved implementation with separated concerns."""
    
    def __init__(self):
        self._validator = InputValidator()
        self._processor = DataProcessor()
        self._formatter = OutputFormatter()
    
    def execute(self, input_data: InputType) -> OutputType:
        """Main execution method with clear flow."""
        validated_data = self._validator.validate(input_data)
        processed_data = self._processor.process(validated_data)
        return self._formatter.format(processed_data)
```

### Step 3: Implementation

**Refactored Implementation of**: $ARGUMENTS

```python
from typing import Protocol, TypeVar, Generic, Optional
from dataclasses import dataclass
from abc import ABC, abstractmethod
import logging

# Type definitions
T = TypeVar('T')
U = TypeVar('U')

@dataclass
class ProcessingConfig:
    """Configuration for processing operations."""
    timeout: int = 30
    batch_size: int = 100
    retry_attempts: int = 3
    validate_input: bool = True

class RefactoredComponent(Generic[T, U]):
    """Refactored implementation of $ARGUMENTS."""
    
    def __init__(self, config: Optional[ProcessingConfig] = None):
        self._config = config or ProcessingConfig()
        self._logger = logging.getLogger(__name__)
    
    def execute(self, input_data: T) -> U:
        """Execute processing with improved error handling."""
        try:
            if self._config.validate_input:
                validated_data = self._validate_input(input_data)
            else:
                validated_data = input_data
            
            return self._process_with_retry(validated_data)
            
        except ValidationError as e:
            self._logger.error(f"Validation failed for $ARGUMENTS: {e}")
            raise ProcessingError(f"Invalid input: {e}") from e
        except Exception as e:
            self._logger.error(f"Unexpected error in $ARGUMENTS: {e}")
            raise ProcessingError(f"Processing failed: {e}") from e
    
    def _validate_input(self, data: T) -> T:
        """Validate input data."""
        # Input validation logic
        return data
    
    def _process_with_retry(self, data: T) -> U:
        """Process data with retry logic."""
        for attempt in range(self._config.retry_attempts):
            try:
                return self._core_processing(data)
            except RetryableError as e:
                if attempt == self._config.retry_attempts - 1:
                    raise
                self._logger.warning(f"Attempt {attempt + 1} failed, retrying: {e}")
    
    def _core_processing(self, data: T) -> U:
        """Core processing logic."""
        # Main processing implementation
        pass
```

### Step 4: Specific Refactoring Patterns

**Pattern-Based Refactoring for**: $ARGUMENTS

#### Extract Method Pattern
```python
# Before: Long method with multiple responsibilities
def process_user_data_before(user_data):
    # Validation (20 lines)
    # Processing (30 lines) 
    # Formatting (15 lines)
    # Logging (10 lines)
    pass

# After: Extracted methods with single responsibilities
class UserDataProcessor:
    def process_user_data(self, user_data: UserData) -> ProcessedData:
        """Main processing method."""
        validated_data = self._validate_user_data(user_data)
        processed_data = self._process_core_logic(validated_data)
        formatted_data = self._format_output(processed_data)
        self._log_processing_result(formatted_data)
        return formatted_data
    
    def _validate_user_data(self, data: UserData) -> UserData:
        """Validate user input data."""
        # Focused validation logic
        pass
    
    def _process_core_logic(self, data: UserData) -> ProcessedData:
        """Core business logic processing."""
        # Focused processing logic
        pass
```

#### Strategy Pattern for Conditionals
```python
# Before: Complex conditional logic
def process_payment_before(payment_type, amount):
    if payment_type == "credit_card":
        # Credit card processing logic
        pass
    elif payment_type == "paypal":
        # PayPal processing logic
        pass
    elif payment_type == "bank_transfer":
        # Bank transfer logic
        pass

# After: Strategy pattern
class PaymentProcessor(ABC):
    @abstractmethod
    def process(self, amount: float) -> PaymentResult:
        pass

class CreditCardProcessor(PaymentProcessor):
    def process(self, amount: float) -> PaymentResult:
        # Credit card specific logic
        pass

class PaymentService:
    def __init__(self):
        self._processors = {
            "credit_card": CreditCardProcessor(),
            "paypal": PayPalProcessor(),
            "bank_transfer": BankTransferProcessor(),
        }
    
    def process_payment(self, payment_type: str, amount: float) -> PaymentResult:
        processor = self._processors.get(payment_type)
        if not processor:
            raise ValueError(f"Unsupported payment type: {payment_type}")
        return processor.process(amount)
```

#### Repository Pattern for Data Access
```python
# Before: Direct database calls scattered throughout
def get_user_data_before(user_id):
    connection = get_db_connection()
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM users WHERE id = %s", (user_id,))
    # Direct SQL throughout the application

# After: Repository pattern
class UserRepository(ABC):
    @abstractmethod
    def get_by_id(self, user_id: int) -> Optional[User]:
        pass
    
    @abstractmethod
    def save(self, user: User) -> User:
        pass

class SQLUserRepository(UserRepository):
    def __init__(self, db_session: Session):
        self._session = db_session
    
    def get_by_id(self, user_id: int) -> Optional[User]:
        return self._session.query(User).filter(User.id == user_id).first()
    
    def save(self, user: User) -> User:
        self._session.add(user)
        self._session.commit()
        return user
```

### Step 5: Testing the Refactored Code

**Test Strategy for Refactored**: $ARGUMENTS

```python
import pytest
from unittest.mock import Mock, patch

class TestRefactored${ARGUMENTS^}:
    """Tests for refactored $ARGUMENTS."""
    
    def setup_method(self):
        """Set up test fixtures."""
        self.config = ProcessingConfig(
            timeout=10,
            retry_attempts=2,
            validate_input=True
        )
        self.processor = RefactoredComponent(self.config)
    
    def test_refactored_functionality_preserved(self):
        """Test that refactoring preserves original functionality."""
        # Test with same inputs as original
        input_data = create_test_input()
        result = self.processor.execute(input_data)
        
        # Should produce same output as original
        expected_result = get_expected_original_output()
        assert result == expected_result
    
    def test_improved_error_handling(self):
        """Test that error handling is improved."""
        invalid_input = create_invalid_input()
        
        with pytest.raises(ProcessingError) as exc_info:
            self.processor.execute(invalid_input)
        
        # Should have clear error message
        assert "Invalid input" in str(exc_info.value)
        assert exc_info.value.__cause__ is not None
    
    def test_retry_mechanism(self):
        """Test that retry mechanism works."""
        with patch.object(self.processor, '_core_processing') as mock_process:
            # First call fails, second succeeds
            mock_process.side_effect = [RetryableError("Temporary failure"), "success"]
            
            result = self.processor.execute("test_input")
            
            assert result == "success"
            assert mock_process.call_count == 2
    
    def test_performance_improvement(self):
        """Test that performance is improved or maintained."""
        import time
        
        large_input = create_large_test_input()
        
        start_time = time.time()
        result = self.processor.execute(large_input)
        execution_time = time.time() - start_time
        
        # Should be faster than or equal to original implementation
        assert execution_time <= get_original_benchmark_time()
        assert result is not None
```

### Step 6: Migration Strategy

**Migration Plan for**: $ARGUMENTS

#### Phase 1: Parallel Implementation
```python
# Keep original implementation
def original_$ARGUMENTS(input_data):
    # Original implementation
    pass

# Add new implementation
def refactored_$ARGUMENTS(input_data):
    processor = RefactoredComponent()
    return processor.execute(input_data)

# Feature flag for gradual rollout
def $ARGUMENTS(input_data):
    if feature_flags.use_refactored_implementation():
        return refactored_$ARGUMENTS(input_data)
    else:
        return original_$ARGUMENTS(input_data)
```

#### Phase 2: Validation
```python
def $ARGUMENTS_with_validation(input_data):
    # Run both implementations
    original_result = original_$ARGUMENTS(input_data)
    refactored_result = refactored_$ARGUMENTS(input_data)
    
    # Compare results
    if original_result != refactored_result:
        logger.warning(f"Results differ for $ARGUMENTS: {input_data}")
        # Send to monitoring system
        send_discrepancy_alert(original_result, refactored_result)
    
    # Return refactored result (with fallback)
    return refactored_result if refactored_result else original_result
```

#### Phase 3: Complete Migration
```python
# Remove original implementation
# Update all callers
# Remove feature flags
def $ARGUMENTS(input_data):
    processor = RefactoredComponent()
    return processor.execute(input_data)
```

### Step 7: Documentation and Monitoring

**Documentation Updates for**: $ARGUMENTS

#### Code Documentation
```python
class RefactoredComponent:
    """Refactored implementation of $ARGUMENTS.
    
    This implementation improves upon the original by:
    - Separating concerns into focused methods
    - Adding comprehensive error handling
    - Implementing retry logic for resilience
    - Improving type safety with generics
    - Enhancing testability through dependency injection
    
    Args:
        config: Configuration for processing behavior
    
    Example:
        >>> processor = RefactoredComponent()
        >>> result = processor.execute(input_data)
    """
```

#### Migration Documentation
```markdown
# Refactoring: $ARGUMENTS

## Changes Made
- **Complexity Reduction**: Cyclomatic complexity reduced from X to Y
- **Performance**: 15% improvement in average execution time
- **Maintainability**: Code split into focused, testable components
- **Error Handling**: Comprehensive exception handling with retry logic

## Breaking Changes
- None (backward compatible)

## Migration Guide
- No action required for existing callers
- New optional configuration parameter available
- Improved error messages may affect error handling code
```

## Success Metrics

**Measuring Refactoring Success for**: $ARGUMENTS

### Code Quality Metrics
- **Cyclomatic Complexity**: Reduced from X to Y
- **Lines of Code**: Organized into smaller, focused methods
- **Test Coverage**: Increased from X% to Y%
- **Type Coverage**: Improved with comprehensive type hints

### Performance Metrics
- **Execution Time**: [Before vs After]
- **Memory Usage**: [Before vs After]
- **Error Rate**: [Before vs After]
- **Recovery Time**: [Before vs After]

### Maintainability Metrics
- **Code Duplication**: Reduced by X%
- **Method Length**: Average reduced from X to Y lines
- **Documentation Coverage**: Improved to X%
- **Dependency Count**: [Before vs After]

## Documentation

Save refactoring details in:
- `/refactoring/refactor-${ARGUMENTS//\//-}-[date].md` - Complete refactoring log
- `/docs/architecture/` - Updated architecture documentation
- `/tests/` - Enhanced test suite

**Refactoring Complete**: $ARGUMENTS is now more maintainable, performant, and robust!