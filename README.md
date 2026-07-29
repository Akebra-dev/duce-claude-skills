# Duce Atelier, Claude Skills Pack

Turn your Claude into a superhuman, in one command.

This repo installs a curated set of **Claude skills**: small packs of
instructions that teach Claude exactly how to do a job well, so instead of
guessing it follows a proven method. It is the same toolkit we use at Duce
Atelier, shared free.

---

## Install (one command)

Clone this repo, then run the installer for your system.

**Windows (PowerShell):**
```powershell
git clone https://github.com/Akebra-dev/duce-claude-skills
cd duce-claude-skills
./install.ps1
```

**Mac / Linux / Git Bash:**
```bash
git clone https://github.com/Akebra-dev/duce-claude-skills
cd duce-claude-skills
bash install.sh
```

Then **restart Claude Code**. That is it. Your skills now live in
`~/.claude/skills` and Claude will use them when a task calls for one.

To update later, `git pull` and run the installer again.

---

## What "skills" actually do

Out of the box, Claude is smart but general. A skill changes that. Think of the
difference between a talented generalist and that same person handed a company
playbook: same brain, far better output.

**Without skills**, you get good-but-generic. Ask for a landing page and you get
a workable page that looks like every other AI page.

**With skills**, Claude designs cleaner interfaces, animates properly, writes
safer code, produces real documents, and stops making the small mistakes that
add up. The output looks like a specialist made it.

You do not call skills by hand. You just work normally, and Claude loads the
right skill for the task. You can also name one ("use the duce-brand skill").

---

## What this installs

- **Duce Atelier skills** (in this repo) — starting with `duce-brand`, our exact
  design system and writing voice.
- **Curated third-party packs**, pulled from their own repositories so their
  authors keep the credit:
  - **Anthropic official** ([anthropics/skills](https://github.com/anthropics/skills)) — documents, artifacts, first-party and vetted.
  - **UI/UX Pro Max** ([nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill)) — a searchable database of UI/UX rules.
  - **Superpowers** ([obra/superpowers](https://github.com/obra/superpowers)) — engineering and workflow skills (TDD, debugging, planning, review).

See [CATALOG.md](CATALOG.md) for the full list.

---

## How to use a skill, in 30 seconds

1. Work as normal. When a task fits a skill, Claude applies it.
2. To force one, say its name: *"use the duce-brand skill for this page."*
3. Some skills need a key or a toolchain (image or video ones). They will tell
   you, and they stay dormant until you set them up.

---

## Please read once, safety

- These are community and first-party skills. **We did not write most of them**,
  and not all are reviewed. A skill can include scripts that run on your machine.
- Skim a pack before trusting it. Keep a git guardrail on. Never put API keys or
  secrets inside a skill; they belong in your environment.
- **More is not better.** A focused set you understand beats hundreds you do not.
  Install, learn a few, prune the rest.

---

Built by [Duce Atelier](https://duceatelier.com). Our own files are MIT licensed
(see [LICENSE](LICENSE)); third-party packs keep their own licences.
