# Quick Fix Common Issues

Rapidly fix common problems that come up.

## Common Issues & Fixes

1. **Import Errors**
   - Check virtual environment is activated
   - Run `uv sync` to update dependencies
   - Verify file paths are correct

2. **Connection Problems**
   - Check `.env` file has correct values
   - Test external connections separately
   - Verify authentication credentials

3. **Application Not Starting**
   - Check for error messages in logs
   - Verify all required services are running
   - Try restarting the application

4. **Code Quality Issues**
   ```bash
   # Quick formatting fix
   ruff check --fix
   
   # Type checking
   mypy .
   
   # Run tests
   pytest
   ```

5. **Environment Issues**
   ```bash
   # Recreate virtual environment
   rm -rf .venv
   uv venv
   source .venv/bin/activate
   uv sync
   ```

6. **Git Issues**
   ```bash
   # Check status
   git status
   
   # Reset changes
   git checkout -- .
   
   # Clean untracked files
   git clean -fd
   ```

## Quick Diagnostics
- Check logs for error messages
- Verify environment variables
- Test individual components
- Check network connectivity
- Validate configuration files

Keep it simple - most issues have simple fixes!