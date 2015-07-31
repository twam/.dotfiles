# Make the delete key (or Fn + Delete on the Mac) work instead of outputting a ~
bindkey '^?' backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char
bindkey "\e[3~" delete-char

# Use Ctrl+V followed by the key to find these out on a shell
bindkey "^[[1~" beginning-of-line	# home on OS X (with custom terminal settings)
bindkey "^[[1;5D" beginning-of-line 	# ctrl+left on linux
bindkey "^[OH" beginning-of-line 	# home on linux
bindkey "\e[H" beginning-of-line	# home on cygwin mintty
bindkey "\e[1~": beginning-of-line

bindkey "^[[4~" end-of-line		# end on OS X (with custom terminal settings)
bindkey "^[OF" end-of-line		# end on linux
bindkey "^[[1;5C" end-of-line		# ctrl+right on linux
bindkey "\e[F" end-of-line 		    # end on cygwin mintty
bindkey "\e[4~": end-of-line

bindkey "^[[A" up-line-or-history
bindkey "^[[B" down-line-or-history
bindkey "^[[D" backward-char
bindkey "^[[C" forward-char

bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history
