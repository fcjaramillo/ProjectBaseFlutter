# Memory Management

When and how to update `.interface-design/system.md` or `docs/design_system.md`.

## When to Add Patterns

Add to system.md when:
- Widget/component used 2+ times
- Pattern is reusable across the project
- Has specific measurements worth remembering (Layout, BasePadding, radius)

## Pattern Format

```markdown
### Button Primary
- Height: 36
- Padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12)
- Radius: BorderRadius.circular(6)
- TextStyle: 14, FontWeight.w500
```

## Don't Document

- One-off widgets
- Temporary experiments
- Variations better handled with parameters

## Pattern Reuse

Before creating a widget, check system.md:
- Pattern exists? Use it.
- Need variation? Extend, don't create new.

Memory compounds: each pattern saved makes future work faster and more consistent.

---

# Validation Checks (Flutter)

If system.md defines specific values, check consistency:

**Spacing** — All values use `Layout.space*` or multiples of the defined base?

**Depth** — Using the declared strategy throughout? (borders-only means no `BoxShadow`)

**Colors** — Using `Theme.of(context).colorScheme`, `AppColors`, not random `Color(0xFF...)`?

**Patterns** — Reusing documented widgets from `lib/ui/widgets/` instead of creating new?
