
setopt PROMPT_SUBST

__set_ps1() {
  local RST='%b%k%f'
  local CYAN_BG='%K{cyan}%F{black}%B'
  local WHITE_BG='%K{white}%F{black}%B'
  local RED_BG='%K{red}%F{black}%B'
  local MAGENTA_BG='%K{magenta}%F{black}%B'
  local BLUE_BG='%K{blue}%F{black}%B'

  local COLOR="$WHITE_BG"
  [[ $LAST_EXIT_CODE -ne 0 ]] && COLOR="$RED_BG"

  local SCREEN_PROMPT_MODIFIER=""
  [[ -n "$STY" ]] && SCREEN_PROMPT_MODIFIER="${MAGENTA_BG} ${STY#*.} ${RST} "

  local CUSTOM_CONDA_MODIFIER=""
  if [[ -n "$CONDA_PROMPT_MODIFIER" ]]; then
    local env_name="${CONDA_PROMPT_MODIFIER//[()]/}"
    env_name="${env_name// /}"
    CUSTOM_CONDA_MODIFIER="${CYAN_BG} ${env_name} ${RST} "
  fi

  PS1="${CUSTOM_CONDA_MODIFIER}${SCREEN_PROMPT_MODIFIER}${COLOR} %~ ${RST} "
}

precmd() { LAST_EXIT_CODE=$? ; __set_ps1 }
