# Duce Atelier, Claude skills installer (Windows PowerShell).
# Installs Duce's own skills, then pulls curated skill packs from their
# original sources into ~/.claude/skills. Re-run anytime to update.
$ErrorActionPreference = "Stop"

$dest = Join-Path $HOME ".claude\skills"
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
New-Item -ItemType Directory -Force -Path $dest | Out-Null

Write-Host "==> Installing Duce Atelier skills into $dest"
Copy-Item -Recurse -Force (Join-Path $here "skills\*") $dest -ErrorAction SilentlyContinue

# Curated, verified public packs. Each keeps its own upstream licence.
$upstreams = @(
  "https://github.com/anthropics/skills",
  "https://github.com/nextlevelbuilder/ui-ux-pro-max-skill",
  "https://github.com/obra/superpowers"
)

$tmp = Join-Path $env:TEMP ("duce-skills-" + [guid]::NewGuid().ToString("N"))
New-Item -ItemType Directory -Force -Path $tmp | Out-Null
foreach ($repo in $upstreams) {
  $name = Split-Path $repo -Leaf
  Write-Host "==> Fetching $name"
  try { git clone --depth 1 -q $repo (Join-Path $tmp $name) } catch { Write-Host "    (skipped)"; continue }
  Get-ChildItem -Path (Join-Path $tmp $name) -Recurse -Filter SKILL.md -ErrorAction SilentlyContinue |
    Where-Object { $_.FullName -notmatch "node_modules" } |
    ForEach-Object { Copy-Item -Recurse -Force $_.Directory.FullName $dest -ErrorAction SilentlyContinue }
}
Remove-Item -Recurse -Force $tmp -ErrorAction SilentlyContinue

Write-Host ""
Write-Host "Done. Restart Claude Code so it loads the new skills."
Write-Host "Tip: fewer skills you understand beat hundreds you do not. Prune what you will not use."
