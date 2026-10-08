#!/usr/bin/env bash
# Finds the context the Campaign Engine reads but does not own: brand docs from
# this folder or from other installed plugins, and daily logs from the personal
# OS. Read only: it never copies, moves or writes anything.
#   bash find-context.sh [folder]     folder defaults to $CLAUDE_PROJECT_DIR, then the current folder
# Prints a short Markdown report the commands act on.
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="${1:-${CLAUDE_PROJECT_DIR:-$PWD}}"
command -v cygpath >/dev/null 2>&1 && TARGET="$(cygpath -u "$TARGET" 2>/dev/null || printf '%s' "$TARGET")"
cd "$TARGET" 2>/dev/null || { echo "Folder not found: $TARGET"; exit 0; }

# The folder map (renamed folders), from this folder or from the plugin.
LIB=""
for f in "$TARGET/.claude/hooks/lib-folders.sh" "$ROOT/.claude/hooks/lib-folders.sh"; do
  [ -f "$f" ] && { LIB="$f"; break; }
done
if [ -n "$LIB" ]; then
  . "$LIB"
  brand_rel="$(pos_rel "$TARGET" brand-wiki)"
  logs_rel="$(pos_rel "$TARGET" daily-logs)"
else
  brand_rel="wiki/brand"; logs_rel="daily-logs"
fi

# A brand folder counts when it holds the four brand-brain files.
FILES="icp positioning-messaging voice-guide vocabulary"
brand_row() {  # <label> <path>
  local d="$2" f st have=0 out=""
  for f in $FILES; do
    if [ -f "$d/$f.md" ]; then
      have=$((have+1))
      st="$(sed -n 's/^status:[[:space:]]*\([a-z]*\).*/\1/p' "$d/$f.md" | head -1)"
      out="$out $f:${st:-unknown}"
    else
      out="$out $f:missing"
    fi
  done
  [ "$have" -gt 0 ] && printf '| %s | `%s` |%s |\n' "$1" "$d" "$out"
}

echo "## Campaign Engine: context found"
echo
echo "### Brand docs"
echo
echo "| Source | Folder | Files and status |"
echo "|---|---|---|"
rows=""
r="$(brand_row "This folder" "$TARGET/$brand_rel")"; rows="$rows$r"; [ -n "$r" ] && echo "$r"

# Other installed plugins (Claude Code keeps the list in installed_plugins.json).
REG="$HOME/.claude/plugins/installed_plugins.json"
if [ -f "$REG" ] && command -v jq >/dev/null 2>&1; then
  jq -r '.plugins | to_entries[] | "\(.key)\t\((.value | if type=="array" then .[0] else . end).installPath // "")"' "$REG" 2>/dev/null |
  while IFS="$(printf '\t')" read -r name path; do
    [ -n "$path" ] && [ -d "$path" ] || continue
    [ "$path" = "$ROOT" ] && continue
    for sub in brand wiki/brand; do
      r="$(brand_row "Plugin $name" "$path/$sub")"; [ -n "$r" ] && echo "$r"
    done
  done
fi
# A brain in another folder, recorded once in CLAUDE.md as "Brand source: <path>".
rec="$(sed -n 's/^\*\*Brand source:\*\*[[:space:]]*`\{0,1\}\([^`]*\)`\{0,1\}.*/\1/p' CLAUDE.md 2>/dev/null | head -1)"
[ -n "$rec" ] && [ -d "$rec" ] && brand_row "Recorded folder" "$rec"
case "$rec" in ""|"not chosen"*) echo; echo "No brand source recorded in CLAUDE.md yet." ;; *) echo; echo "Recorded in CLAUDE.md: **Brand source:** $rec" ;; esac

echo
echo "### Daily logs"
echo
logs="$TARGET/$logs_rel"
rec_logs="$(sed -n 's/^\*\*Daily logs:\*\*[[:space:]]*`\{0,1\}\([^`]*\)`\{0,1\}.*/\1/p' CLAUDE.md 2>/dev/null | head -1)"
[ -n "$rec_logs" ] && [ -d "$rec_logs" ] && logs="$rec_logs"
n=0
[ -d "$logs" ] && n="$(ls "$logs" 2>/dev/null | grep -cE '^[0-9]{4}-[0-9]{2}-[0-9]{2}.*\.md$')"
if [ "$n" -gt 0 ]; then
  newest="$(ls "$logs" | grep -E '^[0-9]{4}-[0-9]{2}-[0-9]{2}.*\.md$' | sort | tail -1)"
  oldest="$(ls "$logs" | grep -E '^[0-9]{4}-[0-9]{2}-[0-9]{2}.*\.md$' | sort | head -1)"
  echo "\`$logs\`: $n logs, ${oldest%%-convo.md} to ${newest%%-convo.md}."
else
  echo "None in \`$logs\`."
  [ -f .claude/personal-os.json ] || echo "No personal OS in this folder. If one lives elsewhere, the commands ask once where."
fi
exit 0
