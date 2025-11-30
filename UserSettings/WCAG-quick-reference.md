# WCAG 2.2 AA Compliance - Quick Reference & Checklist

## 🚨 CRITICAL: This is MANDATORY for ALL web development

Every HTML, CSS, JavaScript, React, or web component you create MUST meet these requirements.

---

## Pre-Code Checklist

Before writing ANY web code, ensure you understand:
- [ ] Who will use this feature (including people with disabilities)
- [ ] How it will work with keyboard only
- [ ] How it will work with screen readers
- [ ] What colors you'll use (and their contrast ratios)

---

## The Big 4 Principles: POUR

### 1. **P**erceivable
Can users perceive the content?

### 2. **O**perable  
Can users operate the interface?

### 3. **U**nderstandable
Can users understand the content and interface?

### 4. **R**obust
Does it work with assistive technologies?

---

## Essential Rules - Learn These First

### Rule 1: Alt Text for Images
**EVERY image needs alt text. No exceptions.**

```html
<!-- Informative image -->
<img src="chart.png" alt="Sales increased 25% in Q4">

<!-- Decorative image -->
<img src="divider.png" alt="">

<!-- Icon button -->
<button>
  <img src="save-icon.png" alt="Save">
</button>
```

### Rule 2: Color Contrast
**Text must be readable.**

| Element Type | Minimum Ratio |
|--------------|---------------|
| Normal text (< 18pt) | 4.5:1 |
| Large text (≥ 18pt) | 3:1 |
| UI components | 3:1 |

**Test every color combination**: https://webaim.org/resources/contrastchecker/

```css
/* ✅ GOOD */
color: #333;
background: #fff;
/* Ratio: 12.6:1 */

/* ❌ BAD */
color: #999;
background: #fff;
/* Ratio: 2.8:1 - FAILS! */
```

### Rule 3: Keyboard Access
**Everything must work without a mouse.**

```html
<!-- ✅ GOOD - Keyboard accessible -->
<button onclick="save()">Save</button>
<a href="/page">Link</a>

<!-- ❌ BAD - Not keyboard accessible -->
<div onclick="save()">Save</div>
<span onclick="navigate()">Link</span>
```

**Test**: Tab through your entire page. Can you reach everything? Can you activate everything?

### Rule 4: Focus Indicators
**Users must see where they are.**

```css
/* ✅ GOOD - Visible focus */
button:focus,
a:focus,
input:focus {
  outline: 2px solid #0066cc;
  outline-offset: 2px;
}

/* ❌ BAD - Invisible focus */
*:focus {
  outline: none;
}
```

**NEVER remove focus outlines without providing an alternative.**

### Rule 5: Form Labels
**Every input needs a label.**

```html
<!-- ✅ GOOD -->
<label for="email">Email</label>
<input type="email" id="email" name="email">

<!-- ❌ BAD -->
<input type="email" placeholder="Email">
```

**Placeholders are NOT labels!**

### Rule 6: Semantic HTML
**Use the right element for the job.**

```html
<!-- ✅ GOOD -->
<button>Click me</button>
<nav>...</nav>
<header>...</header>
<main>...</main>

<!-- ❌ BAD -->
<div class="button">Click me</div>
<div class="nav">...</div>
```

### Rule 7: Heading Hierarchy
**Headings must be in order.**

```html
<!-- ✅ GOOD -->
<h1>Page Title</h1>
  <h2>Section</h2>
    <h3>Subsection</h3>
  <h2>Another Section</h2>

<!-- ❌ BAD - Skips h2 -->
<h1>Page Title</h1>
  <h3>Subsection</h3>
```

### Rule 8: Link Text
**Links must make sense out of context.**

```html
<!-- ✅ GOOD -->
<a href="/report.pdf">Download 2024 Annual Report (PDF, 2MB)</a>
<a href="/products">View our product catalog</a>

<!-- ❌ BAD -->
<a href="/report.pdf">Click here</a>
<a href="/products">More</a>
```

### Rule 9: Error Messages
**Tell users what went wrong and how to fix it.**

```html
<!-- ✅ GOOD -->
<label for="password">Password</label>
<input 
  type="password" 
  id="password"
  aria-describedby="password-error"
  aria-invalid="true"
>
<span id="password-error" role="alert">
  Password must be at least 8 characters and include one number
</span>

<!-- ❌ BAD -->
<input type="password">
<span class="error">Invalid</span>
```

### Rule 10: Touch Target Size (NEW in WCAG 2.2)
**Buttons and links must be big enough to tap.**

```css
/* ✅ GOOD - Minimum 24×24 pixels */
button,
a {
  min-width: 44px;  /* Recommended: 44×44 */
  min-height: 44px;
  padding: 12px 16px;
}

/* ❌ BAD - Too small */
button {
  width: 16px;
  height: 16px;
}
```

---

## Pre-Commit Testing Checklist

### Automated Testing (2 minutes)
- [ ] Run axe DevTools (browser extension)
- [ ] Run Lighthouse accessibility audit
- [ ] Run WAVE accessibility checker
- [ ] Check HTML validation (W3C validator)

### Manual Testing (5-10 minutes)
- [ ] **Keyboard Test**: Unplug mouse, use only keyboard
  - [ ] Can I tab to all interactive elements?
  - [ ] Can I see focus indicators clearly?
  - [ ] Can I activate all buttons/links with Enter/Space?
  - [ ] Are there any keyboard traps?
  
- [ ] **Screen Reader Test**: Turn on screen reader
  - [ ] Does it read content in logical order?
  - [ ] Are images described properly?
  - [ ] Are form fields labeled correctly?
  - [ ] Can I navigate by headings?

- [ ] **Visual Test**: Check the page visually
  - [ ] Is text readable (contrast)?
  - [ ] Is layout clear without color?
  - [ ] Are interactive elements obvious?
  - [ ] Is the page usable at 200% zoom?

- [ ] **Content Test**: Review the content
  - [ ] Are headings in logical order?
  - [ ] Are links descriptive?
  - [ ] Is language specified (`<html lang="en">`)?
  - [ ] Are instructions clear?

---

## Common Components - Accessibility Patterns

### Button

```html
<!-- Standard button -->
<button type="button" onclick="handleClick()">
  Click Me
</button>

<!-- Icon button -->
<button type="button" aria-label="Close dialog">
  <svg aria-hidden="true">...</svg>
</button>

<!-- Toggle button -->
<button 
  type="button"
  aria-pressed="false"
  onclick="toggleFeature()"
>
  Toggle Feature
</button>
```

### Link

```html
<!-- Standard link -->
<a href="/page">Descriptive link text</a>

<!-- External link -->
<a href="https://external.com" target="_blank" rel="noopener">
  External Site
  <span class="sr-only">(opens in new window)</span>
</a>

<!-- Download link -->
<a href="/file.pdf" download>
  Download Report (PDF, 2.5MB)
</a>
```

### Form Field

```html
<!-- Text input -->
<div class="form-group">
  <label for="username">
    Username
    <span aria-label="required">*</span>
  </label>
  <input 
    type="text"
    id="username"
    name="username"
    required
    aria-required="true"
    aria-describedby="username-hint"
  >
  <span id="username-hint" class="hint">
    Must be 3-20 characters
  </span>
</div>

<!-- With error -->
<div class="form-group">
  <label for="email">Email</label>
  <input 
    type="email"
    id="email"
    name="email"
    aria-describedby="email-error"
    aria-invalid="true"
  >
  <span id="email-error" class="error" role="alert">
    Please enter a valid email address
  </span>
</div>
```

### Select Dropdown

```html
<label for="country">Country</label>
<select id="country" name="country" required>
  <option value="">Select a country</option>
  <option value="us">United States</option>
  <option value="uk">United Kingdom</option>
  <option value="ca">Canada</option>
</select>
```

### Radio Buttons

```html
<fieldset>
  <legend>Choose a plan</legend>
  <div>
    <input type="radio" id="plan-basic" name="plan" value="basic">
    <label for="plan-basic">Basic - $9/month</label>
  </div>
  <div>
    <input type="radio" id="plan-pro" name="plan" value="pro">
    <label for="plan-pro">Pro - $29/month</label>
  </div>
</fieldset>
```

### Checkboxes

```html
<fieldset>
  <legend>Email preferences</legend>
  <div>
    <input type="checkbox" id="newsletter" name="newsletter">
    <label for="newsletter">Subscribe to newsletter</label>
  </div>
  <div>
    <input type="checkbox" id="updates" name="updates">
    <label for="updates">Receive product updates</label>
  </div>
</fieldset>
```

### Modal Dialog

```html
<div 
  role="dialog"
  aria-labelledby="dialog-title"
  aria-describedby="dialog-desc"
  aria-modal="true"
>
  <h2 id="dialog-title">Confirm Action</h2>
  <p id="dialog-desc">Are you sure you want to delete this item?</p>
  
  <button type="button" onclick="confirmDelete()">
    Confirm
  </button>
  <button type="button" onclick="closeDialog()">
    Cancel
  </button>
</div>

<!-- Don't forget to trap focus inside modal! -->
```

### Navigation Menu

```html
<nav aria-label="Main navigation">
  <ul>
    <li><a href="/" aria-current="page">Home</a></li>
    <li><a href="/about">About</a></li>
    <li><a href="/products">Products</a></li>
    <li><a href="/contact">Contact</a></li>
  </ul>
</nav>
```

### Dropdown Menu (Expandable)

```html
<button 
  aria-expanded="false"
  aria-controls="menu"
  aria-haspopup="true"
  onclick="toggleMenu()"
>
  Menu
</button>

<ul id="menu" hidden>
  <li><a href="/option1">Option 1</a></li>
  <li><a href="/option2">Option 2</a></li>
</ul>
```

### Breadcrumb

```html
<nav aria-label="Breadcrumb">
  <ol>
    <li><a href="/">Home</a></li>
    <li><a href="/products">Products</a></li>
    <li aria-current="page">Product Details</li>
  </ol>
</nav>
```

### Table

```html
<table>
  <caption>Monthly Sales Report</caption>
  <thead>
    <tr>
      <th scope="col">Month</th>
      <th scope="col">Sales</th>
      <th scope="col">Growth</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">January</th>
      <td>$50,000</td>
      <td>+5%</td>
    </tr>
  </tbody>
</table>
```

### Skip Link

```html
<!-- First element in <body> -->
<a href="#main-content" class="skip-link">
  Skip to main content
</a>

<!-- CSS -->
.skip-link {
  position: absolute;
  top: -40px;
  left: 0;
  background: #000;
  color: #fff;
  padding: 8px;
  z-index: 100;
}

.skip-link:focus {
  top: 0;
}
```

---

## ARIA - Use Sparingly and Correctly

### The First Rule of ARIA
**Don't use ARIA if you can use semantic HTML instead.**

```html
<!-- ✅ PREFER THIS -->
<button>Click</button>

<!-- ❌ AVOID THIS -->
<div role="button" tabindex="0">Click</div>
```

### Common ARIA Attributes

| Attribute | Purpose | Example |
|-----------|---------|---------|
| `aria-label` | Provides label | `<button aria-label="Close">×</button>` |
| `aria-labelledby` | References label | `<div aria-labelledby="title">` |
| `aria-describedby` | References description | `<input aria-describedby="hint">` |
| `aria-hidden` | Hides from screen readers | `<svg aria-hidden="true">` |
| `aria-live` | Announces updates | `<div aria-live="polite">` |
| `aria-expanded` | Expandable state | `<button aria-expanded="false">` |
| `aria-pressed` | Toggle state | `<button aria-pressed="false">` |
| `aria-current` | Current item | `<a aria-current="page">` |
| `aria-invalid` | Invalid input | `<input aria-invalid="true">` |
| `aria-required` | Required field | `<input aria-required="true">` |

---

## Screen Reader Testing

### How to Turn On Screen Readers

**Windows - NVDA (Free)**
1. Download from https://www.nvaccess.org/
2. Press `Ctrl + Alt + N` to start
3. Press `Insert + Q` to quit

**Windows - JAWS (Paid)**
1. Available from Freedom Scientific
2. Most used by professional users

**Mac/iOS - VoiceOver (Built-in)**
1. Mac: `Cmd + F5` to toggle
2. iOS: Settings > Accessibility > VoiceOver

**Android - TalkBack (Built-in)**
1. Settings > Accessibility > TalkBack

### Basic Screen Reader Commands

**NVDA/JAWS:**
- `Insert + Down Arrow` - Read line
- `Insert + Up Arrow` - Read from top
- `H` - Next heading
- `Shift + H` - Previous heading
- `Tab` - Next link/button
- `Enter` - Activate link/button

**VoiceOver:**
- `VO + A` - Start reading
- `VO + Right/Left` - Next/previous item
- `VO + Space` - Activate

---

## Color Contrast - Quick Reference

### Safe Color Combinations (4.5:1 or better)

**Dark text on light backgrounds:**
- `#000000` on `#FFFFFF` ✓ 21:1
- `#333333` on `#FFFFFF` ✓ 12.6:1
- `#595959` on `#FFFFFF` ✓ 7:1
- `#767676` on `#FFFFFF` ✓ 4.5:1

**Light text on dark backgrounds:**
- `#FFFFFF` on `#000000` ✓ 21:1
- `#FFFFFF` on `#333333` ✓ 12.6:1
- `#FFFFFF` on `#595959` ✓ 7:1
- `#FFFFFF` on `#767676` ✓ 4.5:1

**Colored text (must verify):**
- Always test with contrast checker
- Recommended tool: https://webaim.org/resources/contrastchecker/

---

## Tools & Resources

### Browser Extensions
- **axe DevTools** - Automated testing (Chrome, Firefox, Edge)
- **WAVE** - Visual accessibility evaluation
- **Lighthouse** - Built into Chrome DevTools
- **Web Developer Toolbar** - Various accessibility tools

### Online Tools
- **WebAIM Contrast Checker** - https://webaim.org/resources/contrastchecker/
- **W3C Markup Validator** - https://validator.w3.org/
- **Who Can Use** - https://www.whocanuse.com/ (vision simulator)

### Learning Resources
- **WCAG 2.2 Guidelines** - https://www.w3.org/WAI/WCAG22/quickref/
- **WebAIM** - https://webaim.org/
- **A11Y Project** - https://www.a11yproject.com/
- **MDN Accessibility** - https://developer.mozilla.org/en-US/docs/Web/Accessibility

---

## Emergency Quick Fixes

**If you're about to commit and realize accessibility issues:**

1. **Missing alt text** → Add `alt=""` for decorative or descriptive text for informative
2. **Poor contrast** → Use WebAIM checker and adjust colors
3. **No keyboard access** → Change `<div>` to `<button>` or `<a>`
4. **No focus indicator** → Add `:focus { outline: 2px solid #0066cc; }`
5. **Missing labels** → Add `<label>` elements with matching `for`/`id`
6. **Wrong heading level** → Fix the hierarchy (h1→h2→h3)
7. **Bad link text** → Make it descriptive ("Read our privacy policy" not "Click here")

---

## Remember

✅ **Accessibility is not optional**
✅ **Test early and often**
✅ **Use semantic HTML first**
✅ **Never remove focus indicators**
✅ **Every image needs alt text**
✅ **Every input needs a label**
✅ **Test with real users when possible**

🚫 **Don't assume everyone uses a mouse**
🚫 **Don't rely on color alone**
🚫 **Don't use divs as buttons**
🚫 **Don't skip accessibility testing**

---

**When in doubt, ASK before implementing!**
