#!/usr/bin/env bash
# Checks a campaign page or file against the keep-it-compact skill: base template tabs,
# header length, word budgets, landing page count, iteration labels and em dashes.
#   bash page-check.sh <page.html>      a campaign page
#   bash page-check.sh <brief.md|review.md|results.md>
# Prints one line per check and exits 1 when anything is flagged.
f="${1:-}"
[ -f "$f" ] || { echo "Usage: page-check.sh <page.html | brief.md | review.md | results.md>"; exit 2; }
status=0
em=$(printf '\342\200\224')   # the em dash, written as bytes so this file has none
flag() { echo "FLAG: $*"; status=1; }
ok()   { echo "ok:   $*"; }
visible_words() { sed -E 's/data-prompt="[^"]*"//g; s/<span class="tip"[^>]*>[^<]*<\/span>//g; s/<[^>]*>/ /g' | wc -w | tr -d ' '; }
budget() { # name words max
  if [ "$2" -gt "$3" ]; then flag "$1: $2 words, budget $3. Cut the least useful lines"; else ok "$1: $2 words (budget $3)"; fi
}

case "$f" in
  *.md)
    name=$(basename "$f")
    words=$(sed -E '/^## (Sources|Evidence)/,$d' "$f" | wc -w | tr -d ' ')
    case "$name" in
      brief.md)   budget "$name before Sources" "$words" 900 ;;
      review.md)  budget "$name" "$words" 800 ;;
      results.md) budget "$name" "$words" 400 ;;
      *)          ok "$name: $words words (no budget for this file)" ;;
    esac
    grep -nE '\((changed|new)\)|· new [0-9]{1,2} [A-Z][a-z]{2}' "$f" >/dev/null && flag "$name has iteration labels like (changed) or 'new 11 Oct'. Rewrite in place"
    grep -q "$em" "$f" && flag "$name has em dashes"
    exit $status ;;
esac

flat=$(tr '\n' ' ' < "$f")

# 1. Tabs: only the base template
tabs=$(printf '%s' "$flat" | sed -E 's/.*data-group="main"//; s/<\/div>.*//' | grep -o 'data-tab="[^"]*"' | cut -d'"' -f2)
extra=""
old=""
for t in $tabs; do case "$t" in brief|touchpoints|content|workflow|results|linked) ;; channels|review) old=1 ;; *) extra="$extra $t" ;; esac; done
if [ -n "$extra" ]; then flag "tabs outside the base template:$extra. Ask the user before adding a tab"; else ok "tabs: base template only"; fi
[ -n "$old" ] && echo "note: built before 0.12.0 (Channels and Review tabs). Rebuild it on Brief, Touchpoints, Content, Workflow and Results at the next update"

# 2. Header: title to tabs
hdr=$(printf '%s' "$flat" | sed -E 's/.*<h1/<h1/; s/<div class="tabs".*//' | visible_words)
budget "header" "$hdr" 40

# 3. Tabs and channel sub-tabs
# A tab runs to its closing </section>. In Review (pages before 0.12.0), only the open grouping view counts (the switch shows one at a time).
panel() { printf '%s' "$flat" | sed -E "s/.*id=\"$1\" role=\"tabpanel\">//; s/<\/section>.*//" | perl -0pe 's/<div class="view" id="[^"]*">.*?(?=<details|$)//gs'; }
for p in brief touchpoints review results linked; do
  printf '%s' "$flat" | grep -q "id=\"$p\" role=\"tabpanel\"" || continue
  case "$p" in brief) max=800 ;; touchpoints) max=400 ;; review) max=900 ;; results) max=400 ;; linked) max=300 ;; esac
  budget "$p tab" "$(panel "$p" | visible_words)" "$max"
done
# The review summary at the top of Content is budgeted on its own; the pieces are budgeted per channel below.
if printf '%s' "$flat" | grep -q 'class="card qa-summary"'; then
  budget "review summary" "$(printf '%s' "$flat" | sed -E 's/.*class="card qa-summary">//; s/<!-- \/qa-summary -->.*//' | visible_words)" 300
fi
for sp in $(printf '%s' "$flat" | grep -oE 'class="subpanel[^"]*" id="[^"]+"' | sed -E 's/.*id="([^"]+)"/\1/'); do
  w=$(printf '%s' "$flat" | sed -E "s/.*id=\"$sp\"//; s/<div class=\"subpanel.*//; s/<section class=\"panel.*//" | visible_words)
  budget "channel $sp" "$w" 3500
done

# 4. Landing pages
lp=$(printf '%s' "$flat" | grep -oE 'class="lp-page"' | wc -l | tr -d ' ')
if [ "$lp" -gt 2 ]; then flag "$lp landing pages. One per offer, two at most; a linked campaign's pages stay in that campaign"; else ok "landing pages: $lp"; fi

# 5. Iteration labels and em dashes
printf '%s' "$flat" | grep -qE '\((changed|new)\)|· new [0-9]{1,2} [A-Z][a-z]{2}' && flag "iteration labels like (changed) or 'new 11 Oct'. Rewrite in place"
printf '%s' "$flat" | grep -q "$em" && flag "em dashes"

exit $status
