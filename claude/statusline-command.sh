#!/bin/sh
# Dependencies: git, jq, awk

input=$(cat)

# Named color constants
RED='\033[31m'; YELLOW='\033[33m'; GREEN='\033[32m'; BLUE='\033[34m'; RESET='\033[0m'

dir=$(echo "$input" | jq -r '.workspace.current_dir // .cwd')

# Parse model, effort, and context percentage in a single jq call
parsed=$(echo "$input" | jq -r '[
  .model.display_name // "",
  (.context_window.used_percentage // ""),
  .model.effort // ""
] | @tsv')
json_model=$(printf '%s' "$parsed" | cut -f1)
json_used_pct=$(printf '%s' "$parsed" | cut -f2)
json_effort=$(printf '%s' "$parsed" | cut -f3)

# Model: prefer $CLAUDE_MODEL env var, fallback to JSON
if [ -n "$CLAUDE_MODEL" ]; then
  model="$CLAUDE_MODEL"
else
  model="$json_model"
fi

# Context percentage: prefer env vars, fallback to JSON pre-calculated field
if [ -n "$CLAUDE_CONTEXT_TOKENS_USED" ] && [ -n "$CLAUDE_MAX_CONTEXT_TOKENS" ] && [ "$CLAUDE_MAX_CONTEXT_TOKENS" -gt 0 ]; then
  used_pct=$(awk "BEGIN { printf \"%.0f\", ($CLAUDE_CONTEXT_TOKENS_USED / $CLAUDE_MAX_CONTEXT_TOKENS) * 100 }")
else
  used_pct="$json_used_pct"
  [ -n "$used_pct" ] && used_pct=$(printf '%.0f' "$used_pct")
fi

# Git info (skip optional locks)
branch=$(GIT_OPTIONAL_LOCKS=0 git -C "$dir" symbolic-ref --short HEAD 2>/dev/null)
unstaged=0
staged=0
untracked=0
stash=0
if [ -n "$branch" ]; then
  porcelain=$(GIT_OPTIONAL_LOCKS=0 git -C "$dir" status --porcelain 2>/dev/null)
  # Only run counts when porcelain output is non-empty to avoid grep -c false positives
  if [ -n "$porcelain" ]; then
    unstaged=$(printf '%s\n' "$porcelain" | grep -c '^.[^ ?]')
    staged=$(printf '%s\n' "$porcelain" | grep -c '^[^ ?].')
    untracked=$(printf '%s\n' "$porcelain" | grep -c '^??')
  fi
  stash=$(GIT_OPTIONAL_LOCKS=0 git -C "$dir" stash list 2>/dev/null | wc -l | tr -d ' ')
fi

# Default empty values to 0
unstaged=${unstaged:-0}
staged=${staged:-0}
untracked=${untracked:-0}
stash=${stash:-0}

# Effort: prefer $CLAUDE_EFFORT env var, fallback to JSON
if [ -n "$CLAUDE_EFFORT" ]; then
  effort="$CLAUDE_EFFORT"
else
  effort="$json_effort"
fi

# Section 1: model name with optional effort level
section1=""
if [ -n "$model" ]; then
  if [ -n "$effort" ]; then
    section1=$(printf "${BLUE}%s [%s]${RESET}" "$model" "$effort")
  else
    section1=$(printf "${BLUE}%s${RESET}" "$model")
  fi
fi

# Section 2: git branch with Powerline branch glyph (U+E0A0) and status indicators
section2=""
if [ -n "$branch" ]; then
  git_status=""
  [ "$stash" -gt 0 ] && git_status="$git_status *$stash"
  [ "$unstaged" -gt 0 ] && git_status="$git_status !$unstaged"
  [ "$staged" -gt 0 ] && git_status="$git_status +$staged"
  [ "$untracked" -gt 0 ] && git_status="$git_status ?$untracked"
  # Color: yellow if unstaged (!) or staged (+) changes; green if clean, untracked-only, or stash-only
  branch_color="$GREEN"
  if [ "$unstaged" -gt 0 ] || [ "$staged" -gt 0 ]; then
    branch_color="$YELLOW"
  fi
  section2=$(printf "${branch_color}\xEF\x90\x98 %s%s${RESET}" "$branch" "$git_status")
fi

# Section 3: context block bar + percentage
section3=""
if [ -n "$used_pct" ]; then
  filled=$(awk "BEGIN { v=int($used_pct * 10 / 100); if(v>10) v=10; print v }")
  empty=$((10 - filled))
  bar=$(awk -v f="$filled" -v e="$empty" 'BEGIN { for(i=0;i<f;i++) printf "▓"; for(i=0;i<e;i++) printf "░" }')
  # Color thresholds: green 0-50%, yellow 51-80%, red >80%
  if [ "$used_pct" -gt 80 ]; then
    ctx_color="$RED"
  elif [ "$used_pct" -gt 50 ]; then
    ctx_color="$YELLOW"
  else
    ctx_color="$GREEN"
  fi
  section3=$(printf "${ctx_color}%s %s %%${RESET}" "$bar" "$used_pct")
fi

# Assemble sections separated by " | "
out=""
for section in "$section2" "$section1" "$section3"; do
  if [ -n "$section" ]; then
    if [ -n "$out" ]; then
      out="$out | $section"
    else
      out="$section"
    fi
  fi
done

printf '%s' "$out"
