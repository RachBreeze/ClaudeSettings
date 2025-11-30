# Mermaid.js Quick Reference - GitHub Compatible

## 🎯 Critical Rule: GitHub Rendering

**ALL Mermaid diagrams MUST use this exact format:**

```markdown
```mermaid
[your diagram here]
```
```

**That's it. Nothing else works on GitHub.**

---

## ✅ The ONE Correct Format

```markdown
```mermaid
graph TD
    A[Start] --> B[End]
```
```

This renders on GitHub as:

```mermaid
graph TD
    A[Start] --> B[End]
```

---

## ❌ Common Mistakes That Break GitHub

### DON'T use HTML divs
```html
<!-- ❌ WRONG - GitHub won't render this -->
<div class="mermaid">
graph TD
    A --> B
</div>
```

### DON'T use wrong fence tags
```markdown
<!-- ❌ WRONG -->
```mermaidjs
graph TD
```

<!-- ❌ WRONG -->
```diagram
graph TD
```

<!-- ❌ WRONG -->
```
graph TD
```
```

### DON'T forget the language identifier
```markdown
<!-- ❌ WRONG - Missing 'mermaid' after backticks -->
```
graph TD
    A --> B
```
```

---

## 🧪 Testing Your Diagrams

**BEFORE committing, ALWAYS test at:**
https://mermaid.live/

1. Paste your diagram code
2. Check for syntax errors
3. Verify it renders correctly
4. Copy the working code to your markdown

---

## 📊 Diagram Types & Syntax

### 1. Flowchart / Graph

**Basic:**
```markdown
```mermaid
flowchart TD
    Start --> End
```
```

**With Decision:**
```markdown
```mermaid
flowchart TD
    A[Start] --> B{Decision}
    B -->|Yes| C[Action 1]
    B -->|No| D[Action 2]
    C --> E[End]
    D --> E
```
```

**Directions:**
- `TD` or `TB` - Top to Bottom
- `BT` - Bottom to Top
- `LR` - Left to Right
- `RL` - Right to Left

**Node Shapes:**
```mermaid
flowchart TD
    A[Rectangle]
    B([Rounded])
    C[(Database)]
    D{{Diamond}}
    E([Stadium])
    F[[Subroutine]]
    G[(Cylindrical)]
    H[/Parallelogram/]
```

**Arrow Types:**
- `-->` Solid arrow
- `-.->` Dotted arrow
- `==>` Thick arrow
- `--text-->` Arrow with text

---

### 2. Sequence Diagram

```markdown
```mermaid
sequenceDiagram
    participant User
    participant Frontend
    participant API
    participant DB
    
    User->>Frontend: Click button
    Frontend->>API: POST /api/data
    API->>DB: Query data
    DB-->>API: Return results
    API-->>Frontend: JSON response
    Frontend-->>User: Display data
```
```

**Arrow Types:**
- `->` Solid line without arrow
- `-->` Dotted line without arrow
- `->>` Solid line with arrow
- `-->>` Dotted line with arrow
- `-x` Solid line with X
- `--x` Dotted line with X

**Activations:**
```markdown
```mermaid
sequenceDiagram
    User->>+API: Request
    API->>+DB: Query
    DB-->>-API: Data
    API-->>-User: Response
```
```

---

### 3. Class Diagram

```markdown
```mermaid
classDiagram
    class Animal {
        +String name
        +int age
        +makeSound()
    }
    
    class Dog {
        +String breed
        +bark()
    }
    
    class Cat {
        +String color
        +meow()
    }
    
    Animal <|-- Dog
    Animal <|-- Cat
```
```

**Relationships:**
- `<|--` Inheritance
- `*--` Composition
- `o--` Aggregation
- `-->` Association
- `--` Link

**Visibility:**
- `+` Public
- `-` Private
- `#` Protected
- `~` Package

---

### 4. State Diagram

```markdown
```mermaid
stateDiagram-v2
    [*] --> Idle
    Idle --> Processing : Start
    Processing --> Success : Complete
    Processing --> Error : Fail
    Success --> [*]
    Error --> Idle : Retry
```
```

---

### 5. Entity Relationship Diagram (ERD)

```markdown
```mermaid
erDiagram
    CUSTOMER ||--o{ ORDER : places
    ORDER ||--|{ LINE-ITEM : contains
    CUSTOMER }|..|{ DELIVERY-ADDRESS : uses
    
    CUSTOMER {
        string name
        string email
        int customer_id
    }
    
    ORDER {
        int order_id
        date order_date
        float total
    }
```
```

**Relationship Types:**
- `||--||` One to one
- `||--o{` One to many
- `}o--o{` Many to many
- `||--|{` One to exactly one
- `|o--o|` Zero to one

---

### 6. Gantt Chart

```markdown
```mermaid
gantt
    title Project Schedule
    dateFormat YYYY-MM-DD
    
    section Planning
    Requirements       :a1, 2024-01-01, 14d
    Design            :a2, after a1, 10d
    
    section Development
    Backend           :b1, after a2, 30d
    Frontend          :b2, after a2, 30d
    
    section Testing
    QA Testing        :c1, after b1, 14d
    UAT              :c2, after c1, 7d
```
```

---

### 7. Pie Chart

```markdown
```mermaid
pie title Browser Usage
    "Chrome" : 60
    "Firefox" : 20
    "Safari" : 15
    "Other" : 5
```
```

---

### 8. Git Graph

```markdown
```mermaid
gitGraph
    commit
    commit
    branch develop
    checkout develop
    commit
    commit
    checkout main
    merge develop
    commit
    commit
```
```

---

## 🎨 Styling (Optional)

### Node Styles
```markdown
```mermaid
flowchart TD
    A[Normal]
    B[Styled]
    
    style B fill:#f9f,stroke:#333,stroke-width:4px
```
```

### Class Styles
```markdown
```mermaid
flowchart TD
    A[Node 1]:::someclass
    B[Node 2]
    
    classDef someclass fill:#f96,stroke:#333
```
```

---

## 💡 Best Practices

### 1. Keep It Simple
```markdown
<!-- ✅ GOOD - Clear and readable -->
```mermaid
flowchart LR
    Login --> Dashboard
    Dashboard --> Profile
```
```

```markdown
<!-- ❌ TOO COMPLEX - Hard to read -->
```mermaid
flowchart TD
    A[Step 1 with a really long description that wraps] --> B[Step 2]
    B --> C[Step 3]
    C --> D{Complex decision with multiple conditions}
    D -->|Option 1| E[Action 1]
    D -->|Option 2| F[Action 2]
    D -->|Option 3| G[Action 3]
    D -->|Option 4| H[Action 4]
    E --> I[More steps]
    F --> I
    G --> I
    H --> I
```
```

### 2. Use Meaningful Labels
```markdown
<!-- ✅ GOOD -->
```mermaid
flowchart TD
    UserLogin[User Login] --> ValidateCredentials{Validate}
    ValidateCredentials -->|Valid| ShowDashboard[Show Dashboard]
    ValidateCredentials -->|Invalid| ShowError[Show Error]
```
```

```markdown
<!-- ❌ BAD -->
```mermaid
flowchart TD
    A --> B{C}
    B -->|D| E
    B -->|F| G
```
```

### 3. Add Titles and Context
```markdown
```mermaid
---
title: User Authentication Flow
---
flowchart TD
    Start([User Visits Site]) --> Login[Login Page]
    Login --> Auth{Authenticate}
    Auth -->|Success| Dashboard[Dashboard]
    Auth -->|Fail| Error[Error Message]
```
```

### 4. Group Related Items
```markdown
```mermaid
flowchart TD
    subgraph Frontend
        UI[User Interface]
        State[State Management]
    end
    
    subgraph Backend
        API[API Server]
        DB[(Database)]
    end
    
    UI --> API
    API --> DB
```
```

---

## 🔍 Quick Troubleshooting

### Diagram Not Rendering?

1. **Check fence syntax:**
   - Must be exactly \`\`\`mermaid (three backticks + word "mermaid")

2. **Test on Mermaid Live:**
   - https://mermaid.live/
   - Copy your code there first

3. **Check for syntax errors:**
   - Missing arrows: `-->` not `->`
   - Unclosed brackets: `[Node]` not `[Node`
   - Typos in keywords: `flowchart` not `flwochart`

4. **Verify GitHub compatibility:**
   - View the raw markdown on GitHub
   - Check if fence is correct
   - Try pushing to a test repo

### Common Syntax Errors

```markdown
<!-- ❌ WRONG - Single arrow -->
```mermaid
graph TD
    A -> B
```

<!-- ✅ CORRECT - Double arrow -->
```mermaid
graph TD
    A --> B
```
```

```markdown
<!-- ❌ WRONG - Unclosed bracket -->
```mermaid
graph TD
    A[Node --> B[Node]
```

<!-- ✅ CORRECT - Properly closed -->
```mermaid
graph TD
    A[Node] --> B[Node]
```
```

---

## 📚 Complete Example: System Architecture

```markdown
```mermaid
flowchart TB
    subgraph Client
        Web[Web Browser]
        Mobile[Mobile App]
    end
    
    subgraph Frontend
        React[React App]
        Assets[Static Assets]
    end
    
    subgraph Backend
        API[API Gateway]
        Auth[Auth Service]
        User[User Service]
        Order[Order Service]
    end
    
    subgraph Data
        Redis[(Redis Cache)]
        Postgres[(PostgreSQL)]
        S3[S3 Storage]
    end
    
    Web --> React
    Mobile --> API
    React --> API
    
    API --> Auth
    API --> User
    API --> Order
    
    Auth --> Redis
    User --> Postgres
    Order --> Postgres
    Assets --> S3
    
    style Client fill:#e1f5ff
    style Frontend fill:#fff4e6
    style Backend fill:#f3e5f5
    style Data fill:#e8f5e9
```
```

This renders as:

```mermaid
flowchart TB
    subgraph Client
        Web[Web Browser]
        Mobile[Mobile App]
    end
    
    subgraph Frontend
        React[React App]
        Assets[Static Assets]
    end
    
    subgraph Backend
        API[API Gateway]
        Auth[Auth Service]
        User[User Service]
        Order[Order Service]
    end
    
    subgraph Data
        Redis[(Redis Cache)]
        Postgres[(PostgreSQL)]
        S3[S3 Storage]
    end
    
    Web --> React
    Mobile --> API
    React --> API
    
    API --> Auth
    API --> User
    API --> Order
    
    Auth --> Redis
    User --> Postgres
    Order --> Postgres
    Assets --> S3
```

---

## 🎯 Pre-Commit Checklist

Before committing any markdown with Mermaid:

- [ ] Using \`\`\`mermaid fence (three backticks + mermaid)
- [ ] Tested on https://mermaid.live/
- [ ] No syntax errors
- [ ] Labels are clear and descriptive
- [ ] Diagram is not overly complex
- [ ] Direction makes sense (TD, LR, etc.)
- [ ] Verified in GitHub preview (if possible)

---

## 🔗 Resources

- **Mermaid Live Editor**: https://mermaid.live/
- **Official Docs**: https://mermaid.js.org/
- **GitHub Markdown Guide**: https://docs.github.com/en/get-started/writing-on-github

---

## 🚀 Quick Templates

### Basic Flow
```markdown
```mermaid
flowchart TD
    Start([Start]) --> Process[Process]
    Process --> Decision{Decision?}
    Decision -->|Yes| ActionA[Action A]
    Decision -->|No| ActionB[Action B]
    ActionA --> End([End])
    ActionB --> End
```
```

### API Sequence
```markdown
```mermaid
sequenceDiagram
    Client->>+Server: Request
    Server->>+Database: Query
    Database-->>-Server: Results
    Server-->>-Client: Response
```
```

### Database ERD
```markdown
```mermaid
erDiagram
    USER ||--o{ ORDER : places
    ORDER ||--|{ ORDER_ITEM : contains
    PRODUCT ||--o{ ORDER_ITEM : includes
```
```

---

**Remember: Always use \`\`\`mermaid fence and test on mermaid.live before committing!**
