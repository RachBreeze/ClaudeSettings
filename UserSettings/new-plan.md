Create a new planning document following these steps:

1. **Get today's date** in YYYY-MM-DD format

2. **Ask the user** for a brief description (2-5 words) of what they're planning

3. **Create the filename**: `plan-YYYY-MM-DD-description.md`
   - Convert description to lowercase
   - Replace spaces with hyphens
   - Example: "User Authentication" → `plan-2025-11-30-user-authentication.md`

4. **Ensure directory exists**:
   ```bash
   mkdir -p ./docs/plans
   ```

5. **Create the file** at `./docs/plans/plan-YYYY-MM-DD-description.md` with this template:

```markdown
# Plan: [Title from user's description]

**Created**: [Today's date]
**Status**: Draft
**Priority**: Medium

## Objective
[Ask user: What are we trying to achieve?]

## Background
[Ask user: Why are we doing this? What's the context?]

## Current State
[Ask user: What exists today?]

## Proposed Approach
[Ask user: How should we solve this?]

## Implementation Steps
1. [ ] [First step]
2. [ ] [Second step]
3. [ ] [Third step]

## Testing Strategy
[How will we verify this works?]

## Success Criteria
- [ ] [Criterion 1]
- [ ] [Criterion 2]

## Dependencies
[What needs to happen first?]

## Risks & Mitigation
| Risk | Impact | Mitigation |
|------|--------|------------|
| | | |

## Timeline
[Estimated effort]

## Notes
[Additional context]
```

6. **Confirm**: Show the file path and ask if they want to fill it in now or later

**Example interaction**:
- User types: `/new-plan`
- I ask: "What would you like to plan? (brief description)"
- User responds: "Database refactoring"
- I create: `./docs/plans/plan-2025-11-30-database-refactoring.md`
- I confirm: "Created plan at docs/plans/plan-2025-11-30-database-refactoring.md. Would you like to fill it in now?"
