# Claude Code Global Instructions

## File Organization & Naming Standards

### Directory Structure for All Projects
```
project-root/
├── docs/
│   ├── plans/          # All planning documents
│   ├── architecture/   # Architecture decisions & diagrams
│   └── api/           # API documentation
├── src/               # Source code
├── tests/             # Test files
└── tmp/              # Temporary/scratch files
```

### Save Location Rules (CRITICAL - FOLLOW ALWAYS)

**Plans & Planning Documents**
- Location: `./docs/plans/`
- Create directory if it doesn't exist
- Never save plans to project root
- Subdirectories allowed: `./docs/plans/features/`, `./docs/plans/bugfixes/`, etc.

**Documentation**
- Location: `./docs/`
- Architecture: `./docs/architecture/`
- API docs: `./docs/api/`
- User guides: `./docs/guides/`

**Code Files**
- Follow existing project structure
- New features: Create appropriate subdirectory in `./src/`
- Never mix code and documentation

**Temporary Work**
- Location: `./tmp/` or `./scratch/`
- Add to .gitignore automatically

### Naming Convention Rules (CRITICAL - FOLLOW ALWAYS)

**Plan Files**
- Format: `plan-YYYY-MM-DD-short-description.md`
- Examples:
  - `plan-2025-11-30-user-authentication.md`
  - `plan-2025-11-30-refactor-database-layer.md`
  - `plan-2025-11-30-fix-login-bug.md`
- Always use lowercase
- Use hyphens (kebab-case), not underscores
- Keep description brief but clear (2-5 words)
- Always include today's date

**Documentation Files**
- Format: `descriptive-name.md`
- Examples:
  - `database-schema.md`
  - `api-authentication.md`
  - `deployment-guide.md`
- Use kebab-case
- Be descriptive but concise

**Code Files**
- Follow language conventions:
  - **JavaScript/TypeScript**: camelCase for variables/functions, PascalCase for classes
  - **Python**: snake_case for files and functions, PascalCase for classes
  - **Go**: camelCase with package names lowercase
  - **Rust**: snake_case for most items
- Always include appropriate file extension

### Plan File Template

When creating any plan, use this structure:

```markdown
# Plan: [Clear, Descriptive Title]

**Created**: YYYY-MM-DD
**Status**: Draft | In Progress | Completed | Archived
**Priority**: Low | Medium | High | Critical

## Objective
[What are we trying to achieve? Be specific and measurable.]

## Background
[Why are we doing this? What's the context?]

## Current State
[Where are we now? What exists today?]

## Proposed Approach
[How will we solve this? Include:
- Technical approach
- Architecture changes
- Libraries/tools needed
- Potential challenges
]

## Implementation Steps
1. [ ] Step 1 with specific details
2. [ ] Step 2 with specific details
3. [ ] Step 3 with specific details

## Testing Strategy
[How will we verify this works?]

## Success Criteria
- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Criterion 3

## Dependencies
[What needs to happen first? What are we waiting on?]

## Risks & Mitigation
| Risk | Impact | Mitigation |
|------|--------|------------|
| Risk 1 | High | How we'll handle it |

## Timeline
[Estimated effort and key milestones]

## Notes
[Additional context, links, references]
```

## Automatic Directory Creation

When saving files:
1. Check if target directory exists
2. If not, create it with `mkdir -p`
3. Confirm creation with user
4. Then save the file

Example:
```bash
mkdir -p ./docs/plans
# Then save plan-2025-11-30-feature-name.md
```

## Coding Standards

### Code Quality
- Write self-documenting code with clear names
- Add comments for complex logic, not obvious code
- Follow DRY (Don't Repeat Yourself)
- Keep functions small and focused (single responsibility)

### Error Handling
- Always include proper error handling
- Use try-catch/try-except appropriately
- Log errors with context
- Provide user-friendly error messages
- Never silently fail

### Testing
- Write tests for new functionality
- Aim for high test coverage (>80%)
- Use descriptive test names: `test_user_login_with_invalid_credentials`
- Include edge cases and error conditions

### Documentation
- Document public APIs and interfaces
- Include usage examples in docstrings
- Update README when adding features
- Keep documentation near the code it describes

## Web Accessibility - WCAG 2.2 AA Compliance (CRITICAL)

### MANDATORY: All Web Code Must Be WCAG 2.2 AA Compliant

**This is NON-NEGOTIABLE for ALL web development (HTML, CSS, JavaScript, React, etc.)**

When creating ANY web content, you MUST follow these accessibility requirements:

### 1. Perceivable - Information must be presentable to users

#### Text Alternatives (Level A)
- **ALWAYS** provide `alt` text for images
  - Decorative images: `alt=""`
  - Informative images: Descriptive alt text
  - Complex images: Detailed description nearby
- **ALWAYS** provide text alternatives for non-text content
- Icons must have accessible labels (aria-label or sr-only text)

```html
<!-- ✅ CORRECT -->
<img src="logo.png" alt="Company Name - Home">
<img src="decorative-line.png" alt="">
<button aria-label="Close dialog">×</button>

<!-- ❌ WRONG -->
<img src="logo.png">
<button>×</button>
```

#### Color Contrast (Level AA) - CRITICAL
- **Text contrast ratios:**
  - Normal text (< 18pt): minimum 4.5:1
  - Large text (≥ 18pt or ≥ 14pt bold): minimum 3:1
  - UI components and graphics: minimum 3:1
- **NEVER rely on color alone** to convey information
- **ALWAYS** test contrast ratios before using colors

```css
/* ✅ CORRECT - High contrast */
.text {
  color: #333333; /* Dark gray */
  background: #ffffff; /* White */
  /* Contrast ratio: 12.6:1 */
}

.button {
  color: #ffffff;
  background: #0066cc; /* Meets 4.5:1 */
}

/* ❌ WRONG - Poor contrast */
.text {
  color: #999999; /* Light gray */
  background: #ffffff; /* White */
  /* Contrast ratio: 2.8:1 - FAILS */
}
```

#### Adaptable Content (Level A)
- Use semantic HTML elements
- Proper heading hierarchy (h1 → h2 → h3, no skipping)
- Meaningful sequence and reading order
- Don't use presentation for structure

```html
<!-- ✅ CORRECT -->
<header>
  <h1>Main Page Title</h1>
</header>
<main>
  <article>
    <h2>Article Title</h2>
    <h3>Section Title</h3>
    <p>Content...</p>
  </article>
</main>

<!-- ❌ WRONG -->
<div class="header">
  <div class="big-text">Main Page Title</div>
</div>
```

### 2. Operable - User interface must be operable

#### Keyboard Accessible (Level A) - CRITICAL
- **ALL functionality MUST work with keyboard only**
- **ALWAYS** ensure logical tab order
- **ALWAYS** make focus visible
- No keyboard traps

```html
<!-- ✅ CORRECT - Keyboard accessible -->
<button onclick="openMenu()">Menu</button>
<a href="#main-content" class="skip-link">Skip to main content</a>

<!-- ❌ WRONG - Not keyboard accessible -->
<div onclick="openMenu()">Menu</div>
```

```css
/* ✅ CORRECT - Visible focus */
button:focus,
a:focus {
  outline: 2px solid #0066cc;
  outline-offset: 2px;
}

/* ❌ WRONG - Removes focus indicator */
button:focus {
  outline: none;
}
```

#### Enough Time (Level A)
- **NEVER** use auto-advancing carousels without pause/stop
- Provide controls to extend time limits
- Warn users before sessions expire

```html
<!-- ✅ CORRECT - User controls -->
<div class="carousel">
  <button aria-label="Pause carousel">⏸</button>
  <button aria-label="Play carousel">▶</button>
</div>
```

#### Seizures and Physical Reactions (Level A)
- **NEVER** flash more than 3 times per second
- Avoid patterns that could cause seizures

#### Navigable (Level AA)
- **ALWAYS** provide skip links
- **ALWAYS** use descriptive page titles
- **ALWAYS** use descriptive link text (no "click here")
- Provide multiple ways to find pages (sitemap, search, nav)
- **ALWAYS** show current location (breadcrumbs, active nav)

```html
<!-- ✅ CORRECT -->
<a href="/products">View our products</a>
<a href="/report.pdf">Download 2024 Annual Report (PDF, 2MB)</a>

<nav aria-label="Breadcrumb">
  <ol>
    <li><a href="/">Home</a></li>
    <li><a href="/products">Products</a></li>
    <li aria-current="page">Product Details</li>
  </ol>
</nav>

<!-- ❌ WRONG -->
<a href="/products">Click here</a>
<a href="/report.pdf">Download</a>
```

#### Focus Appearance (Level AA - NEW in WCAG 2.2)
- Focus indicators must be visible and clear
- Minimum 2px outline or equivalent
- High contrast focus states

### 3. Understandable - Information must be understandable

#### Readable (Level AA)
- **ALWAYS** specify language: `<html lang="en">`
- Mark language changes: `<span lang="fr">Bonjour</span>`
- Use clear, simple language when possible

#### Predictable (Level A)
- Navigation must be consistent across pages
- Components behave consistently
- **NEVER** change context on focus
- **NEVER** change context on input without warning

```html
<!-- ✅ CORRECT - Warns user -->
<select onchange="if(confirm('Navigate to new page?')) location.href=this.value">
  <option>Select page...</option>
</select>

<!-- ❌ WRONG - Auto-navigates on change -->
<select onchange="location.href=this.value">
```

#### Input Assistance (Level AA)
- **ALWAYS** label form inputs properly
- **ALWAYS** provide error identification
- **ALWAYS** provide error suggestions
- **ALWAYS** prevent errors (confirmation for critical actions)

```html
<!-- ✅ CORRECT - Proper labels and errors -->
<label for="email">Email Address</label>
<input 
  type="email" 
  id="email" 
  name="email"
  aria-describedby="email-error"
  aria-invalid="true"
  required
>
<span id="email-error" class="error">
  Please enter a valid email address (example: user@domain.com)
</span>

<!-- ❌ WRONG - No label -->
<input type="email" placeholder="Email">
```

#### Consistent Help (Level A - NEW in WCAG 2.2)
- Help mechanisms must be in consistent locations
- Contact information should be easy to find

#### Redundant Entry (Level A - NEW in WCAG 2.2)
- Don't make users re-enter information
- Auto-fill when possible
- Allow copy/paste

### 4. Robust - Content must work with assistive technologies

#### Compatible (Level A)
- **ALWAYS** use valid HTML
- **ALWAYS** use proper ARIA attributes
- **ALWAYS** ensure unique IDs
- **ALWAYS** test with screen readers

```html
<!-- ✅ CORRECT - Proper ARIA -->
<nav aria-label="Main navigation">
  <ul>
    <li><a href="/" aria-current="page">Home</a></li>
    <li><a href="/about">About</a></li>
  </ul>
</nav>

<button 
  aria-expanded="false" 
  aria-controls="menu"
  aria-label="Open navigation menu"
>
  Menu
</button>

<!-- ❌ WRONG - Missing ARIA -->
<div class="nav">
  <div class="menu-button">Menu</div>
</div>
```

### WCAG 2.2 Specific Requirements

#### Focus Not Obscured (Minimum) - Level AA (NEW)
- When a component receives focus, it must not be entirely hidden
- At least part of the focus indicator must be visible

#### Focus Not Obscured (Enhanced) - Level AAA (NEW)
- When a component receives focus, no part should be hidden by other content

#### Dragging Movements (Level AA - NEW)
- Provide alternatives to dragging (buttons, keyboard)
- **NEVER** require dragging as the only way to operate

```html
<!-- ✅ CORRECT - Provides alternatives to drag -->
<div class="sortable-list">
  <div class="item" draggable="true">
    Item 1
    <button aria-label="Move up">↑</button>
    <button aria-label="Move down">↓</button>
  </div>
</div>
```

#### Target Size (Minimum) - Level AA (NEW)
- Interactive elements must be at least 24×24 CSS pixels
- Exceptions: inline links, browser controls, essential sizing

```css
/* ✅ CORRECT - Adequate touch target */
button {
  min-width: 44px;
  min-height: 44px;
  padding: 12px 16px;
}

/* ❌ WRONG - Too small */
button {
  width: 16px;
  height: 16px;
}
```

### Accessibility Testing Checklist

Before committing any web code, verify:

- [ ] All images have appropriate alt text
- [ ] Color contrast meets 4.5:1 (normal text) or 3:1 (large text)
- [ ] All functionality works with keyboard only
- [ ] Focus indicators are visible and clear
- [ ] No keyboard traps exist
- [ ] Form inputs have labels
- [ ] Error messages are clear and helpful
- [ ] Heading hierarchy is logical (no skipped levels)
- [ ] Language is specified
- [ ] ARIA attributes are used correctly
- [ ] Interactive elements are at least 24×24 CSS pixels
- [ ] Page works with screen reader (test with NVDA, JAWS, or VoiceOver)
- [ ] HTML validates (W3C validator)

### Accessibility Tools to Use

**Before committing, test with:**
- **axe DevTools** (browser extension) - Automated testing
- **WAVE** (browser extension) - Visual accessibility testing
- **Lighthouse** (Chrome DevTools) - Accessibility audit
- **Contrast Checker** - WebAIM or similar tool
- **Screen Reader** - NVDA (Windows), JAWS (Windows), VoiceOver (Mac/iOS)
- **Keyboard Only** - Unplug mouse and test

### Common Accessibility Mistakes to AVOID

❌ **Never do these:**
- Remove focus outlines (`outline: none` without replacement)
- Use `<div>` or `<span>` as buttons
- Rely only on color to convey meaning
- Use placeholder text as labels
- Auto-play videos or audio
- Use `tabindex` values greater than 0
- Create keyboard traps
- Use `<br>` for spacing (use CSS margins)
- Use empty links or buttons
- Skip heading levels
- Use non-descriptive link text ("click here", "more")

### Semantic HTML Elements - Use These

**Always prefer semantic elements:**

```html
<!-- ✅ Use semantic elements -->
<header>, <nav>, <main>, <article>, <section>, <aside>, <footer>
<button>, <a>, <form>, <label>, <input>
<h1> through <h6>, <p>, <ul>, <ol>, <li>
<table>, <thead>, <tbody>, <th>, <td>

<!-- ❌ Don't use generic divs for these -->
<div class="header">
<div class="button" onclick="...">
<div class="link">
```

### ARIA Landmark Roles

```html
<!-- ✅ CORRECT - Clear landmarks -->
<header role="banner">
<nav role="navigation" aria-label="Main">
<main role="main">
<aside role="complementary">
<footer role="contentinfo">
<form role="search">
```

### Forms - Accessibility Requirements

```html
<!-- ✅ CORRECT - Accessible form -->
<form>
  <fieldset>
    <legend>Personal Information</legend>
    
    <label for="first-name">
      First Name <span aria-label="required">*</span>
    </label>
    <input 
      type="text" 
      id="first-name" 
      name="firstName"
      required
      aria-required="true"
      aria-describedby="first-name-hint"
    >
    <span id="first-name-hint" class="hint">
      Enter your legal first name
    </span>
  </fieldset>
  
  <button type="submit">Submit Form</button>
</form>
```

### Accessibility Statement

When creating websites, include an accessibility statement:
- Location: `/accessibility` or in footer
- Contact method for reporting issues
- Conformance level (WCAG 2.2 AA)
- Known limitations

---

## CRITICAL REMINDER

**Every single web component, page, or application you create MUST be WCAG 2.2 AA compliant.**

This is not optional. This is not a suggestion. This is a requirement.

If you're unsure about any accessibility requirement, ASK before implementing.

Test EVERY web feature with:
1. Keyboard only (no mouse)
2. Screen reader
3. Automated tools (axe, WAVE)
4. Color contrast checker

Accessibility is not an afterthought - it's built in from the start.

## Git Workflow

### Commit Messages
- Format: `type: description`
- Types: `feat`, `fix`, `docs`, `refactor`, `test`, `chore`
- Examples:
  - `feat: add user authentication endpoint`
  - `fix: resolve memory leak in cache service`
  - `docs: update API documentation for v2`

### Before Committing
1. Check `git status`
2. Review changes with `git diff`
3. Stage files intentionally
4. Write clear commit message
5. Push to appropriate branch

## Command Behavior

### File Operations
- Always confirm before overwriting existing files
- Show file path after creation
- Verify file was created successfully

### Package Installation
- Ask before installing new dependencies
- Explain why the dependency is needed
- Check if lighter alternatives exist
- Document in requirements.txt or package.json

### Bash Commands
- Explain what command will do before running it
- Use safe commands (avoid `rm -rf` unless explicitly requested)
- Check command output for errors
- Confirm destructive operations

## Communication Style

### Responses
- Be clear and concise
- Provide context for decisions
- Offer alternatives when appropriate
- Explain trade-offs

### Code Explanations
- Start with high-level overview
- Then dive into details
- Use examples
- Link to relevant documentation

### Error Messages
- Be specific about what went wrong
- Suggest how to fix it
- Provide relevant context

## Security Practices

### Sensitive Data
- Never log passwords, API keys, or tokens
- Don't commit secrets to version control
- Use environment variables for configuration
- Add .env files to .gitignore

### Code Security
- Validate and sanitize all user input
- Use parameterized queries (prevent SQL injection)
- Keep dependencies updated
- Follow principle of least privilege

## Performance Considerations

- Profile before optimizing
- Document performance-critical sections
- Consider algorithmic complexity
- Cache when appropriate
- Be mindful of memory usage

## When in Doubt

1. **Ask for clarification** rather than making assumptions
2. **Check existing code** for patterns to follow
3. **Suggest options** with pros/cons
4. **Default to safety** over convenience
5. **Document decisions** in comments or plans

---

## Quick Reference

### Common Tasks

**Create a new plan**:
1. Get today's date
2. Ask for brief description
3. Create `docs/plans/plan-YYYY-MM-DD-description.md`
4. Use plan template above
5. Confirm file created

**Add new feature**:
1. Create plan first
2. Review with user
3. Implement in appropriate directory
4. Write tests
5. Update documentation

**Fix a bug**:
1. Create plan if not trivial
2. Reproduce the issue
3. Fix with tests
4. Verify fix works
5. Document what was wrong

### File Naming Cheat Sheet

| File Type | Format | Example |
|-----------|--------|---------|
| Plan | `plan-YYYY-MM-DD-desc.md` | `plan-2025-11-30-api-refactor.md` |
| Docs | `kebab-case.md` | `database-schema.md` |
| Python | `snake_case.py` | `user_service.py` |
| JavaScript | `camelCase.js` | `userService.js` |
| Component | `PascalCase.jsx` | `UserProfile.jsx` |
| Test | `test_feature.py` | `test_user_login.py` |

### Directory Cheat Sheet

| Content | Location |
|---------|----------|
| Plans | `./docs/plans/` |
| Architecture | `./docs/architecture/` |
| API Docs | `./docs/api/` |
| Source | `./src/` |
| Tests | `./tests/` |
| Temp | `./tmp/` |
