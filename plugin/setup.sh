#!/usr/bin/env bash
# Adds the Campaign Engine module to a personal OS folder (default: the current
# folder). Mirrors "Add the module to your existing repo" in the README:
# gitignore block first, then the module files, then the CLAUDE.md section.
# Never overwrites a file that already exists. Never touches wiki/brand/.
set -e
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="${1:-$PWD}"
cd "$TARGET"

# No personal OS here? Start a minimal CLAUDE.md so the module still works.
if [ ! -f CLAUDE.md ]; then
  printf '# CLAUDE.md\n\nInstructions Claude reads in this folder.\n' > CLAUDE.md
  cm_new="created (no personal OS here; the Campaign Engine works on its own)"
fi

# 1. Campaign inputs stay local: the gitignore block goes in BEFORE raw/campaigns/.
touch .gitignore
if ! grep -qx 'raw/campaigns/\*' .gitignore; then
  printf '\n' >> .gitignore
  if grep -qx 'raw/voc/\*' .gitignore; then
    # Marketing Brain already guards voc, strategy and performance: add only the campaigns lines.
    sed -n '1,/^$/p' "$ROOT/plugin/gitignore-block.txt" >> .gitignore
  else
    cat "$ROOT/plugin/gitignore-block.txt" >> .gitignore
  fi
  gi="added"
else
  gi="already there"
fi

# 2. Module files, skipping anything that exists. The starter workflows and the
#    default gate are copied into projects/campaign-engine/ so the user edits
#    their own copies; the frameworks/ originals stay as the reference.
created=0; kept=0
copy_tree() {
  if [ -f "$ROOT/$1" ]; then
    if [ -e "$2" ]; then kept=$((kept+1)); else mkdir -p "$(dirname "$2")"; cp "$ROOT/$1" "$2"; created=$((created+1)); fi
    return
  fi
  while IFS= read -r -d '' src; do
    rel="${src#"$ROOT/$1/"}"
    dest="$2/$rel"
    if [ -e "$dest" ]; then kept=$((kept+1)); continue; fi
    mkdir -p "$(dirname "$dest")"
    cp "$src" "$dest"
    created=$((created+1))
  done < <(find "$ROOT/$1" -type f -print0)
}
for p in raw/campaigns raw/voc raw/brand raw/strategy raw/performance projects/campaigns \
         frameworks/campaign-brief-template.md frameworks/workflow-format.md \
         frameworks/campaign-inputs.md frameworks/quality-gate.md \
         frameworks/decision-models.md frameworks/workflows; do
  copy_tree "$p" "$p"
done
copy_tree "frameworks/workflows" "projects/campaign-engine/workflows"
if [ ! -e projects/campaign-engine/quality-gate.md ]; then
  mkdir -p projects/campaign-engine
  cp "$ROOT/frameworks/quality-gate.md" projects/campaign-engine/quality-gate.md
  created=$((created+1))
else kept=$((kept+1)); fi
if [ ! -e projects/campaign-engine/campaign-engine.md ]; then
  cp "$ROOT/projects/campaign-engine/campaign-engine.md" projects/campaign-engine/campaign-engine.md
  created=$((created+1))
else kept=$((kept+1)); fi

# 3. The Campaign Engine section in CLAUDE.md, once.
if grep -q '^## Campaign Engine' CLAUDE.md; then
  cm="already there"
else
  cat "$ROOT/plugin/claude-md-section.md" >> CLAUDE.md
  cm="added"
fi

echo "Folder: $TARGET"
echo ".gitignore block: $gi"
echo "Files created: $created. Existing files kept: $kept."
[ -n "${cm_new:-}" ] && echo "CLAUDE.md: $cm_new"
echo "CLAUDE.md Campaign Engine section: $cm"
if [ -d wiki/brand ]; then
  echo "Brand brain: wiki/brand/ found. The engine will read it."
else
  echo "Brand brain: no wiki/brand/ here. The engine works without it; the brief collects the minimum itself. The marketing-brain plugin builds one: /marketing-brain:setup"
fi
[ -f .claude/personal-os.json ] || echo "Optional: the personal-os plugin adds daily logs, memory and its own commands: /personal-os:setup"
