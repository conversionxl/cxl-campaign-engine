#!/usr/bin/env bash
# Adds the Campaign Engine module to a personal OS folder (default: the current
# folder). Mirrors "Add the module to your existing repo" in the README:
# gitignore block first, then the module files, then the CLAUDE.md section.
# Never overwrites a file that already exists. Never touches wiki/brand/.
set -e
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="${1:-$PWD}"
cd "$TARGET"
# A folder map (.claude/folders.json) sends each module file to the user's own
# folder; without one, every path below is the standard one.
. "$ROOT/.claude/hooks/lib-folders.sh"
mp() { pos_map_path "$PWD" "$1"; }
engine="$(mp projects/campaign-engine)"; board="$(pos_rel "$PWD" campaigns)"; brand="$(pos_rel "$PWD" brand-wiki)"

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
# Renamed folders get the same local-only rules, before any file lands in them.
[ -f .claude/folders.json ] && map_gi="$(bash "$ROOT/.claude/hooks/folder-map.sh" gitignore "$PWD")"

# 2. Module files, skipping anything that exists. The default gate is copied
#    into projects/campaign-engine/ so the user edits their own copy. The starter
#    workflows stay in frameworks/workflows/; /campaign-channels makes each
#    campaign's copy, and saves the user's defaults to projects/campaign-engine/workflows/.
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
         frameworks/decision-models.md frameworks/campaigns-board.md frameworks/campaign-page.md frameworks/human-checks.md \
         frameworks/campaign-page-template.html frameworks/workflows; do
  copy_tree "$p" "$(mp "$p")"
done
mkdir -p "$engine/workflows"
if [ ! -e "$engine/quality-gate.md" ]; then
  cp "$ROOT/frameworks/quality-gate.md" "$engine/quality-gate.md"
  created=$((created+1))
else kept=$((kept+1)); fi
if [ ! -e "$board/campaigns.md" ]; then
  mkdir -p "$board"
  printf -- '---\ntype: campaigns-board\nlast_updated: ""\n---\n\n# Campaigns\n\n| Campaign | Scale | Stage | KPI | Target | Actual | Dates | Channels | Gate 2 | Next |\n|---|---|---|---|---|---|---|---|---|---|\n\n## Closed\n\n| Campaign | KPI | Target | Actual | Lesson | Closed |\n|---|---|---|---|---|---|\n\n## Examples\n\n| Campaign | Scale | Stage | KPI | Target | Actual | Dates | Channels | Gate 2 | Next |\n|---|---|---|---|---|---|---|---|---|---|\n' > "$board/campaigns.md"
  created=$((created+1))
else kept=$((kept+1)); fi
if [ ! -e "$engine/campaign-engine.md" ]; then
  cp "$ROOT/projects/campaign-engine/campaign-engine.md" "$engine/campaign-engine.md"
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
[ -n "${map_gi:-}" ] && echo "$map_gi"
[ -n "${cm_new:-}" ] && echo "CLAUDE.md: $cm_new"
echo "CLAUDE.md Campaign Engine section: $cm"
echo
bash "$ROOT/plugin/find-context.sh" "$TARGET"
echo
echo "Brand: with more than one source above, the first campaign command asks once which one this folder uses and records it in CLAUDE.md. With none, the brief collects the minimum itself; the marketing-brain plugin builds a brain: /marketing-brain:setup"
[ -f .claude/personal-os.json ] || echo "Optional: the personal-os plugin adds daily logs, memory and its own commands: /personal-os:setup"
echo
echo "Next: /campaign-engine:campaign-brief example (practice on a sample company), /campaign-engine:campaign-brief practice (make one up), or /campaign-engine:campaign-brief <your campaign>."
