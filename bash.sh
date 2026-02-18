#!/bin/bash

__set_ps1() {
  local exit_code=$?   # MUST be first
  local RST='\[\e[0m\]'
  local WHITE_BG='\[\e[47;30;1m\]'  # White background, black text, bold
  local RED_BG='\[\e[41;30;1m\]'    # Red background, black text, bold

  local COLOR="$WHITE_BG"
  (( exit_code != 0 )) && COLOR="$RED_BG"

  # Left prompt: colored background with directory
  # Right prompt: conda environment
  PS1="${COLOR} \w ${RST} ${CONDA_PROMPT_MODIFIER}"
}

PROMPT_COMMAND=__set_ps1

