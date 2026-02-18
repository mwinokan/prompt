#!/bin/bash

__set_ps1() {
  local exit_code=$?   # MUST be first
  local RST='\[\e[0m\]'
  local FG='\[\e[32m\]'
  local BOLD='\[\e[1m\]'
  local WHITE_BG='\[\e[47;30;1m\]'  # White background, black text, bold
  local RED_BG='\[\e[41;30;1m\]'    # Red background, black text, bold

  #local COLOR="$WHITE_BG"
  local COLOR="$WHITE_BG"
  (( exit_code != 0 )) && COLOR="$RED_BG"

  #PS1="${CONDA_PROMPT_MODIFIER}${COLOR} \w ${RST} "
  PS1="${CONDA_PROMPT_MODIFIER}${COLOR} \h ${RST}${BOLD} \w ${RST}"
}

PROMPT_COMMAND=__set_ps1

