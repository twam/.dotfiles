
# Pressing up/down will search the history
#bindkey '^[[A' up-line-or-search
#bindkey '^[[B' down-line-or-search

# Make the delete key (or Fn + Delete on the Mac) work instead of outputting a ~
bindkey '^?' backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char
bindkey "\e[3~" delete-char


# Use Ctrl+V followed by the key to find these out on a shell
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[A" up-line-or-history
bindkey "^[[B" down-line-or-history
bindkey "^[[D" backward-char
bindkey "^[[C" forward-char

bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history
