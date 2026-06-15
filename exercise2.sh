#!/usr/bin/env bash
# =============================================================================
#  score_blackhatbash.sh
#  Califica la rama 'blackhatbash' del 1 al 100
#
#  Criterios:
#    - Cantidad de commits                  (30 pts)
#    - Hora de commits entre 7am-9am ECT    (40 pts)
#    - Calidad de mensajes (en inglés)      (30 pts)
#
#  Uso:  bash score_blackhatbash.sh [ruta_del_repo]
# =============================================================================

set -euo pipefail

# ── colores ──────────────────────────────────────────────────────────────────
RED='\033[0;31m'; YELLOW='\033[1;33m'; GREEN='\033[0;32m'
CYAN='\033[0;36m'; BOLD='\033[1m'; RESET='\033[0m'

BRANCH="blackhatbash"
REPO_DIR="${1:-.}"

# ── helpers ───────────────────────────────────────────────────────────────────
header() { echo -e "\n${BOLD}${CYAN}══════════════════════════════════════════${RESET}"; echo -e "${BOLD}${CYAN}  $1${RESET}"; echo -e "${BOLD}${CYAN}══════════════════════════════════════════${RESET}"; }
section() { echo -e "\n${BOLD}▶ $1${RESET}"; }
ok()      { echo -e "  ${GREEN}✔${RESET} $1"; }
warn()    { echo -e "  ${YELLOW}⚠${RESET} $1"; }
fail()    { echo -e "  ${RED}✘${RESET} $1"; }

# ── ir al repo ────────────────────────────────────────────────────────────────
cd "$REPO_DIR" || { fail "No se pudo acceder a: $REPO_DIR"; exit 1; }

if ! git rev-parse --git-dir &>/dev/null; then
  fail "No es un repositorio git: $REPO_DIR"
  exit 1
fi

# ── verificar que existe la rama ──────────────────────────────────────────────
if ! git rev-parse --verify "$BRANCH" &>/dev/null; then
  fail "La rama '$BRANCH' no existe en este repositorio."
  exit 1
fi

header "EVALUADOR DE RAMA: $BRANCH"
echo -e "  Repo : ${BOLD}$(pwd)${RESET}"
echo -e "  Rama : ${BOLD}$BRANCH${RESET}"
echo -e "  Fecha: $(date '+%Y-%m-%d %H:%M:%S') (ECT)"

# ── obtener commits de la rama (respecto a main/master) ───────────────────────
BASE_BRANCH=""
for b in main master develop; do
  if git rev-parse --verify "$b" &>/dev/null; then
    BASE_BRANCH="$b"
    break
  fi
done

if [[ -z "$BASE_BRANCH" ]]; then
  # Sin rama base, tomamos todos los commits de la rama
  COMMITS=$(git log "$BRANCH" --format="%H|||%ai|||%s" 2>/dev/null)
else
  COMMITS=$(git log "$BASE_BRANCH..$BRANCH" --format="%H|||%ai|||%s" 2>/dev/null)
fi

TOTAL_COMMITS=$(echo "$COMMITS" | grep -c '|||' || true)

# =============================================================================
#  1. PUNTAJE POR CANTIDAD DE COMMITS  (máx 30 pts)
# =============================================================================
section "1/3 · Cantidad de commits (máx 30 pts)"

SCORE_COMMITS=0
if   [[ $TOTAL_COMMITS -ge 20 ]]; then SCORE_COMMITS=30
elif [[ $TOTAL_COMMITS -ge 15 ]]; then SCORE_COMMITS=25
elif [[ $TOTAL_COMMITS -ge 10 ]]; then SCORE_COMMITS=20
elif [[ $TOTAL_COMMITS -ge  7 ]]; then SCORE_COMMITS=15
elif [[ $TOTAL_COMMITS -ge  5 ]]; then SCORE_COMMITS=12
elif [[ $TOTAL_COMMITS -ge  3 ]]; then SCORE_COMMITS=8
elif [[ $TOTAL_COMMITS -ge  1 ]]; then SCORE_COMMITS=4
fi

echo -e "  Commits encontrados : ${BOLD}$TOTAL_COMMITS${RESET}"
echo -e "  Puntaje             : ${BOLD}$SCORE_COMMITS / 30${RESET}"

if   [[ $TOTAL_COMMITS -ge 20 ]]; then ok "Excelente cantidad de commits."
elif [[ $TOTAL_COMMITS -ge 10 ]]; then ok "Buena cantidad de commits."
elif [[ $TOTAL_COMMITS -ge  5 ]]; then warn "Cantidad aceptable, apunta a 10+."
elif [[ $TOTAL_COMMITS -ge  1 ]]; then warn "Pocos commits. Trata de hacer más."
else                                    fail "Sin commits en la rama."; fi

# =============================================================================
#  2. PUNTAJE POR HORA DE COMMITS  (máx 40 pts)
#     Hora Ecuador = UTC-5
#     Ventana válida: 07:00–08:59 hora local
# =============================================================================
section "2/3 · Hora de commits 7am–9am ECT (máx 40 pts)"

COMMITS_IN_WINDOW=0
COMMITS_OUT_WINDOW=0

# Detalle por commit
echo ""
printf "  %-8s  %-22s  %-6s  %s\n" "Commit" "Fecha/Hora ECT" "Ventana" "Mensaje"
printf "  %-8s  %-22s  %-6s  %s\n" "--------" "----------------------" "------" "-------"

while IFS= read -r line; do
  [[ -z "$line" ]] && continue
  HASH=$(echo "$line"  | cut -d'|' -f1 | cut -c1-7)
  ADATE=$(echo "$line" | cut -d'|' -f4)   # formato: 2024-01-15 10:30:00 +0200
  MSG=$(echo "$line"   | cut -d'|' -f7-)

  # Convertir a epoch y luego a hora ECT (UTC-5)
  EPOCH=$(date -d "$ADATE" +%s 2>/dev/null || date -j -f "%Y-%m-%d %H:%M:%S %z" "$ADATE" +%s 2>/dev/null || echo "0")
  ECT_EPOCH=$(( EPOCH - 5*3600 ))
  ECT_HOUR=$(date -d "@$ECT_EPOCH" +%H 2>/dev/null || date -r "$ECT_EPOCH" +%H 2>/dev/null || echo "99")
  ECT_DISPLAY=$(date -d "@$ECT_EPOCH" '+%Y-%m-%d %H:%M:%S' 2>/dev/null || date -r "$ECT_EPOCH" '+%Y-%m-%d %H:%M:%S' 2>/dev/null || echo "N/A")

  if [[ "$ECT_HOUR" =~ ^0[7-8]$ ]]; then
    ((COMMITS_IN_WINDOW++)) || true
    IN="  ✔ SI"
  else
    ((COMMITS_OUT_WINDOW++)) || true
    IN="  ✘ NO"
  fi

  printf "  %-8s  %-22s  %-6s  %.50s\n" "$HASH" "$ECT_DISPLAY" "$IN" "$MSG"
done <<< "$COMMITS"

echo ""
echo -e "  Commits en ventana  : ${BOLD}$COMMITS_IN_WINDOW${RESET}"
echo -e "  Commits fuera       : ${BOLD}$COMMITS_OUT_WINDOW${RESET}"

SCORE_HORA=0
if [[ $TOTAL_COMMITS -gt 0 ]]; then
  PCT=$(( COMMITS_IN_WINDOW * 100 / TOTAL_COMMITS ))
  SCORE_HORA=$(( PCT * 40 / 100 ))
  echo -e "  % en ventana        : ${BOLD}${PCT}%${RESET}"
fi
echo -e "  Puntaje             : ${BOLD}$SCORE_HORA / 40${RESET}"

if   [[ $COMMITS_IN_WINDOW -eq $TOTAL_COMMITS && $TOTAL_COMMITS -gt 0 ]]; then ok "Todos los commits están en la ventana 7am–9am ECT."
elif [[ $COMMITS_IN_WINDOW -gt 0 ]]; then warn "Algunos commits fuera de la ventana."
else fail "Ningún commit dentro de la ventana 7am–9am ECT."; fi

# =============================================================================
#  3. CALIDAD DE MENSAJES DE COMMIT (en inglés)  (máx 30 pts)
# =============================================================================
section "3/3 · Calidad de mensajes en inglés (máx 30 pts)"

# Palabras comunes en español para detectar mensajes no-inglés
SPANISH_WORDS="(arreglando|arreglo|agregando|agrego|cambiando|cambio|actualizando|actualizo|\
añadiendo|añado|mejorando|mejoro|corrigiendo|corrijo|implementando|implemento|\
moviendo|muevo|borrando|borro|eliminando|elimino|subiendo|subo|refactorizando|\
creando|creo|primera|primera|segunda|versión|solución|función|módulo|archivo|\
carpeta|repositorio|proyecto|código|rama|branch|prueba|pruebas|comentario|\
el |la |los |las |de |del |en |con |para |por |una |uno |que |se |un )"

GOOD_COMMITS=0   # mensaje en inglés y bien formateado
OK_COMMITS=0     # inglés pero sin estructura clara
BAD_COMMITS=0    # posiblemente en español o muy corto

echo ""
printf "  %-8s  %-10s  %s\n" "Commit" "Calidad" "Mensaje"
printf "  %-8s  %-10s  %s\n" "--------" "----------" "-------"

while IFS= read -r line; do
  [[ -z "$line" ]] && continue
  HASH=$(echo "$line" | cut -d'|' -f1 | cut -c1-7)
  MSG=$(echo "$line"  | cut -d'|' -f7-)
  MSG_LOWER=$(echo "$MSG" | tr '[:upper:]' '[:lower:]')

  # ¿Tiene palabras en español?
  if echo "$MSG_LOWER" | grep -qiE "$SPANISH_WORDS"; then
    QUALITY="⚠ Spanish"
    ((BAD_COMMITS++)) || true

  # ¿Mensaje muy corto (< 10 chars)?
  elif [[ ${#MSG} -lt 10 ]]; then
    QUALITY="✘ Too short"
    ((BAD_COMMITS++)) || true

  # ¿Sigue convención imperativa (verb al inicio)?
  elif echo "$MSG" | grep -qiE '^(add|fix|update|refactor|remove|move|rename|create|implement|improve|test|docs|chore|feat|style|ci|build|revert|merge|bump|init|setup|configure|enable|disable|handle|replace|extract|simplify|optimize|clean|validate|adjust|use|set|make|allow|prevent|check|ensure|support|change|delete|resolve)'; then
    QUALITY="✔ Great"
    ((GOOD_COMMITS++)) || true

  # Inglés pero sin verbo imperativo claro
  else
    QUALITY="~ OK"
    ((OK_COMMITS++)) || true
  fi

  printf "  %-8s  %-10s  %.60s\n" "$HASH" "$QUALITY" "$MSG"
done <<< "$COMMITS"

echo ""
echo -e "  ✔ Excelente (inglés + imperativo) : ${BOLD}$GOOD_COMMITS${RESET}"
echo -e "  ~ OK (inglés, sin estándar)        : ${BOLD}$OK_COMMITS${RESET}"
echo -e "  ✘ Deficiente (español / muy corto) : ${BOLD}$BAD_COMMITS${RESET}"

SCORE_MSG=0
if [[ $TOTAL_COMMITS -gt 0 ]]; then
  # Ponderación: excelente=1.0, ok=0.6, malo=0.0
  WEIGHTED=$(( (GOOD_COMMITS * 100 + OK_COMMITS * 60) / TOTAL_COMMITS ))
  SCORE_MSG=$(( WEIGHTED * 30 / 100 ))
fi
echo -e "  Puntaje             : ${BOLD}$SCORE_MSG / 30${RESET}"

# =============================================================================
#  RESULTADO FINAL
# =============================================================================
TOTAL=$(( SCORE_COMMITS + SCORE_HORA + SCORE_MSG ))

header "RESULTADO FINAL"
printf "  %-38s %s\n" "Cantidad de commits (máx 30):"  "$SCORE_COMMITS pts"
printf "  %-38s %s\n" "Hora 7am–9am ECT   (máx 40):"  "$SCORE_HORA pts"
printf "  %-38s %s\n" "Mensajes en inglés (máx 30):"   "$SCORE_MSG pts"
echo -e "  ──────────────────────────────────────────"
printf "  %-38s %s\n" "PUNTAJE TOTAL (máx 100):" "$TOTAL pts"
echo ""

# Letra de calificación
if   [[ $TOTAL -ge 90 ]]; then echo -e "  ${GREEN}${BOLD}★ NOTA: A  — Excelente trabajo, blackhat! 🎩${RESET}"
elif [[ $TOTAL -ge 75 ]]; then echo -e "  ${GREEN}${BOLD}  NOTA: B  — Buen trabajo, sigue así.${RESET}"
elif [[ $TOTAL -ge 60 ]]; then echo -e "  ${YELLOW}${BOLD}  NOTA: C  — Aceptable, pero hay margen de mejora.${RESET}"
elif [[ $TOTAL -ge 40 ]]; then echo -e "  ${YELLOW}${BOLD}  NOTA: D  — Necesita más commits y disciplina horaria.${RESET}"
else                            echo -e "  ${RED}${BOLD}  NOTA: F  — Insuficiente. Refuerza todos los criterios.${RESET}"; fi

echo ""
echo -e "  ${BOLD}Consejos:${RESET}"
[[ $SCORE_COMMITS -lt 20 ]] && warn "Haz más commits atómicos y frecuentes (meta: ≥ 20)."
[[ $SCORE_HORA -lt 32 ]]    && warn "Realiza tus commits entre las 7:00 y 8:59 (hora Ecuador, ECT = UTC-5)."
[[ $BAD_COMMITS -gt 0 ]]    && warn "Escribe mensajes en inglés con verbo imperativo: 'Add login handler', 'Fix null pointer error'."
[[ $TOTAL -ge 90 ]]         && ok "¡Todo en orden! Mantén la disciplina."
echo ""