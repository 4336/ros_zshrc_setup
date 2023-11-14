# some useful things

# new line prompt for agnoster theme
# add 'prompt_newline' between prompt_hg & prompt_end on .oh-my-zsh/themes/agnoster.zsh-theme
prompt_newline() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR\n%(?.%F{$CURRENT_BG}.%F{red})❯%f"

  else
    echo -n "%{%k%}"
  fi

  echo -n "%{%f%}"
  CURRENT_BG=''
}

