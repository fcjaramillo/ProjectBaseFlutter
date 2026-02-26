# Core Craft Principles (Flutter)

These apply regardless of design direction. This is the quality floor.

---

## Surface & Token Architecture

Professional Flutter interfaces don't pick colors randomly — they build systems. Use `ThemeData`, `ColorScheme`, and `ThemeExtension`. Understanding this architecture is the difference between "looks okay" and "feels like a real product."

### The Primitive Foundation

Every color in your interface should trace back to a small set of primitives in `ColorScheme` or `AppColors`:

- **Foreground** — `colorScheme.onSurface`, `onSurfaceVariant`, `outline`
- **Background** — `colorScheme.surface`, `surfaceContainerLowest` … `surfaceContainerHigh`
- **Border** — `colorScheme.outline` with `withOpacity(0.05)` … `0.12`
- **Brand** — `colorScheme.primary`
- **Semantic** — `colorScheme.error`, custom `success`, `warning` in `ThemeExtension`

Don't invent new colors. Map everything to these primitives.

### Surface Elevation Hierarchy

Surfaces stack. A dropdown sits above a card which sits above the page. Build a numbered system:

```
Level 0: Scaffold background (colorScheme.surface)
Level 1: Cards, panels (surfaceContainerLowest / surfaceContainer)
Level 2: Dropdowns, popovers (Material elevation: 2, surfaceContainerHigh)
Level 3: Nested dropdowns, dialogs (elevation: 4–6)
Level 4: Highest elevation (elevation: 8, rare)
```

In dark mode, higher elevation = slightly lighter (`surfaceContainerHigh`). In light mode, use `BoxShadow` or `Material.elevation`. The principle: **elevated surfaces need visual distinction from what's beneath them.**

### The Subtlety Principle

This is where most interfaces fail. Study Vercel, Supabase, Linear — their surfaces are **barely different** but still distinguishable. Their borders are **light but not invisible**.

**For surfaces:** The difference between elevation levels should be subtle — a few percentage points of lightness, not dramatic jumps. In dark mode, surface-100 might be 7% lighter than base, surface-200 might be 9%, surface-300 might be 12%. You can barely see it, but you feel it.

**For borders:** Borders should define regions without demanding attention. Use `BorderSide(color: colorScheme.outline.withOpacity(0.05))` to `0.12`. The border should disappear when you're not looking for it, but be findable when you need to understand the structure.

**The test:** Squint at your interface. You should still perceive the hierarchy — what's above what, where regions begin and end. But no single border or surface should jump out at you. If borders are the first thing you notice, they're too strong. If you can't find where one region ends and another begins, they're too subtle.

**Common AI mistakes to avoid:**
- Borders that are too visible (`BorderSide(color: Colors.grey)` instead of `withOpacity(0.08)`)
- Surface jumps that are too dramatic (going from dark to light instead of dark to slightly-less-dark)
- Using different hues for different surfaces (gray card on blue background)
- Harsh dividers where subtle `Divider` or `Border` would do

### Text Hierarchy via Tokens

Don't just have "text" and "gray text." Build four levels:

- **Primary** — default text, highest contrast
- **Secondary** — supporting text, slightly muted
- **Tertiary** — metadata, timestamps, less important
- **Muted** — disabled, placeholder, lowest contrast

Use all four consistently. If you're only using two, your hierarchy is too flat.

### Border Progression

Borders aren't binary. Build a scale:

- **Default** — standard borders
- **Subtle/Muted** — softer separation
- **Strong** — emphasis, hover states
- **Stronger** — maximum emphasis, focus rings

Match border intensity to the importance of the boundary.

### Dedicated Control Tokens

Form controls (inputs, checkboxes, selects) have specific needs. Use `InputDecorationTheme`, `CheckboxThemeData`, `DropdownThemeData`:

- **Control background** — `InputDecorationTheme.filled` with `fillColor`
- **Control border** — `InputDecorationTheme.border`, `OutlineInputBorder`
- **Control focus** — `FocusNode`, `InputDecorationTheme.focusedBorder`

This separation lets you tune controls independently from layout surfaces.

### Context-Aware Bases

Different areas of your app might need different base surfaces:

- **Marketing pages** — might use darker/richer `Scaffold.backgroundColor`
- **Dashboard/app** — might use neutral `colorScheme.surface`
- **NavigationRail / Drawer** — same background as main content, subtle border

The surface hierarchy works the same way — it just starts from a different base.

### Alternative Backgrounds for Depth

Beyond shadows, use contrasting backgrounds to create depth. Use `surfaceContainerHighest` or `surfaceContainerHigh` for inset content:

- Empty states in `DataTable` / `ListView`
- `Container` with `decoration` for code blocks
- Inset panels
- Visual grouping without borders

---

## Spacing System

Pick a base unit (4px and 8px are common) and use multiples throughout. Use `Layout` or similar ions in `lib/ui/ions/`. Every spacing value should be explainable as "X times the base unit."

Build a scale for different contexts:
- Micro spacing (`Layout.spaceXS` — icon gaps, tight element pairs)
- Component spacing (`Layout.spaceS`, `spaceM` — within buttons, inputs, cards)
- Section spacing (`Layout.spaceL`, `spaceXL` — between related groups)
- Major separation (`Layout.spaceXXL` — between distinct sections)

Use `EdgeInsets.all()`, `SizedBox`, `Gap`. Random values signal no system.

## Symmetrical Padding

TLBR must match. Use `EdgeInsets.all(Layout.spaceML)` or `EdgeInsets.symmetric()`. Exception: when content naturally creates visual balance.

```dart
// Good
padding: BasePadding.padding_16;
padding: EdgeInsets.symmetric(vertical: Layout.spaceM, horizontal: Layout.spaceML);

// Bad
padding: EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 12); // Asymmetric without reason
```

## Border Radius Consistency

Sharper corners feel technical, rounder corners feel friendly. Pick a scale in ions and use it consistently.

The key is having a system: small radius for inputs and buttons (`BorderRadius.circular(4)`), medium for cards (`8`), large for modals (`12`). Don't mix sharp and soft randomly — inconsistent radius is as jarring as inconsistent spacing.

## Depth & Elevation Strategy

Match your depth approach to your design direction. Choose ONE and commit:

**Borders-only (flat)** — Clean, technical, dense. Use `BoxDecoration` with `border` only, no `boxShadow`. Works for utility-focused tools where information density matters more than visual lift.

**Subtle single shadows** — Soft lift without complexity. A simple `BoxShadow` with `blurRadius: 3`, `color: Colors.black.withOpacity(0.08)` can be enough. Works for approachable products that want gentle depth.

**Layered shadows** — Rich, premium, dimensional. Multiple `BoxShadow` in `BoxDecoration.boxShadow`. Best for cards that need to feel like physical objects.

**Surface color shifts** — Use `ColorScheme.surfaceContainerLowest` through `surfaceContainerHigh`. Background tints establish hierarchy without any shadows.

```dart
// Borders-only approach
decoration: BoxDecoration(
  color: colorScheme.surfaceContainerLowest,
  border: Border.all(
    color: colorScheme.outline.withOpacity(0.08),
    width: 0.5,
  ),
  borderRadius: BorderRadius.circular(8),
);

// Single shadow approach
decoration: BoxDecoration(
  color: colorScheme.surface,
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.08),
      blurRadius: 3,
      offset: const Offset(0, 1),
    ),
  ],
  borderRadius: BorderRadius.circular(8),
);

// Layered shadow approach
boxShadow: [
  BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 0, spreadRadius: 0.5),
  BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 2, offset: const Offset(0, 1)),
  BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 4, offset: const Offset(0, 2)),
  BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 8, offset: const Offset(0, 4)),
],
```

## Card Layouts

Monotonous card layouts are lazy design. A metric card doesn't have to look like a plan card doesn't have to look like a settings card.

Design each card's internal structure for its specific content — but keep the surface treatment consistent: same `BoxDecoration`, border weight, shadow depth, corner radius, padding scale, typography.

## Isolated Controls

UI controls deserve container treatment. Date pickers, filters, dropdowns — these should feel like crafted objects.

**Use Flutter widgets with Theme overrides.** For full control:

- `DropdownButtonFormField` / `PopupMenuButton` — wrap with `Theme` for styling
- `showDatePicker` — use `Material` or `Cupertino` theme
- `Checkbox`, `Radio`, `Switch` — use `CheckboxThemeData`, `RadioThemeData`, `SwitchThemeData`

Custom components: `InkWell` + `showModalBottomSheet` for custom pickers, `Material` with `InkWell` for dropdown triggers. Use `Row` with `mainAxisSize: MainAxisSize.min` to keep text and `Icon` on the same row.

## Typography Hierarchy

Build distinct levels with `TextTheme` that are visually distinguishable at a glance:

- **Headlines** — `displayLarge`, `displayMedium` with `FontWeight.w600`, tighter `letterSpacing`
- **Body** — `bodyLarge`, `bodyMedium` with comfortable weight
- **Labels/UI** — `labelMedium`, `labelSmall` with `FontWeight.w500`
- **Data** — `fontFamily` monospace, `fontFeatures: [FontFeature.tabularFigures()]`

Don't rely on size alone. Combine size, weight, and letter-spacing to create clear hierarchy. If you squint and can't tell headline from body, the hierarchy is too weak.

## Monospace for Data

Numbers, IDs, codes, timestamps belong in monospace. Use `FontFeature.tabularFigures()` for columnar alignment. Mono signals "this is data."

## Iconography

Icons clarify, not decorate — if removing an icon loses no meaning, remove it. Choose a consistent icon set (`MaterialIcons`, `Icons`, `LucideIcons`) and stick with it throughout the product.

Give standalone icons presence with `Container` or `CircleAvatar` with subtle background. Icons next to text: use `Row` with `Icon` and `SizedBox` for spacing.

## Animation

Keep it fast and functional. Micro-interactions (hover, focus) should feel instant — `Duration(milliseconds: 150)`. Larger transitions (modals, panels) can be slightly longer — 200-250ms.

Use smooth deceleration easing (`Curves.easeOut`, `CurvedAnimation`). Avoid `Curves.elasticOut` in professional interfaces — they feel playful, not serious.

## Contrast Hierarchy

Build a four-level system: foreground (primary) → secondary → muted → faint. Use all four consistently.

## Color Carries Meaning

Gray builds structure. Color communicates — status, action, emphasis, identity. Unmotivated color is noise. Color that reinforces the product's world is character.

## Navigation Context

Screens need grounding. A data table floating in space feels like a component demo, not a product. Consider including:

- **Navigation** — `NavigationBar`, `NavigationRail`, `Drawer`, or `Scaffold` with `AppBar`
- **Location indicator** — breadcrumbs, `AppBar.title`, active `NavigationDestination` state
- **User context** — `Avatar`, `UserAccountsDrawerHeader`, workspace/org indicator

When building sidebars, use the same `colorScheme.surface` for `Drawer` and main content. Rely on `Border` or `VerticalDivider` for separation rather than different background colors.

## Dark Mode

Dark interfaces have different needs. Use `ThemeData.dark()` and `ColorScheme.dark()`:

**Borders over shadows** — Shadows are less visible on dark backgrounds. Lean more on `BorderSide` for definition.

**Adjust semantic colors** — Status colors (success, warning, error) often need to be slightly desaturated for dark backgrounds.

**Same structure, different values** — The hierarchy system still applies, just with inverted values.
