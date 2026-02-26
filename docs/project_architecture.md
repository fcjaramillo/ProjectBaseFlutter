# Project Architecture

## Overview

This is a **monolith** Flutter project that follows Clean Architecture and
Atomic Design. All code lives inside a single `lib/` directory organized into
four top-level layers: **core**, **features**, **typing**, and **ui**.

## Project Structure

```
lib/
├── main.dart               # App entry point
├── core/                   # Shared utilities and infrastructure
│   ├── apis/               # HTTP client helpers (ApiUtils, Dio wrappers)
│   ├── dependencies/       # Global Riverpod providers (Dio, etc.)
│   ├── extensions/         # Dart extension methods (String, DateTime, List…)
│   └── utils/              # Theme helpers, responsive helpers
├── features/               # Feature modules (Clean Architecture)
│   ├── home/
│   │   ├── data/           # Data layer
│   │   │   ├── data_sources/
│   │   │   ├── dependencies/
│   │   │   └── repositories/
│   │   ├── domain/         # Domain layer
│   │   │   ├── dependencies/
│   │   │   ├── repositories/
│   │   │   └── use_cases/
│   │   └── presentation/   # Presentation layer
│   │       ├── dependencies/
│   │       └── screens/
│   └── {other_feature}/    # Same structure per feature
├── typing/                 # Shared types across the app
│   ├── entities/           # Business entities, UI entities, colors system
│   ├── enums/              # App-wide enums
│   ├── extensions/         # Type-specific extensions (Color, TextStyle…)
│   ├── models/             # Data models / DTOs
│   └── result/             # Result type for error handling
└── ui/                     # Shared UI layer
    ├── ions/               # Constants (colors, layout, padding, typography…)
    ├── l10n/               # Internationalization (arb + generated)
    ├── routes/             # App routing (AppRouter, route names)
    ├── theme/              # ThemeData, light/dark color tokens
    ├── utils/              # UI utilities (responsive, formats, event handler)
    └── widgets/            # Atomic Design widgets
        ├── atoms/
        ├── molecules/
        ├── organisms/
        └── templates/
```

## Layer Responsibilities

| Layer | Location | Role |
|-------|----------|------|
| **Core** | `lib/core/` | Infrastructure: HTTP clients, global providers, extensions, utilities |
| **Features** | `lib/features/` | Business features organized with Clean Architecture (data / domain / presentation) |
| **Typing** | `lib/typing/` | Shared entities, enums, models, DTOs, and the `Result` type |
| **UI** | `lib/ui/` | Shared visual layer: Atomic Design widgets, ions, themes, routes, i18n |

## Dependency Graph

```
Features
   │
   ├──▶ Core        (APIs, extensions, global providers)
   ├──▶ Typing      (entities, enums, models, Result)
   └──▶ UI          (widgets, ions, routes, theme, l10n)

UI ──▶ Typing       (color entities, enums, extensions)
```

- **Features** depend on core, typing, and ui.
- **UI** may depend on typing (e.g. color entities, enums).
- **Core** and **Typing** should not depend on features or ui.
- **Features do not import each other.** Shared data goes in typing; shared UI
  goes in ui.

## Entry Point

`lib/main.dart` bootstraps the app with `ProviderScope` (Riverpod) and
`MaterialApp`:

```dart
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) => MaterialApp(
    theme: AppTheme.appTheme(...),
    initialRoute: Routes.kRouteHome,
    onGenerateRoute: AppRouter.generateRoute,
    localizationsDelegates: [L10n.delegate],
    supportedLocales: L10n.delegate.supportedLocales,
  );
}
```

## Routing

Routes are defined in `lib/ui/routes/`:

- **`routes.dart`** — Library file that groups `router.dart` and `routes_names.dart`.
- **`routes_names.dart`** — Route name constants (`Routes.kRouteHome`, etc.).
- **`router.dart`** — `AppRouter.generateRoute(RouteSettings)` uses a `switch`
  to map route names to screens.

```dart
class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.kRouteHome:
        return HomeScreen.goTo();
    }
    return null;
  }
}
```

Each screen exposes a static `goTo()` method that returns a `MaterialPageRoute`.

## State Management and DI

- **Riverpod** for state management and dependency injection.
- ViewModels use `@riverpod` or `@Riverpod(keepAlive: true)` with
  `riverpod_generator`.
- Providers are generated with `build_runner`:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Provider Organization

Each feature has `dependencies/` folders at the data and domain layers:

- **Data dependencies** — Providers for `ApiUtils` instances and `DataSource`s.
- **Domain dependencies** — Providers for `Repository` implementations and
  `UseCase`s.

```dart
// features/home/data/dependencies/base.dart
@riverpod
ApiUtils baseapiUn(Ref ref) =>
    ApiUtils(client: ref.watch(clientProvider), host: 'kRootPathTrapi');

@riverpod
BaseDataSource baseapiUnDataSource(Ref ref) =>
    BaseDataSource(ref.read(baseapiUnProvider));

// features/home/domain/dependencies/base.dart
@riverpod
BaseRepository baseapiUnRepository(Ref ref) =>
    BaseRepository(ref.read(baseapiUnDataSourceProvider));

@riverpod
GetExampleUseCase getExampleUseCase(Ref ref) =>
    GetExampleUseCase(ref.read(baseapiUnRepositoryProvider));
```

## Adding a New Feature

1. Create `lib/features/{feature_name}/` with the three layers:
   - `data/` — `data_sources/`, `repositories/`, `dependencies/`
   - `domain/` — `use_cases/`, `repositories/` (interfaces), `dependencies/`
   - `presentation/` — `screens/`
2. Define entities/models in `lib/typing/` if shared; otherwise keep them local.
3. Register routes in `lib/ui/routes/router.dart`.
4. Run `dart run build_runner build --delete-conflicting-outputs` to generate
   providers.

## Common Commands

| Command | Description |
|---------|-------------|
| `flutter pub get` | Install dependencies |
| `dart run build_runner build --delete-conflicting-outputs` | Generate `.g.dart` files (providers, etc.) |
| `flutter analyze` | Run static analysis |
| `dart format .` | Format all Dart code |
| `flutter test` | Run tests |

## Reference

- [Clean Architecture](clean_architecture.md) — Domain, Data, Presentation layers
- [Atomic Design](atomic_design.md) — UI component hierarchy
- [Screen Structure](screen_structure.md) — Screen / State / ViewModel pattern
