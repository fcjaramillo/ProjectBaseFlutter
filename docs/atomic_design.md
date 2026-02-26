### Atomic Design in Flutter

Atomic Design is a methodology that organizes the user interface into layers,
from the simplest elements to complete pages. In Flutter, this methodology is
implemented through the following structure:

1. **Ions:** UI constants such as Colors or Layouts.
2. **Atoms:** The most basic and simple elements.
3. **Molecules:** Groups of atoms that work together to perform a specific
   function.
4. **Organisms:** More complex components, built from atoms and molecules.
5. **Templates:** Complete designs built from smaller components.
6. **Screens:** The complete screens of the application, built from templates
   and components.

## UI Sources

This project is a monolith. All shared UI lives in `lib/ui/`; feature-specific
UI lives inside each feature's `presentation/` folder.

### Shared UI (`lib/ui/`)

- **`ions/`** — UI constants (colors, layout, padding, typography, SVGs,
  animations, etc.). Lives at the root level of `ui/`, outside `widgets`.
  Cannot contain widgets, only constant definitions.
- **`widgets/`** — Shared atoms, molecules, organisms, and templates used
  across multiple features.

```
lib/ui/
├── ions/           # Constants (layout, colors, typography, svgs, etc.)
│   ├── layout.dart
│   ├── padding.dart
│   ├── semantic_colors.dart
│   ├── typography.dart
│   └── ...
└── widgets/        # Shared atoms, molecules, organisms, templates
    ├── atoms/
    ├── molecules/
    ├── organisms/
    └── templates/
```

### Feature-specific UI

Located in `lib/features/{feature}/presentation/`:

- **Screens** — Only defined inside features, never in `lib/ui/`.
- Features import shared components from `lib/ui/widgets/` when needed.
- If a feature needs a component that is not reusable, it can define its own
  atoms, molecules, organisms, or templates inside its `presentation/` folder.

```
lib/features/{feature}/presentation/
├── screens/        # Feature screens only
├── atoms/          # (Optional) feature-specific atoms
├── molecules/      # (Optional) feature-specific molecules
├── organisms/      # (Optional) feature-specific organisms
└── templates/      # (Optional) feature-specific templates
```

### Usage Rules

- Prefer `lib/ui/widgets/` for reusable UI; add to a feature only when it is
  specific to that feature.
- Ions are always in `lib/ui/ions/`.
- Screens live only in `lib/features/{feature}/presentation/screens/`.

## Atomic Design Architecture Rules in Flutter

Ions (Constants) → Atoms → Molecules → Organisms → Templates → Screens

## 1. Ions

- Live in `lib/ui/ions/`.
- Only contain application constants: colors, padding, layouts, typography,
  SVGs, animations, etc.
- Cannot contain any widgets, only constant definitions.

## 2. Atoms

- Indivisible and simple widgets.
- Can be composed of constants defined in the Ions layer.
- Limited to Stateless and Stateful widgets.

## 3. Molecules

- Composed of a maximum of five atoms.
- Cannot contain Rows, Columns, or Stacks simultaneously.
- The use of scroll widgets such as ListView or Slivers is not allowed.
- Cannot contain other molecules; if more composition is needed, create an
  Organism.
- Limited to Stateless and Stateful widgets.

## 4. Organisms

- Can contain at most one other organism.
- If more elements need to be combined, unify them in a Template.
- Limited to Stateless and Stateful widgets.

## 5. Templates

- Composed solely of organizational widgets.
- Do not contain business logic.
- Used to combine organisms into a larger structure.
- Limited to Stateless and Stateful widgets.

## 6. Screens

- Reserved for application screens. Live only in
  `lib/features/{feature}/presentation/screens/`.
- Can contain `Scaffold` and are the only place where Riverpod for state
  management is allowed.

## 7. Folders and Structure

- Each layer (Ions, Atoms, Molecules, Organisms, Templates, Screens) has its
  own folder.
- **Shared:** Ions in `lib/ui/ions/`; widgets in
  `lib/ui/widgets/{atoms|molecules|organisms|templates}/`.
- **Features:** Screens in
  `lib/features/{feature}/presentation/screens/`. Optional local widgets
  in `lib/features/{feature}/presentation/{atoms|molecules|organisms|templates}/`.
- Each workflow (e.g. Wallet, Login) has its own subfolder within each
  Atomic Design layer.
- If a widget is used in different workflows, place it in a folder called
  **"Cross"** for reusability.

These rules ensure an organized and modular structure, facilitating
maintainability and scalability. The separation of responsibilities between
layers and the folder structure provides a clear and efficient workflow for
Flutter UI development.
