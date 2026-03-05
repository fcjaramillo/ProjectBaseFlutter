---
description: Complete architecture of the Flutter base project - monolith with
  Clean Architecture, Atomic Design, and Screen/State/ViewModel pattern
alwaysApply: true
---

# Flutter Project Base

Monolithic Flutter project. Four main layers within `lib/`:

| Layer        | Location        | Role                                                        |
| ------------ | --------------- | ----------------------------------------------------------- |
| **Core**     | `lib/core/`     | Infrastructure: APIs, global providers, extensions          |
| **Features** | `lib/features/` | Features with Clean Architecture (data/domain/presentation) |
| **Typing**   | `lib/typing/`   | Entities, enums, models, DTOs, shared Result                |
| **UI**       | `lib/ui/`       | Shared visual layer: Atomic Design, ions, themes, routes    |

## Dependencies

- **Features** depend on core, typing, and ui.
- **UI** may depend on typing (color entities, enums).
- **Core** and **Typing** do NOT depend on features or ui.
- **Features do NOT import each other**. Shared data goes in typing; shared UI
  in ui.

## Project Structure

```
lib/
├── main.dart
├── core/
│   ├── apis/           # ApiUtils (Dio wrapper)
│   ├── dependencies/   # Global providers (Dio, etc.)
│   ├── extensions/     # Dart extensions
│   └── utils/          # Theme helpers, responsive
├── features/
│   └── {feature}/
│       ├── data/
│       │   ├── data_sources/
│       │   ├── repositories/
│       │   └── dependencies/
│       ├── domain/
│       │   ├── use_cases/
│       │   ├── repositories/   # Interfaces (abstract classes)
│       │   └── dependencies/
│       └── presentation/
│           ├── screens/
│           └── dependencies/
├── typing/
│   ├── entities/
│   ├── enums/
│   ├── extensions/
│   ├── models/
│   └── result/
└── ui/
    ├── ions/           # Constants (colors, layout, padding, typography)
    ├── l10n/           # Internationalization
    ├── routes/         # AppRouter, route names
    ├── theme/          # ThemeData, light/dark colors
    ├── utils/          # UI utilities
    └── widgets/        # atoms/, molecules/, organisms/, templates/
```

## State and DI

- **Riverpod** for state management and dependency injection.
- ViewModels use `@riverpod` or `@Riverpod(keepAlive: true)` with
  `riverpod_generator`.
- Providers are generated with `build_runner`
  (`dart run build_runner build --delete-conflicting-outputs`).

## Routing

- `lib/ui/routes/routes.dart` — Library that groups router and route names.
- `AppRouter.generateRoute(RouteSettings)` uses `switch` to map routes to
  screens.
- Each screen exposes a static `goTo()` method that returns `MaterialPageRoute`.

---

# Clean Architecture in Features

Each feature follows Clean Architecture:

```
lib/features/{feature}/
├── data/
│   ├── data_sources/    # API, local DB, sensors
│   ├── repositories/    # Repository implementations
│   └── dependencies/    # Riverpod providers for DI
├── domain/
│   ├── use_cases/       # Business logic (one use case per operation)
│   ├── repositories/    # Interfaces (abstract classes)
│   └── dependencies/    # Riverpod providers for DI
└── presentation/
    ├── screens/
    └── dependencies/    # Optional
```

## Dependency Direction

```
Presentation → Domain ← Data
```

- **Domain** does NOT depend on Data or Presentation.
- **Data** depends on Domain (entities, interfaces).
- **Presentation** depends on Domain (use cases, entities).

## Layers

- **Entities**: Pure business objects in `lib/typing/`. Include `copyWith`.
- **Use Cases**: One business operation. Receive repositories via constructor.
  Return `ResultDef<T>`. Injected in `dependencies/`.
- **Repositories**: Single entry point for data. Convert models into domain
  entities. Implement domain interfaces.
- **Data Sources**: API (HTTP via `ApiUtils` → DTOs/models) or Local (DB,
  secure storage, sensors).

## Data Flow

```
API / Local DB → Data Source → Repository → Use Case → ViewModel → Screen
                    ↓              ↓            ↓           ↓
                 Models      Entities      ResultDef   State + UIEvent
```

## Use Case Example

```dart
class GetExampleUseCase {
  final IBaseRepository _iBaseRepository;
  GetExampleUseCase(this._iBaseRepository);

  Future<ResultDef<bool>> call() => _iBaseRepository.getExample();
}
```

---

# Screen Structure (Screen/State/ViewModel)

Each screen lives in
`lib/features/{feature}/presentation/screens/{screen_name}/` with the
`library` + `part` pattern.

```
{screen_name}/
├── {screen_name}.dart    # Main library
├── state.dart            # Immutable state
├── view_model.dart       # ViewModel with @riverpod
├── screen.dart           # ConsumerStatefulWidget
├── loading.dart          # (Optional) shimmer/skeleton
└── {screen_name}.g.dart  # Generated: provider
```

## Main File

```dart
library;

import 'package:base/core/extensions/extensions.dart';
import 'package:base/typing/extensions/extensions.dart';
import 'package:base/ui/widgets/atoms/atoms.dart';
import 'package:base/ui/ions/ions.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '{screen_name}.g.dart';
part 'screen.dart';
part 'state.dart';
part 'view_model.dart';
```

## State

- Immutable class with `final` variables, `initial()` factory, `copyWith` method.
- Optional `UIEvent<dynamic>?` for loading, navigation, snackbars.

```dart
part of '{screen_name}.dart';

class {Name}State {
  final bool isLoading;
  final UIEvent<dynamic>? event;

  {Name}State({required this.isLoading, this.event});
  factory {Name}State.initial() => {Name}State(isLoading: false);

  {Name}State copyWith({bool? isLoading, UIEvent<dynamic>? event}) =>
      {Name}State(isLoading: isLoading ?? this.isLoading, event: event ?? this.event);
}
```

## ViewModel

- `@riverpod` (AutoDispose) or `@Riverpod(keepAlive: true)`. Extends
  `_${Name}ViewModel`.
- `build()` returns initial state. Uses `ref.read()` for use cases. Updates
  with `state = state.copyWith(...)`.

```dart
part of '{screen_name}.dart';

@riverpod
class {Name}ViewModel extends _${Name}ViewModel {
  @override
  {Name}State build() => {Name}State.initial();

  void init() { /* initialization logic */ }
}
```

## Screen

- `ConsumerStatefulWidget`. `ref.watch` for state, `ref.read(.notifier)` for
  ViewModel.
- `ref.listen` for `UIEvent`. Init in `addPostFrameCallback`.
- Static `goTo()` method that returns `MaterialPageRoute`.

```dart
part of '{screen_name}.dart';

class {Name}Screen extends ConsumerStatefulWidget {
  const {Name}Screen({super.key});

  static Route<void> goTo() => MaterialPageRoute<void>(
    builder: (_) => const {Name}Screen(),
    settings: const RouteSettings(name: Routes.kRoute{Name}),
  );

  @override
  ConsumerState<{Name}Screen> createState() => _{Name}ScreenState();
}

class _{Name}ScreenState extends ConsumerState<{Name}Screen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read({name}ViewModelProvider.notifier).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch({name}ViewModelProvider);
    final viewModel = ref.read({name}ViewModelProvider.notifier);

    ref.listen<UIEvent<dynamic>?>(
      {name}ViewModelProvider.select((s) => s.event),
      (previous, next) async {
        final value = await UIEventHandler.handleEvent(context, next, previous);
        if (next != null && next.returnFunction != null) next.returnFunction!(value);
      },
    );

    return Scaffold(body: /* widgets using state and viewModel */);
  }
}
```

---

# Atomic Design

| Layer         | Description                                           | Restrictions                                                                  |
| ------------- | ----------------------------------------------------- | ----------------------------------------------------------------------------- |
| **Ions**      | Constants (colors, layout, padding, typography, SVGs) | Only in `lib/ui/ions/`. NO widgets.                                           |
| **Atoms**     | Indivisible and simple widgets                        | Stateless/Stateful only.                                                      |
| **Molecules** | Max 5 atoms combined                                  | No Rows+Columns+Stacks simultaneously. No scroll widgets. No other molecules. |
| **Organisms** | Complex components                                    | Max 1 nested organism.                                                        |
| **Templates** | Organizational widgets                                | No business logic.                                                            |
| **Screens**   | Complete screens                                      | Only place with Scaffold and Riverpod. Only in features.                      |

## Locations

**Shared** (`lib/ui/`):

```
lib/ui/
├── ions/        # Constants
└── widgets/     # atoms/, molecules/, organisms/, templates/
```

**Per feature** (specific):

```
lib/features/{feature}/presentation/
├── screens/     # Only here, never in lib/ui/
├── atoms/       # (Optional) feature-specific atoms
├── molecules/   # (Optional)
├── organisms/   # (Optional)
└── templates/   # (Optional)
```

## Key Rules

- Prefer `lib/ui/widgets/` for reusable UI; features only for feature-specific
  UI.
- Ions always in `lib/ui/ions/`.
- Screens only in `lib/features/{feature}/presentation/screens/`.
- Widgets shared across workflows go in the **"Cross"** folder.

---

# Adding a New Feature

1. Create `lib/features/{feature}/` with the three layers: `data/`, `domain/`,
   `presentation/`.
2. Define entities/models in `lib/typing/` if shared.
3. Register routes in `lib/ui/routes/router.dart`.
4. `dart run build_runner build --delete-conflicting-outputs`.

# Commands

| Command                                                    | Description              |
| ---------------------------------------------------------- | ------------------------ |
| `flutter pub get`                                          | Install dependencies     |
| `dart run build_runner build --delete-conflicting-outputs` | Generate `.g.dart` files |
| `flutter analyze`                                          | Static analysis          |
| `dart format .`                                            | Format code              |
| `flutter test`                                             | Run tests                |

# Reference

Detailed documentation in `docs/`:

- @docs/project_architecture.md
- @docs/clean_architecture.md
- @docs/atomic_design.md
- @docs/screen_structure.md
