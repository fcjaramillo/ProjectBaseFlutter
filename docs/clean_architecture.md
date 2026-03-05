## Clean Architecture in Flutter

### Introduction

Clean Architecture separates concerns into layers so the codebase is easy to
understand, maintain, and test. This project applies Clean Architecture inside
each feature folder under `lib/features/`.

For implementation details, see:

- [Screen Structure](screen_structure.md) — ViewModel, State, and Screen pattern
- [Atomic Design](atomic_design.md) — UI layer organization
- [Project Architecture](project_architecture.md) — Overall project structure

### Layers of Clean Architecture

1. **Presentation Layer (UI):** User interface and presentation logic. Uses MVVM
   with ViewModel, State, and Screen. See [screen_structure.md](screen_structure.md).
2. **Domain Layer (Use Cases):** Business logic and domain rules. Use cases
   represent user interactions and orchestrate data flow.
3. **Data Layer (Repositories, Data Sources):** Handles data retrieval from APIs,
   local databases, sensors, etc. Repositories orchestrate and transform data.

### Dependency Direction

Dependencies point inward: outer layers depend on inner layers.

- **Domain** does not depend on Data or Presentation.
- **Data** depends on Domain (entities, interfaces).
- **Presentation** depends on Domain (use cases, entities).

```
Presentation → Domain ← Data
```

### Folder Structure per Feature

Each feature lives in `lib/features/{feature}/` and is split into three layers.
Shared entities, models, and enums live in `lib/typing/`.

```
lib/features/{feature}/
├── data/                    # Data layer
│   ├── data_sources/        # API calls, local DB, sensors
│   ├── repositories/        # Repository implementations
│   └── dependencies/        # Riverpod providers for data-layer DI
├── domain/                  # Domain layer
│   ├── use_cases/           # Business logic (one class per operation)
│   ├── repositories/        # Repository interfaces (abstract classes)
│   └── dependencies/        # Riverpod providers for domain-layer DI
└── presentation/            # Presentation layer
    ├── screens/             # Screens (Screen + State + ViewModel)
    └── dependencies/        # Optional presentation-level providers
```

### Data Layer Details

#### Data Sources

- **API:** HTTP requests via `ApiUtils` (wraps Dio). Converts responses into
  DTOs/models.
- **Local Data Source:** Device database, secure storage, sensors. Converts data
  into models in this layer.

```dart
// lib/features/home/data/data_sources/base_data_source.dart
class BaseDataSource {
  BaseDataSource(this._apiUtils);
  final ApiUtils _apiUtils;

  Future<ResultDef<bool>> getExample() async {
    ResultDef<dynamic> result = await _apiUtils.makeRequest(
      method: MethodApi.get,
      path: '/rickandmortyapi.com/api/character',
    );
    return result.when(
      fail: Fail.new,
      success: (dynamic success) => ResultDef<bool>.success(true),
    );
  }
}
```

#### Repository

- Single entry point for data from different sources.
- Converts data source models into domain entities.
- Implements interfaces defined in the domain layer.

```dart
// lib/features/home/data/repositories/base.dart
class BaseRepository implements IBaseRepository {
  BaseRepository(this._baseDataSource);
  final BaseDataSource _baseDataSource;

  @override
  Future<ResultDef<bool>> getExample() async {
    final result = await _baseDataSource.getExample();
    return result.when(
      fail: Fail.new,
      success: (bool success) => ResultDef<bool>.success(true),
    );
  }
}
```

### Domain Layer Details

#### Entities

- Pure business objects with application-specific logic.
- Shared across the project via `lib/typing/entities/`.
- Include `copyWith` for immutable updates in the presentation layer.

#### Repository Interfaces

- Abstract classes that define the contract for repositories.
- Live in `lib/features/{feature}/domain/repositories/`.

```dart
// lib/features/home/domain/repositories/ibase.dart
abstract class IBaseRepository {
  Future<ResultDef<bool>> getExample();
}
```

#### Use Cases

- Encapsulate a single business operation.
- Receive repositories via constructor injection.
- Return `ResultDef<T>` or `FutureResult<T>` for success/error handling.
- Injected via Riverpod in `dependencies/` and consumed by ViewModels.

```dart
// lib/features/home/domain/use_cases/get_example.dart
class GetExampleUseCase {
  final IBaseRepository _iBaseRepository;
  GetExampleUseCase(this._iBaseRepository);

  Future<ResultDef<bool>> call() => _iBaseRepository.getExample();
}
```

### Dependency Injection with Riverpod

Each layer has a `dependencies/` folder with providers generated via
`riverpod_generator`. The wiring follows the dependency direction:

```dart
// Data layer: provides DataSource
@riverpod
BaseDataSource baseapiUnDataSource(Ref ref) =>
    BaseDataSource(ref.read(baseapiUnProvider));

// Domain layer: provides Repository and UseCase
@riverpod
BaseRepository baseapiUnRepository(Ref ref) =>
    BaseRepository(ref.read(baseapiUnDataSourceProvider));

@riverpod
GetExampleUseCase getExampleUseCase(Ref ref) =>
    GetExampleUseCase(ref.read(baseapiUnRepositoryProvider));
```

Run `dart run build_runner build --delete-conflicting-outputs` to generate the
`.g.dart` files.

### Presentation Layer with MVVM

#### MVVM (Model-View-ViewModel)

- **Model (State + Entities):** State class holds UI state; entities come from
  the domain layer.
- **View (Screen):** UI built with Atomic Design (atoms, molecules, organisms,
  templates).
- **ViewModel:** Connects Model and View. Calls use cases via `ref.read()`,
  updates state, and handles `UIEvent` for loading, navigation, and errors.

See [screen_structure.md](screen_structure.md) for the full Screen/State/ViewModel
pattern.

#### Error Handling

- Use cases return `ResultDef<T>`.
- ViewModels handle success/failure with `.when(fail: ..., success: ...)`.
- `UIEvent` in state drives loading, navigation, and snackbars. See
  [screen_structure.md](screen_structure.md).

### Data Flow

```
API / Local DB → Data Source → Repository → Use Case → ViewModel → Screen
                    ↓              ↓            ↓           ↓
                 Models      Entities      ResultDef   State + UIEvent
```
