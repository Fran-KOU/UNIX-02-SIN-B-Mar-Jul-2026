#!/usr/bin/env bash
# =============================================================================
#  score_blackhatbash.sh
#  Grades the 'blackhatbash' branch from 1 to 100
#
#  Criteria:
#    - Number of commits                  (30 pts)
#    - Commit time between 7am-9am ECT    (40 pts)
#    - Message quality (in English)       (30 pts)
#
#  Usage:  bash score_blackhatbash.sh [repo_path]
# =============================================================================

# Exit immediately if a command exits with a non-zero status, treat unset variables as an error, and catch pipe failures.
set -euo pipefail

# ── colors ──────────────────────────────────────────────────────────────────
RED='\033[0;31m'; YELLOW='\033[1;33m'; GREEN='\033[0;32m'
CYAN='\033[0;36m'; BOLD='\033[1m'; RESET='\033[0m'

BRANCH="blackhatbash"
# Use the provided argument as the directory, or default to the current directory ('.')
REPO_DIR="${1:-.}"

# ── helpers ───────────────────────────────────────────────────────────────────
# UI functions to print formatted messages to the console
header() { echo -e "\n${BOLD}${CYAN}══════════════════════════════════════════${RESET}"; echo -e "${BOLD}${CYAN}  $1${RESET}"; echo -e "${BOLD}${CYAN}══════════════════════════════════════════${RESET}"; }
section() { echo -e "\n${BOLD}▶ $1${RESET}"; }
ok()      { echo -e "  ${GREEN}✔${RESET} $1"; }
warn()    { echo -e "  ${YELLOW}⚠${RESET} $1"; }
fail()    { echo -e "  ${RED}✘${RESET} $1"; }

# ── navigate to repo ──────────────────────────────────────────────────────────
# Change directory to the target repo, fail if it doesn't exist
cd "$REPO_DIR" || { fail "Could not access: $REPO_DIR"; exit 1; }

# Verify if the current directory is actually a valid git repository
if ! git rev-parse --git-dir &>/dev/null; then
  fail "Not a git repository: $REPO_DIR"
  exit 1
fi

# ── verify branch existence ───────────────────────────────────────────────────
# Check if the target branch 'blackhatbash' exists in this repository
if ! git rev-parse --verify "$BRANCH" &>/dev/null; then
  fail "The branch '$BRANCH' does not exist in this repository."
  exit 1
fi

header "BRANCH EVALUATOR: $BRANCH"
echo -e "  Repo : ${BOLD}$(pwd)${RESET}"
echo -e "  Branch : ${BOLD}$BRANCH${RESET}"
echo -e "  Date: $(date '+%Y-%m-%d %H:%M:%S') (ECT)"

# ── get branch commits (relative to main/master) ──────────────────────────────
BASE_BRANCH=""
# Determine the primary branch of the repository
for b in main master develop; do
  if git rev-parse --verify "$b" &>/dev/null; then
    BASE_BRANCH="$b"
    break
  fi
done

if [[ -z "$BASE_BRANCH" ]]; then
  # If no base branch is found, get all commits from the target branch
  COMMITS=$(git log "$BRANCH" --format="%H|||%ai|||%s" 2>/dev/null)
else
  # Get commits that are unique to the target branch (not in the base branch)
  # Format: Hash ||| Author Date ||| Subject (Message)
  COMMITS=$(git log "$BASE_BRANCH..$BRANCH" --format="%H|||%ai|||%s" 2>/dev/null)
fi

# Count the total number of commits by counting the '|||' separators
TOTAL_COMMITS=$(echo "$COMMITS" | grep -c '|||' || true)

# =============================================================================
#  1. COMMIT QUANTITY SCORE (max 30 pts)
# =============================================================================
section "1/3 · Commit quantity (max 30 pts)"

SCORE_COMMITS=0
# Assign points based on the total number of commits
if   [[ $TOTAL_COMMITS -ge 20 ]]; then SCORE_COMMITS=30
elif [[ $TOTAL_COMMITS -ge 15 ]]; then SCORE_COMMITS=25
elif [[ $TOTAL_COMMITS -ge 10 ]]; then SCORE_COMMITS=20
elif [[ $TOTAL_COMMITS -ge  7 ]]; then SCORE_COMMITS=15
elif [[ $TOTAL_COMMITS -ge  5 ]]; then SCORE_COMMITS=12
elif [[ $TOTAL_COMMITS -ge  3 ]]; then SCORE_COMMITS=8
elif [[ $TOTAL_COMMITS -ge  1 ]]; then SCORE_COMMITS=4
fi

echo -e "  Commits found : ${BOLD}$TOTAL_COMMITS${RESET}"
echo -e "  Score         : ${BOLD}$SCORE_COMMITS / 30${RESET}"

# Provide feedback based on the commit volume
if   [[ $TOTAL_COMMITS -ge 20 ]]; then ok "Excellent commit quantity."
elif [[ $TOTAL_COMMITS -ge 10 ]]; then ok "Good commit quantity."
elif [[ $TOTAL_COMMITS -ge  5 ]]; then warn "Acceptable quantity, aim for 10+."
elif [[ $TOTAL_COMMITS -ge  1 ]]; then warn "Few commits. Try to commit more frequently."
else                                    fail "No commits found in the branch."; fi

# =============================================================================
#  2. COMMIT TIME SCORE (max 40 pts)
#     Ecuador Time = UTC-5
#     Valid window: 07:00–08:59 local time
# =============================================================================
section "2/3 · Commit time 7am–9am ECT (max 40 pts)"

COMMITS_IN_WINDOW=0
COMMITS_OUT_WINDOW=0

echo ""
printf "  %-8s  %-22s  %-6s  %s\n" "Commit" "Date/Time ECT" "Window" "Message"
printf "  %-8s  %-22s  %-6s  %s\n" "--------" "----------------------" "------" "-------"

# Iterate through each commit line to analyze timestamps
while IFS= read -r line; do
  [[ -z "$line" ]] && continue
  HASH=$(echo "$line"  | cut -d'|' -f1 | cut -c1-7)
  ADATE=$(echo "$line" | cut -d'|' -f4)   # Format: 2024-01-15 10:30:00 +0200
  MSG=$(echo "$line"   | cut -d'|' -f7-)

  # Convert to epoch, subtract 5 hours for UTC-5, and extract the hour
  EPOCH=$(date -d "$ADATE" +%s 2>/dev/null || date -j -f "%Y-%m-%d %H:%M:%S %z" "$ADATE" +%s 2>/dev/null || echo "0")
  ECT_EPOCH=$(( EPOCH - 5*3600 ))
  ECT_HOUR=$(date -d "@$ECT_EPOCH" +%H 2>/dev/null || date -r "$ECT_EPOCH" +%H 2>/dev/null || echo "99")
  ECT_DISPLAY=$(date -d "@$ECT_EPOCH" '+%Y-%m-%d %H:%M:%S' 2>/dev/null || date -r "$ECT_EPOCH" '+%Y-%m-%d %H:%M:%S' 2>/dev/null || echo "N/A")

  # Check if the commit hour is exactly 07 or 08
  if [[ "$ECT_HOUR" =~ ^0[7-8]$ ]]; then
    ((COMMITS_IN_WINDOW++)) || true
    IN="  ✔ YES"
  else
    ((COMMITS_OUT_WINDOW++)) || true
    IN="  ✘ NO"
  fi

  printf "  %-8s  %-22s  %-6s  %.50s\n" "$HASH" "$ECT_DISPLAY" "$IN" "$MSG"
done <<< "$COMMITS"

echo ""
echo -e "  Commits in window   : ${BOLD}$COMMITS_IN_WINDOW${RESET}"
echo -e "  Commits outside     : ${BOLD}$COMMITS_OUT_WINDOW${RESET}"

SCORE_HORA=0
# Calculate score proportionally based on the percentage of valid commits
if [[ $TOTAL_COMMITS -gt 0 ]]; then
  PCT=$(( COMMITS_IN_WINDOW * 100 / TOTAL_COMMITS ))
  SCORE_HORA=$(( PCT * 40 / 100 ))
  echo -e "  % in window         : ${BOLD}${PCT}%${RESET}"
fi
echo -e "  Score               : ${BOLD}$SCORE_HORA / 40${RESET}"

if   [[ $COMMITS_IN_WINDOW -eq $TOTAL_COMMITS && $TOTAL_COMMITS -gt 0 ]]; then ok "All commits are within the 7am–9am ECT window."
elif [[ $COMMITS_IN_WINDOW -gt 0 ]]; then warn "Some commits are outside the window."
else fail "No commits inside the 7am–9am ECT window."; fi

# =============================================================================
#  3. COMMIT MESSAGE QUALITY SCORE (max 30 pts)
# =============================================================================
section "3/3 · Message quality in English (max 30 pts)"

# List of common Spanish words used in commits to detect non-English messages
SPANISH_WORDS="(arreglando|arreglo|agregando|agrego|cambiando|cambio|actualizando|actualizo|\
añadiendo|añado|mejorando|mejoro|corrigiendo|corrijo|implementando|implemento|\
moviendo|muevo|borrando|borro|eliminando|elimino|subiendo|subo|refactorizando|\
creando|creo|primera|primera|segunda|versión|solución|función|módulo|archivo|\
carpeta|repositorio|proyecto|código|rama|branch|prueba|pruebas|comentario|\
el |la |los |las |de |del |en |con |para |por |una |uno |que |se |un )"

GOOD_COMMITS=0   # English and imperative format
OK_COMMITS=0     # English but no clear structure
BAD_COMMITS=0    # Likely Spanish or too short

echo ""
printf "  %-8s  %-10s  %s\n" "Commit" "Quality" "Message"
printf "  %-8s  %-10s  %s\n" "--------" "----------" "-------"

# Evaluate each commit message against regex patterns
while IFS= read -r line; do
  [[ -z "$line" ]] && continue
  HASH=$(echo "$line" | cut -d'|' -f1 | cut -c1-7)
  MSG=$(echo "$line"  | cut -d'|' -f7-)
  MSG_LOWER=$(echo "$MSG" | tr '[:upper:]' '[:lower:]')

  # Penalize if it contains Spanish words
  if echo "$MSG_LOWER" | grep -qiE "$SPANISH_WORDS"; then
    QUALITY="⚠ Spanish"
    ((BAD_COMMITS++)) || true

  # Penalize if it lacks context (too short)
  elif [[ ${#MSG} -lt 10 ]]; then
    QUALITY="✘ Too short"
    ((BAD_COMMITS++)) || true

  # Reward if it starts with an industry-standard imperative English verb
  elif echo "$MSG" | grep -qiE '^(add|fix|update|refactor|remove|move|rename|create|implement|improve|test|docs|chore|feat|style|ci|build|revert|merge|bump|init|setup|configure|enable|disable|handle|replace|extract|simplify|optimize|clean|validate|adjust|use|set|make|allow|prevent|check|ensure|support|change|delete|resolve)'; then
    QUALITY="✔ Great"
    ((GOOD_COMMITS++)) || true

  # Fallback for English messages without clear imperative verbs
  else
    QUALITY="~ OK"
    ((OK_COMMITS++)) || true
  fi

  printf "  %-8s  %-10s  %.60s\n" "$HASH" "$QUALITY" "$MSG"
done <<< "$COMMITS"

echo ""
echo -e "  ✔ Excellent (English + imperative) : ${BOLD}$GOOD_COMMITS${RESET}"
echo -e "  ~ OK (English, no standard)        : ${BOLD}$OK_COMMITS${RESET}"
echo -e "  ✘ Deficient (Spanish / too short)  : ${BOLD}$BAD_COMMITS${RESET}"

SCORE_MSG=0
# Calculate weighted score: Excellent = 1.0 multiplier, OK = 0.6 multiplier
if [[ $TOTAL_COMMITS -gt 0 ]]; then
  WEIGHTED=$(( (GOOD_COMMITS * 100 + OK_COMMITS * 60) / TOTAL_COMMITS ))
  SCORE_MSG=$(( WEIGHTED * 30 / 100 ))
fi
echo -e "  Score               : ${BOLD}$SCORE_MSG / 30${RESET}"

# =============================================================================
#  FINAL RESULT
# =============================================================================
TOTAL=$(( SCORE_COMMITS + SCORE_HORA + SCORE_MSG ))

header "FINAL RESULT"
printf "  %-38s %s\n" "Commit quantity (max 30):"  "$SCORE_COMMITS pts"
printf "  %-38s %s\n" "Time 7am–9am ECT   (max 40):"  "$SCORE_HORA pts"
printf "  %-38s %s\n" "Messages in English(max 30):"   "$SCORE_MSG pts"
echo -e "  ──────────────────────────────────────────"
printf "  %-38s %s\n" "TOTAL SCORE (max 100):" "$TOTAL pts"
echo ""

# Assign a final letter grade based on the total score
if   [[ $TOTAL -ge 90 ]]; then echo -e "  ${GREEN}${BOLD}★ GRADE: A  — Excellent work, blackhat! 🎩${RESET}"
elif [[ $TOTAL -ge 75 ]]; then echo -e "  ${GREEN}${BOLD}  GRADE: B  — Good job, keep it up.${RESET}"
elif [[ $TOTAL -ge 60 ]]; then echo -e "  ${YELLOW}${BOLD}  GRADE: C  — Acceptable, but room for improvement.${RESET}"
elif [[ $TOTAL -ge 40 ]]; then echo -e "  ${YELLOW}${BOLD}  GRADE: D  — Needs more commits and time discipline.${RESET}"
else                            echo -e "  ${RED}${BOLD}  GRADE: F  — Insufficient. Reinforce all criteria.${RESET}"; fi

echo ""
echo -e "  ${BOLD}Tips:${RESET}"
# Provide actionable feedback based on individual block scores
[[ $SCORE_COMMITS -lt 20 ]] && warn "Make more atomic and frequent commits (goal: ≥ 20)."
[[ $SCORE_HORA -lt 32 ]]    && warn "Make your commits between 7:00 and 8:59 (Ecuador time, ECT = UTC-5)."
[[ $BAD_COMMITS -gt 0 ]]    && warn "Write messages in English with an imperative verb: 'Add login handler', 'Fix null pointer error'."
[[ $TOTAL -ge 90 ]]         && ok "Everything in order! Keep up the discipline."
echo ""

sleep 800 &