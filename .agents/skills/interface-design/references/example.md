# Craft in Action (Flutter)

This shows how the subtle layering principle translates to real Flutter decisions. Learn the thinking, not the code. Your values will differ — the approach won't.

---

## The Subtle Layering Mindset

Before looking at any example, internalize this: **you should barely notice the system working.**

When you look at Vercel's dashboard, you don't think "nice borders." You just understand the structure. When you look at Supabase, you don't think "good surface elevation." You just know what's above what. The craft is invisible — that's how you know it's working.

---

## Example: Dashboard with Sidebar and Dropdown

### The Surface Decisions (Flutter)

**Why so subtle?** Each elevation jump should be only a few percentage points of lightness. Use `colorScheme.surfaceContainerLowest` → `surfaceContainer` → `surfaceContainerHigh`. You can barely see the difference in isolation. But when surfaces stack, the hierarchy emerges. Whisper-quiet shifts that you feel rather than see.

**What NOT to do:** Don't make dramatic jumps between elevations. Don't use different hues for different levels. Keep the same hue, shift only lightness.

### The Border Decisions

**Why `withOpacity(0.05)` to `0.12`, not solid colors?** Low opacity borders blend with their background. `colorScheme.outline.withOpacity(0.08)` on a dark surface is barely there — it defines the edge without demanding attention. Solid `Colors.grey` borders look harsh.

**The test:** Look at your interface from arm's length. If borders are the first thing you notice, reduce opacity. If you can't find where regions end, increase slightly.

### The Sidebar Decision

**Why same background as canvas, not different?**

Many dashboards make the sidebar a different color. This fragments the visual space — now you have "sidebar world" and "content world."

Better: Same `colorScheme.surface` for both `Drawer`/`NavigationRail` and main content. Use `VerticalDivider` or `Border` for separation. The sidebar is part of the app, not a separate region.

### The Dropdown Decision

**Why `surfaceContainerHigh`, not `surfaceContainerLowest`?**

The dropdown floats above the card it emerged from. If both used the same surface, the dropdown would blend in — you'd lose the sense of layering. Use `Material(elevation: 2)` or `surfaceContainerHigh` so it feels "above" without being dramatically different.

**Why slightly stronger border on overlays?**

Overlays (dropdowns, popovers) often need slightly more definition because they're floating in space. Use `BorderSide` with `withOpacity(0.12)` instead of `0.08` to help them feel contained without being harsh.

---

## Example: Form Controls

### Input Background Decision

**Why darker, not lighter?**

Inputs are "inset" — they receive content, they don't project it. Use `InputDecorationTheme` with `fillColor: colorScheme.surfaceContainerHighest` — a slightly darker background signals "type here" without needing heavy borders.

### Focus State Decision

**Why subtle focus states?**

Focus needs to be visible, but you don't need a glowing ring or dramatic color. Use `focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: primary.withOpacity(0.6)))` — a noticeable increase in border opacity is enough. Subtle-but-noticeable — the same principle as surfaces.

---

## Adapt to Context

Your product might need:
- Warmer hues (slight yellow/orange tint in `ColorScheme`)
- Cooler hues (blue-gray base)
- Different lightness progression
- Light mode (principles invert — higher elevation = `BoxShadow`, not lightness)

**The principle is constant:** barely different, still distinguishable. The values adapt to context.

---

## The Craft Check

Apply the squint test to your work:

1. Blur your eyes or step back
2. Can you still perceive hierarchy?
3. Is anything jumping out at you?
4. Can you tell where regions begin and end?

If hierarchy is visible and nothing is harsh — the subtle layering is working.
