# 🚀 QUICK START - Claude Code Configuration

## ⚡ 30-Second Setup

```bash
chmod +x install.sh && ./install.sh
```

**Done!** Claude Code now has:
- ✅ Custom save locations
- ✅ Standardized naming
- ✅ **WCAG 2.2 AA compliance enforced**
- ✅ Custom commands
- ✅ Security protections

---

## 📁 File Structure After Install

```
~/.claude/
├── settings.json              # Model & permissions config
├── CLAUDE.md                  # Global instructions + WCAG rules
├── WCAG-quick-reference.md   # Accessibility quick guide
└── commands/
    ├── new-plan.md           # /new-plan command
    └── accessible-component.md  # /accessible-component command
```

---

## 🎯 What You Get

### 1. Automatic Plan Organization
```
When you create plans, they go to:
./docs/plans/plan-2025-11-30-your-description.md
                ↑           ↑
            Auto date    Your input
```

### 2. WCAG 2.2 AA Compliance (MANDATORY)
```
Every web component automatically includes:
✅ Alt text for images
✅ 4.5:1 color contrast
✅ Keyboard navigation
✅ Screen reader support
✅ Focus indicators
✅ Form labels
✅ ARIA attributes
✅ Semantic HTML
```

### 3. GitHub-Compatible Mermaid Diagrams (MANDATORY)
```
Every Mermaid diagram automatically uses:
✅ ```mermaid fence format
✅ Proper syntax (tested)
✅ GitHub compatibility
✅ Clear, descriptive labels
```

### 4. Custom Commands
```
/new-plan              → Create properly named plan
/accessible-component  → Create WCAG-compliant web code
/create-mermaid        → Create GitHub-compatible diagram
/status               → Check configuration
```

---

## 🌐 Web Development Rules (CRITICAL)

**Before writing ANY web code:**

### The 5-Minute Pre-Code Checklist
1. ❓ Will this work with keyboard only?
2. ❓ What colors will I use? (Check contrast!)
3. ❓ Do all images have alt text?
4. ❓ Are all inputs labeled?
5. ❓ Can screen readers use this?

### The 3-Minute Pre-Commit Test
1. ⌨️ Tab through with keyboard (no mouse)
2. 🔍 Run axe DevTools
3. 🎨 Check contrast with WebAIM

**If ANY test fails → Fix before committing!**

---

## 📊 Mermaid Diagram Rules (CRITICAL)

**Before creating ANY Mermaid diagram:**

### The ONE Rule to Remember
```
ALWAYS use ```mermaid fence format
NEVER use HTML divs or wrong tags
```

### The 2-Minute Pre-Commit Test
1. 📝 Check fence format: \`\`\`mermaid
2. 🧪 Test on https://mermaid.live/
3. ✅ Verify no syntax errors

**If ANY test fails → Fix before committing!**

---

## 📖 Essential Files

| File | When to Use |
|------|-------------|
| `README.md` | Start here - complete overview |
| `WCAG-quick-reference.md` | Before ANY web development |
| `mermaid-quick-reference.md` | Before ANY diagram creation |
| `CLAUDE.md` | To see all rules Claude follows |
| `claude-code-setup-guide.md` | Detailed configuration guide |

---

## 🎓 Your First 4 Tasks

### Task 1: Create Your First Plan (2 minutes)
```bash
claude           # Start Claude Code
/new-plan        # Create a plan
# Enter: "test my setup"
# Result: docs/plans/plan-2025-11-30-test-my-setup.md
```

### Task 2: Create an Accessible Button (5 minutes)
```bash
/accessible-component
# Say: "I need a button"
# You'll get: WCAG-compliant button with docs
# Test it with keyboard and axe DevTools
```

### Task 3: Create a Mermaid Diagram (3 minutes)
```bash
/create-mermaid
# Say: "I need a flowchart"
# You'll get: GitHub-compatible diagram
# Verify on https://mermaid.live/
```

### Task 4: Verify Everything Works (3 minutes)
```bash
/status          # Check config loaded
cat ~/.claude/CLAUDE.md | head -50  # See rules
ls docs/plans/   # Verify plan was created
```

---

## 🆘 Quick Troubleshooting

### Config Not Working?
```bash
# Reinstall
./install.sh

# Check files
ls -la ~/.claude/
```

### Web Code Not Accessible?
```bash
# Use the command
/accessible-component

# Or remind Claude
"This must be WCAG 2.2 AA compliant"
```

### Plans Going to Wrong Place?
```bash
# Check CLAUDE.md is installed
cat ~/.claude/CLAUDE.md | grep "Save Location"

# Restart Claude Code
exit
claude
```

---

## 🎯 Success Indicators

You're all set when:

✅ `/new-plan` creates files in `docs/plans/`
✅ Plans are named `plan-YYYY-MM-DD-description.md`
✅ Web components have proper alt text
✅ Colors meet 4.5:1 contrast
✅ Everything works with keyboard
✅ axe DevTools shows no errors
✅ Mermaid diagrams use \`\`\`mermaid fence
✅ Diagrams render on mermaid.live

---

## 📚 Learn More

**Accessibility:**
- Read `WCAG-quick-reference.md` (15 min read)
- Download axe DevTools browser extension
- Test with NVDA screen reader (free)

**Mermaid Diagrams:**
- Read `mermaid-quick-reference.md` (10 min read)
- Bookmark https://mermaid.live/
- Practice with different diagram types

**Configuration:**
- Edit `~/.claude/CLAUDE.md` for global rules
- Add files to `~/.claude/commands/` for custom commands
- Modify `~/.claude/settings.json` for permissions

---

## 🔥 Pro Tips

1. **Always start web tasks with:** `/accessible-component`
2. **Keep contrast checker open:** https://webaim.org/resources/contrastchecker/
3. **Install axe DevTools:** Essential for every commit
4. **Test with keyboard first:** Catches 80% of issues
5. **Read WCAG reference:** Bookmark `WCAG-quick-reference.md`
6. **Always use /create-mermaid:** For GitHub-compatible diagrams
7. **Test on mermaid.live:** Before committing any diagram
8. **Keep Mermaid simple:** 5-15 nodes is ideal

---

## ♿ The Golden Rules

```
1. Every image → alt text
2. Every input → label
3. Every color → verify contrast
4. Every feature → keyboard test
5. Every commit → axe DevTools
6. Every component → screen reader test
7. Every diagram → ```mermaid fence
8. Every Mermaid → test on mermaid.live
```

---

## 🎉 You're Ready!

```bash
# Start coding
claude

# Create accessible components
/accessible-component

# Create diagrams
/create-mermaid

# Build amazing, accessible things! 🚀
```

**Remember:** Accessibility is built in, not bolted on.

**Remember:** Mermaid diagrams must render on GitHub.

---

**Quick Links:**
- 📖 Full Guide: `README.md`
- ♿ Accessibility: `WCAG-quick-reference.md`
- 📊 Mermaid: `mermaid-quick-reference.md`
- ⚙️ All Rules: `CLAUDE.md`
- 🛠️ Detailed Setup: `claude-code-setup-guide.md`

**You've got this! Happy coding! ✨**
