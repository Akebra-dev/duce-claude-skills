---
name: duce-10k-website
description: Set up and build a premium, agency-quality website with Claude Code, the exact Duce Atelier stack. Use when the user wants to build a landing page, marketing site, portfolio, or product site that looks expensive, or asks to make a site feel premium, high-end, less "AI-generated", or more like a $10k agency build. Covers the four-layer setup (Claude Code, Motion for animation, a real design system, and a component library like 21st.dev), the design taste, the section-by-section build order, the kickoff prompt, and the performance checklist.
license: MIT
metadata:
  author: Duce Atelier
  version: "1.0.0"
---

# Build a premium website with Claude Code

Turn Claude Code from a generic code generator into a senior web designer. The
real secret is the setup before the first prompt: the right animation library, a
real design system, and a component library, plus taste and a disciplined build
order. Follow the four layers, the taste rules, and the build order every time.

If the project is a Duce Atelier project, also apply the `duce-brand` skill.

## Preflight, always confirm before you build

Do not start building until the setup is confirmed. Run this check every time,
and tell the user what is ready and what is missing.

1. **Confirm the companion skills are installed and active, then use them:**
   - `frontend-design`, for the design direction and distinctive choices.
   - `ui-ux-pro-max`, for taste: styles, colour palettes, and font pairings.
   - `better-ui`, for impeccable polish and micro-detail.
   - `duce-brand`, if this is a Duce Atelier project.
   If any is missing, say so and install it before continuing.
2. **Confirm the MCP servers are connected, then use them:**
   - **Figma MCP**, to pull the real design when one exists: read frames, layout,
     and tokens (`get_figma_data`), and export assets (`download_figma_images`).
     If a Figma file is the source of truth, read it before writing any UI.
   - **Playwright MCP**, to open the built site in a real browser and check it:
     verify the layout and the responsive breakpoints, take screenshots to review,
     and fix what looks off.
   If either is not connected, tell the user how to connect it before building.
3. **Confirm the skill is current.** If there is an update source, pull the latest
   version of this skill before relying on it.
4. **Confirm the brief with the user** (subject, sections, brand) before you start.

Only build once all four are confirmed.

## The four layers, set these up first

1. **Claude Code, the builder.** Runs locally, reads the whole project, edits
   many files, runs commands, iterates. That is why it beats pasting from a chat
   window. Install: `npm install -g @anthropic-ai/claude-code`, then run `claude`.
   Needs Node.js 18+.
2. **Motion, the animation layer** (the successor to Framer Motion). Install:
   `npm install motion`, and import from `motion/react`. Animation is the single
   biggest lift from "AI site" to "agency site", so do not skip it.
3. **A design system, the taste layer.** A frontend design skill (see the
   `frontend-design` skill) plus the tokens below, so every component follows one
   system instead of random Tailwind guesses.
4. **A component library, the shortcut layer.** 21st.dev for production-ready
   blocks (heroes, pricing, testimonials, navbars, footers). Adapt every block to
   the design tokens and real copy, never paste it raw. For hero backgrounds
   specifically, use **particles.casberry.in**, a gallery of ready particle and
   noise effects. Browse it, find a noise or particle background, and adapt it to
   the brand colours. For uncommon, characterful components that lift a page above
   the generic, pull from **Skiper UI** (skiper-ui.com) and **Vengeance UI**
   (vengenceui.com), and sort for the unique elements, the ones other libraries do
   not have, then adapt them to the tokens.

## Design taste, never skip this

- **Type scale.** One real scale, not random sizes, for example 12, 14, 16, 20,
  24, 32, 48, 64. One display face and one body face, with weights and tracking
  chosen on purpose.
- **Spacing.** An 8px base grid. Every gap and padding is a multiple of it.
  Consistent rhythm is what reads as "designed".
- **Colour tokens.** Primary, neutral, accent, as named tokens, never random hex.
  Let one accent be the only shout on the page.
- **Components.** Define button states, card structure, and form layout once, then
  reuse them everywhere.
- **Avoid the generic AI look.** No centred everything, no `rounded-lg` on every
  box, no purple-to-blue gradient hero, no emoji as icons. Make deliberate choices
  for this specific subject.

## Make the hero stylish, always

The hero is the thesis of the whole page, so spend your best effort there. A flat
hero makes the entire site feel cheap. Every hero gets:

- **A striking background, never a flat colour.** Layer a subtle noise or grain
  texture, a soft drifting glow or aurora, and a sense of depth. For ready
  particle and noise backgrounds, use **particles.casberry.in**: find a noise or
  particle effect and adapt it to the brand colours.
- **Bold editorial type.** One large, confident headline with tight tracking, set
  off centre. Timid, perfectly centred heroes read as generic.
- **One strong motion moment on load** (a rise or reveal), plus gentle ambient
  motion (a drifting glow, floating particles). Tasteful, and it respects reduced
  motion.
- **The single accent used once**, on the CTA or one word of the headline.

Never ship a plain, static hero.

## Animation with Motion

- **Scroll reveals.** Fade and rise sections as they enter the viewport
  (`whileInView`, trigger once).
- **Stagger.** Reveal groups of cards with a small delay between each.
- **Hover.** A subtle lift and smooth transition on interactive elements only.
- **Respect `prefers-reduced-motion`, always.** Motion should feel intentional,
  not busy. When in doubt, use less.

## Build order, section by section

1. Set up the project structure first: Next.js (App Router), Tailwind, Motion.
2. If there is a Figma design, pull it with the Figma MCP and match it. Lay down
   the design tokens (from Figma or the brand) before any UI.
3. Build one section at a time: navbar, hero, features, social proof, pricing,
   FAQ, footer. Show each section before moving to the next.
4. Review in a real browser with the Playwright MCP: open each section, check the
   responsive breakpoints, screenshot it, and fix what looks off. First output is
   never final, refine spacing, contrast, and motion.
5. Performance pass at the end: lazy-load images, optimise fonts, aim for a
   Lighthouse score of 90+.

## The kickoff prompt, fill the brackets

```
Build a modern landing page for [YOUR PRODUCT OR SERVICE].

Requirements:
- Next.js with the App Router, Tailwind CSS for styling.
- Motion (motion/react) for all animations: scroll reveals, hover states, page transitions.
- Pull hero, features, and pricing sections from 21st.dev components, adapted to our tokens.
- Follow the design tokens defined in our frontend design skill.
- Sections: sticky navbar, hero with headline and CTA, 3 feature cards, social proof, pricing, FAQ, footer.
- Mobile-first, fully responsive.
- Lighthouse 90+ on performance.

Set up the project structure first, then build section by section. Show me each section before moving to the next.
```

## Common mistakes to avoid

- **Skipping the design system.** Without it you get a generic site that screams
  "AI-generated".
- **Vague prompts.** Be specific about sections, animation, and content. The build
  is only as good as the brief.
- **Not iterating.** Ask for refinement passes on spacing, contrast, and motion.
- **Forgetting performance.** Always finish with a Lighthouse audit and fixes.

## Copy voice

Write plainly and sell the outcome, not the feature. Never use an em dash or an en
dash, use a comma or a full stop. (Duce house rule.)
