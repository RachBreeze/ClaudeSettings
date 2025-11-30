# Claude Code Configuration Guide

## Quick Setup Steps

### 1. Create Global Configuration Directory
```bash
mkdir -p ~/.claude
mkdir -p ~/.claude/commands
```

### 2. Set Up Global Settings File

Create or edit `~/.claude/settings.json`:

```bash
nano ~/.claude/settings.json
```

Add this configuration:

```json
{
  "model": "claude-sonnet-4-5-20250929",
  "permissions": {
    "allowedTools": [
      "Read",
      "Write",
      "Bash"
    ]
  },
  "autoUpdate": true
}
```

### 3. Create Global Instructions File

Create `~/.claude/CLAUDE.md`:

```bash
nano ~/.claude/CLAUDE.md
```

Add your global preferences:

```markdown
# Claude Code Global Instructions

## File Organization & Naming

### Save Locations
- Plans: Save all planning documents to `./docs/plans/`
- Documentation: Save to `./docs/`
- Code files: Follow project structure
- Temporary files: Use `./tmp/`

### Naming Conventions
- **Plans**: Use format `plan-YYYY-MM-DD-description.md`
  - Example: `plan-2025-11-30-api-refactor.md`
- **Documentation**: Use kebab-case with descriptive names
  - Example: `database-schema-overview.md`
- **Code files**: Follow language-specific conventions
  - JavaScript/TypeScript: camelCase for files
  - Python: snake_case for files
  - Always include file extension

### File Headers
Include these headers in plan files:
```
# Plan: [Description]
Created: YYYY-MM-DD
Status: [Draft/In Progress/Completed]
```

## Coding Standards

### General Principles
- Write clear, self-documenting code
- Include comments for complex logic
- Use meaningful variable names
- Follow DRY (Don't Repeat Yourself)

### Error Handling
- Always include proper error handling
- Log errors with context
- Fail gracefully with user-friendly messages

### Testing
- Write tests for new functionality
- Aim for high test coverage
- Use descriptive test names

## Command Preferences

### Git Workflow
- Always check git status before committing
- Use descriptive commit messages
- Format: `type: description` (e.g., `feat: add user authentication`)

### Package Management
- Ask before installing new dependencies
- Prefer stable, well-maintained packages
- Document why dependencies are needed
```

## Project-Specific Configuration

### 4. Set Up Project Configuration

In your project directory, create `.claude/settings.local.json`:

```bash
mkdir -p .claude
nano .claude/settings.local.json
```

Add project-specific settings:

```json
{
  "permissions": {
    "allowedTools": [
      "Read",
      "Write(src/**)",
      "Write(docs/**)",
      "Bash(git *)",
      "Bash(npm *)",
      "Bash(python *)"
    ],
    "deny": [
      "Write(.env*)",
      "Write(*.secret.*)",
      "Bash(rm -rf *)",
      "Bash(sudo *)"
    ]
  }
}
```

### 5. Create Project Instructions

Create `.claude/CLAUDE.md` in your project:

```markdown
# Project: [Your Project Name]

## Project Structure
```
project-root/
├── docs/
│   ├── plans/          # All planning documents go here
│   ├── architecture/   # Architecture decisions
│   └── api/           # API documentation
├── src/               # Source code
├── tests/             # Test files
└── tmp/              # Temporary files
```

## This Project's Naming Rules

### Plans Directory Structure
- Feature plans: `docs/plans/features/plan-YYYY-MM-DD-feature-name.md`
- Bug fixes: `docs/plans/bugfixes/plan-YYYY-MM-DD-bug-description.md`
- Refactoring: `docs/plans/refactor/plan-YYYY-MM-DD-refactor-area.md`

### Automatically Create Directory Structure
When saving plans, create the appropriate subdirectory if it doesn't exist.

## Tech Stack Specifics
- Language: [e.g., Python 3.11, TypeScript 5.x]
- Framework: [e.g., FastAPI, React]
- Database: [e.g., PostgreSQL]
- Testing: [e.g., pytest, Jest]

## Custom Project Conventions
[Add any project-specific rules here]
```

## Custom Commands

### 6. Create Custom Slash Commands

Create a custom command for creating plans:

```bash
nano ~/.claude/commands/new-plan.md
```

Add this content:

```markdown
Create a new plan document with the following:

1. Check today's date and create filename: `docs/plans/plan-YYYY-MM-DD-[brief-description].md`
2. Create the docs/plans directory if it doesn't exist
3. Use this template:

```
# Plan: [Title]

**Created**: [Today's Date]
**Status**: Draft
**Author**: [Your Name or leave blank]

## Objective
[What are we trying to achieve?]

## Background
[Why are we doing this?]

## Approach
[How will we do it?]

## Tasks
- [ ] Task 1
- [ ] Task 2
- [ ] Task 3

## Success Criteria
[How do we know we're done?]

## Notes
[Additional context]
```

Ask me for the plan title and description, then create the file.
```

Create a command for reviewing code:

```bash
nano ~/.claude/commands/code-review.md
```

```markdown
Review the specified code for:

1. **Code Quality**
   - Clear variable and function names
   - Proper error handling
   - Code organization and structure

2. **Best Practices**
   - Following language-specific conventions
   - Security considerations
   - Performance implications

3. **Documentation**
   - Adequate comments
   - Function/class documentation
   - README updates if needed

4. **Testing**
   - Test coverage
   - Edge cases handled

Provide specific, actionable feedback with examples.
```

## Usage Examples

### Starting Claude Code with Custom Directory

```bash
# Start in a specific project
cd /path/to/your/project
claude

# Or specify workspace explicitly
claude -w /path/to/your/project

# Add additional directories during session
claude --add-dir /path/to/shared/libraries
```

### Using Custom Commands

```bash
# In a Claude Code session
/new-plan
/code-review
```

### Checking Your Configuration

```bash
# Check current settings
/status

# View configuration
/config

# Switch models during session
/model opus
/model sonnet
```

## Environment Variables

You can also set these environment variables in your `~/.bashrc` or `~/.zshrc`:

```bash
# Add to ~/.bashrc or ~/.zshrc
export ANTHROPIC_MODEL="claude-sonnet-4-5-20250929"
export ANTHROPIC_API_KEY="your-api-key-here"  # If using API

# Reload your shell
source ~/.bashrc  # or source ~/.zshrc
```

## Advanced: Hooks for Automated Actions

Create a hook to organize files after creation:

In `~/.claude/settings.json`, add:

```json
{
  "hooks": {
    "afterWrite": "echo 'File created: ${file}'"
  }
}
```

## Troubleshooting

### Configuration Not Loading
```bash
# Check if file exists
ls -la ~/.claude/

# Verify JSON is valid
cat ~/.claude/settings.json | python -m json.tool

# Restart Claude Code
# Exit current session and start fresh
claude
```

### Plans Saving to Wrong Location
- Check your CLAUDE.md file is in the right location
- Verify directory paths are absolute or relative to project root
- Use `/status` to see current configuration

### Permission Denied Errors
```bash
# Fix permissions on config directory
chmod -R 755 ~/.claude/
```

## Next Steps

1. **Test your setup**:
   ```bash
   claude
   /status
   /new-plan
   ```

2. **Customize further**: Edit CLAUDE.md files to match your exact workflow

3. **Share with team**: Commit `.claude/CLAUDE.md` to version control for team-wide standards

4. **Create more commands**: Add custom commands for common tasks

## Resources

- Official Docs: https://code.claude.com/docs
- Settings Reference: `~/.claude/settings.json`
- Global Instructions: `~/.claude/CLAUDE.md`
- Project Instructions: `.claude/CLAUDE.md`
- Custom Commands: `~/.claude/commands/*.md`

---

**Quick Reference Card**

| Task | Command |
|------|---------|
| Start with custom workspace | `claude -w /path` |
| Add directory mid-session | `/add-dir /path` |
| Create new plan | `/new-plan` |
| Check current model | `/status` |
| Switch model | `/model opus` or `/model sonnet` |
| View config | `/config` |
| List custom commands | `/help` |
