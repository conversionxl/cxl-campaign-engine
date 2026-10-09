#!/usr/bin/env bash
# Runs a question set through a decision model (Jev or Clef) and prints the answers.
#   bash decision-model.sh <jev|clef> <questions.json> <state-file>   ask the model
#   bash decision-model.sh check                                      which models are ready
# questions.json holds the "questions" object (or a file with a top-level "questions" key,
# as /quality-gate writes it). The state file is the brief or draft, as plain text.
# Keys come from the environment, else from ~/.config/decision-models.env. Never printed.
set -u
ENVF="${DECISION_MODELS_ENV:-$HOME/.config/decision-models.env}"
if [ -f "$ENVF" ]; then
  while IFS='=' read -r k v; do
    case "$k" in TYPESAFE_API_KEY|CLOUDFLARE_ACCOUNT_ID|CLOUDFLARE_AUTH_TOKEN)
      [ -n "${!k:-}" ] || export "$k=$v" ;;
    esac
  done < <(grep -E '^[A-Z_]+=' "$ENVF")
fi
command -v jq >/dev/null 2>&1 || { echo "Needs jq: brew install jq (Mac) or winget install jqlang.jq (Windows)."; exit 1; }

ready() {
  case "$1" in
    jev)  [ -n "${TYPESAFE_API_KEY:-}" ] ;;
    clef) [ -n "${CLOUDFLARE_ACCOUNT_ID:-}" ] && [ -n "${CLOUDFLARE_AUTH_TOKEN:-}" ] ;;
  esac
}

if [ "${1:-}" = check ]; then
  for m in jev clef; do
    if ready "$m"; then echo "$m: key found"; else echo "$m: no key yet (fill in $ENVF)"; fi
  done
  exit 0
fi

model="${1:-}"; qfile="${2:-}"; sfile="${3:-}"
[ -n "$model" ] && [ -f "$qfile" ] && [ -f "$sfile" ] || { echo "Usage: decision-model.sh <jev|clef> <questions.json> <state-file>"; exit 2; }
ready "$model" || { echo "$model: no key yet. Fill in $ENVF, then run again."; exit 3; }

body="$(jq -n --rawfile state "$sfile" --slurpfile q "$qfile" --arg m "$model" \
  '{state: $state, model: (if $m=="jev" then "jev-latest" else "clef" end),
    questions: ($q[0] | if has("questions") then .questions else . end)}')"

case "$model" in
  jev)  url="https://api.typesafe.ai/v1/systemone"; auth="$TYPESAFE_API_KEY" ;;
  clef) url="https://api.cloudflare.com/client/v4/accounts/$CLOUDFLARE_ACCOUNT_ID/ai/run/@cf/cloudflare/clef"; auth="$CLOUDFLARE_AUTH_TOKEN" ;;
  *) echo "Model must be jev or clef."; exit 2 ;;
esac

resp="$(curl -sS -X POST "$url" -H "Authorization: Bearer $auth" -H "Content-Type: application/json" --data-binary "$body" -w '\n%{http_code}')"
code="${resp##*$'\n'}"; json="${resp%$'\n'*}"
if [ "$code" != 200 ]; then
  echo "$model call failed (HTTP $code): $(printf '%s' "$json" | jq -r '.errors[0].message // .error.message // .message // .detail // "no message"' 2>/dev/null)"
  exit 4
fi
# Cloudflare wraps the answer in {"result": ...}; Jev returns it directly.
printf '%s' "$json" | jq '(.result // .) | {model, answers}'
