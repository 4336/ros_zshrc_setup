up-line-or-beginning-local-search() {
  if [[ $LBUFFER == *$'\n'* ]]; then
    zle up-line-or-history
    __searching=''
  elif [[ -n $PREBUFFER ]] && 
      zstyle -t ':zle:up-line-or-beginning-search' edit-buffer
  then
    zle push-line-or-edit
  else
    [[ $LASTWIDGET = $__searching ]] && CURSOR=$__savecursor
    __savecursor=$CURSOR
    __searching=$WIDGET
    zle set-local-history 1
    zle history-beginning-search-backward
    zle set-local-history 0
    zstyle -T ':zle:up-line-or-beginning-search' leave-cursor &&
        zle end-of-line
  fi
}
zle -N up-line-or-beginning-local-search

down-line-or-beginning-local-search() {
  if [[ ${+NUMERIC} -eq 0 &&
      ( $LASTWIDGET = $__searching || $RBUFFER != *$'\n'* ) ]]
  then
    [[ $LASTWIDGET = $__searching ]] && CURSOR=$__savecursor
    __searching=$WIDGET
    __savecursor=$CURSOR

    zle set-local-history 1
    if zle history-beginning-search-forward; then
      zle set-local-history 0
      [[ $RBUFFER = *$'\n'* ]] || 
        zstyle -T ':zle:down-line-or-beginning-search' leave-cursor &&
        zle end-of-line
      return
    fi
    zle set-local-history 0
    
    [[ $RBUFFER = *$'\n'* ]] || return
  fi
  __searching=''
  zle down-line-or-history
}
zle -N down-line-or-beginning-local-search

# Stepping through local history.
bindkey "${key[Up]}" up-line-or-beginning-local-search       # Cursor Up
bindkey "${key[Down]}" down-line-or-beginning-local-search   # Cursor Down

# Stepping through global history.  
bindkey "^[[1;5A" up-line-or-beginning-search                # Ctrl + Cursor Up
bindkey "^[[1;5B" down-line-or-beginning-search              # Ctrl + Cursor Down

# This option both imports new commands from the history file, and also causes your
# typed commands to be appended to the history file (the latter is like specifying
# INC_APPEND_HISTORY, which should be turned off if this option is in effect).
setopt sharehistory
