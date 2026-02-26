# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Flutter Web political campaign website for William Campiño (candidate for Mayor of Popayán, Colombia). Uses **Clean Architecture**, **Atomic Design**, and **Riverpod** for state management. Backend powered by **Supabase**.

## Essential Commands

```bash
# Install dependencies
flutter pub get

# Generate Riverpod providers and other code
dart run build_runner build --delete-conflicting-outputs

# Run in web (primary target)
flutter run -d chrome

# Build for production
flutter build web --release

# Static analysis
flutter analyze

# Format code
dart format .
```

## Architecture

### Four-Layer Structure

| Layer | Path | Purpose |
|-------|------|---------|
| **Core** | `lib/core/` | Infrastructure: Supabase client, Dio wrapper, global providers, extensions |
| **Features** | `lib/features/` | Business features with Clean Architecture (data/domain/presentation) |
| **Typing** | `lib/typing/` | Shared entities, enums, models, DTOs, `ResultDef<T>` type |
| **UI** | `lib/ui/` | Shared widgets (Atomic Design), ions, themes, routes, i18n |

### Dependency Rules
- Features depend on core, typing, and ui
- **Features do NOT import each other** — shared code goes in typing or ui
- Core and Typing do NOT depend on features or ui

### Clean Architecture per Feature

Each feature in `lib/features/{feature}/` has:
```
data/
├── data_sources/    # API calls, Supabase queries
├── repositories/    # Repository implementations
└── dependencies/    # Riverpod providers
domain/
├── use_cases/       # Business logic (one per operation)
├── repositories/    # Abstract interfaces
└── dependencies/    # Riverpod providers
presentation/
├── screens/         # UI screens
└── dependencies/    # Optional providers
```

Data flow: `Supabase → DataSource → Repository → UseCase → ViewModel → Screen`

### Atomic Design (UI Components)

Located in `lib/ui/widgets/`:
- **Atoms** — Basic widgets (buttons, text, icons)
- **Molecules** — Max 5 atoms combined, no nested scroll
- **Organisms** — Complex components, max 1 nested organism
- **Templates** — Organizational layouts, no business logic

Constants live in `lib/ui/ions/` (colors, typography, padding, SVGs).

## Screen Pattern

Screens use `library` + `part` pattern in `lib/features/{feature}/presentation/screens/{screen_name}/`:

```
{screen_name}/
├── {screen_name}.dart    # Library with imports + part directives
├── state.dart            # Immutable state class with copyWith
├── view_model.dart       # @riverpod ViewModel extending _$ViewModel
├── screen.dart           # ConsumerStatefulWidget
└── {screen_name}.g.dart  # Generated provider
```

Key patterns:
- State: immutable with `copyWith`, optional `UIEvent<dynamic>?` for loading/navigation
- ViewModel: `@riverpod` annotation, `build()` returns initial state, uses `ref.read()` for use cases
- Screen: `ref.watch()` for state, `ref.read(.notifier)` for ViewModel, `ref.listen()` for UIEvent

## Routing

Uses `go_router` with `ShellRoute` for persistent app shell (AppBar + Footer).

Routes defined in `lib/ui/routes/`:
- `routes_names.dart` — Route constants (`Routes.home`, `Routes.candidate`, etc.)
- `router.dart` — `GoRouter` configuration with `ShellRoute`

Navigation: `context.go(Routes.routeName)` or `context.push()`

## Supabase Integration

Configuration in `lib/core/supabase/`:
- `supabase_client.dart` — Initialization from `.env` file
- `supabase_tables.dart` — Table name constants
- `supabase_data_source.dart` — Generic CRUD operations

Environment variables required in `.env`:
```
SUPABASE_URL=your_url
SUPABASE_ANON_KEY=your_key
```

## Key Features/Screens

- `/` — Home (landing page)
- `/candidato` — Candidate bio
- `/mi-vida` — Life timeline
- `/vision` — City vision
- `/ejes` — Strategic axes
- `/propuestas` — Government proposals
- `/tu-popayan` — Citizen investment calculator
- `/apoyos` — Endorsements
- `/agenda` — Events calendar
- `/apoyar` — Support/volunteer
- `/noticias` — News
- `/galeria` — Media gallery
- `/contacto` — Contact form
- `/territorio` — Territory map by communes

## Responsive Design

Uses `responsive_framework` with breakpoints:
- Mobile: 0-450px
- Tablet: 451-800px
- Desktop: 801-1920px
- 4K: 1921px+

Access via `Responsive.of(context)` or `ResponsiveBreakpoints.of(context)`.

## Code Style

- Line length: 80 characters
- Hide Flutter's `Colors` when using custom colors: `import 'package:flutter/material.dart' hide Colors;`
- Use `Theme.of(context).appColors` for themed colors
- Prefer `BaseText` widget over raw `Text` for consistent typography
