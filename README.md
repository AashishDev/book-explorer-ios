# 📚 Book Explorer (iOS)

Book Explorer is a modern, scalable iOS application built to demonstrate **production-grade iOS architecture** using SwiftUI, MVVM-Clean principles, and Swift Package Manager (SPM).

This project is intentionally designed as a **reference architecture** rather than just a demo app.  
The Books domain is used to showcase **modularization, testability, navigation scalability, and modern concurrency** in a real-world setup.

---

## 🎯 Project Vision

The goal of Book Explorer is to serve as:

- A **clean and scalable iOS architecture blueprint**
- A **learning playground** for advanced Swift, SwiftUI, and concurrency
- A **reference project** for teams working on modular iOS apps
- A demonstration of **technical leadership practices** in iOS development

This project prioritizes:
- Clarity over cleverness
- Explicit boundaries over shortcuts
- Long-term scalability over fast hacks

---

## 🧠 Why Book Explorer?

The Books domain provides a balanced problem space:
- Data fetching
- Searching & filtering
- State management
- Navigation complexity
- User interactions (favorites, reviews)

This allows us to focus on **architecture decisions** rather than domain complexity.

---

## 🏗️ Architecture Overview

Book Explorer follows a **Modular MVVM-Clean Architecture** with strict dependency boundaries.

### Key Architectural Principles
- Feature-based modularization
- Dependency inversion using protocols
- Unidirectional data flow
- No business logic in SwiftUI Views
- Navigation handled via Flow / Router pattern
- Cross-cutting concerns via Decorator pattern

> Each module can be developed, tested, and reasoned about in isolation.


## 🧩 Modularization Strategy

- Swift Package Manager based modules
- Features own their View, ViewModel, UseCases, and Flow
- Shared logic lives only in Core or Utilities
- No circular dependencies
- Modules communicate via protocols only

This approach enables:
- Parallel development
- Clear ownership
- Fast and reliable test execution
- Safe feature evolution and removal

---

## 🎨 UI Framework

- SwiftUI only
- No UIKit bridges
- Views are declarative and stateless
- ViewModels contain all business logic
- UI reacts to state changes only

---

## 🧭 Navigation Strategy

Navigation is implemented using a **Flow / Router pattern**.

- SwiftUI Views do not perform navigation directly
- Each feature exposes its own Flow
- The AppRoot coordinates flows
- Navigation logic is centralized and testable

This strategy scales cleanly for:
- iPad support
- macOS support (SwiftUI / Catalyst)
- Deep linking
- Multi-team development


## ⚙️ Concurrency Model

Book Explorer uses **modern Swift concurrency** throughout the codebase:

- `async / await` for asynchronous operations
- `Task` where lifecycle control is required
- `Actor` for shared mutable state
- `@MainActor` for UI-bound logic
- `Sendable` enforced across module boundaries

The minimum supported OS version allows the project to adopt the **latest Swift and iOS features**.

---

## 🧪 Testing Strategy

Testing is a first-class citizen.

### Focus Areas

- Domain logic
- Repositories
- UseCases
- ViewModels

### Test Pyramid

- Unit Tests → Core, Data, ViewModels
- Integration Tests → Module interactions
- UI Tests → Minimal and optional

Every module includes its **own dedicated test target**.

---

## 🧱 Cross-Cutting Concerns

### Logging & Analytics

- Implemented using the **Decorator Pattern**
- No vendor lock-in
- Easily extendable and replaceable
- Fully testable

---

## 🌿 Branching Strategy

main → Stable, releasable
develop → Active integration
feature/* → Feature or module-specific work
