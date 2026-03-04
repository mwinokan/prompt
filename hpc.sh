#!/bin/bash

__set_ps1() {
  local exit_code=$?   # MUST be first
  local RST='\[\e[0m\]'
  local FG='\[\e[32m\]'
  local BOLD='\[\e[1m\]'
  local WHITE_BG='\[\e[107;30;1m\]'  # White background, black text, bold
  local GREEN_BG='\[\e[102;30;1m\]'  # Green background, black text, bold
  local CYAN_BG='\[\e[106;30;1m\]'  # Cyan background, black text, bold
  local MAGENTA_BG='\[\e[105;30;1m\]'  # Magenta background, black text, bold
  local BLUE_BG='\[\e[104;30;1m\]'  # Blue background, black text, bold
  local YELLOW_BG='\[\e[103;30;1m\]'  # Yellow background, black text, bold
  local RED_BG='\[\e[101;30;1m\]'    # Red background, black text, bold

  local COLOR="$CYAN_BG"
  (( exit_code != 0 )) && COLOR="$RED_BG"

  local SCREEN_PROMPT_MODIFIER=""
  [[ -n "$STY" ]] && SCREEN_PROMPT_MODIFIER="$MAGENTA_BG ${STY#*.} $RST "

  local CUSTOM_CONDA_MODIFIER=""

  if [[ -n "$CONDA_PROMPT_MODIFIER" ]]; then
    CUSTOM_CONDA_MODIFIER=$(echo "$CONDA_PROMPT_MODIFIER" | sed 's/.*(\(.*\)).*/\1/')
    CUSTOM_CONDA_MODIFIER="$BLUE_BG ${CUSTOM_CONDA_MODIFIER} $RST "
  fi

  PS1="${CUSTOM_CONDA_MODIFIER}${SCREEN_PROMPT_MODIFIER}${COLOR} \h ${RST}${BOLD} \w ${RST}"
}

PROMPT_COMMAND=__set_ps1

