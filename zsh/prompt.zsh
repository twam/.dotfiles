# Enable colors
source ~/.dotfiles/zsh/spectrum.zsh
autoload colors && colors

# Enable substitutions
setopt prompt_subst

# Load the zsh-syntax-highlighting plugin
if [ -f $DOTFILES_DIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]
then
  source $DOTFILES_DIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

  # Enable highlighters
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets )

  # unknown tokens / errors
  ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold
  # shell reserved words
  ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=green,bold
  # aliases
  ZSH_HIGHLIGHT_STYLES[alias]=fg=white,bold
  # builtin shell functions
  ZSH_HIGHLIGHT_STYLES[builtin]=fg=white,bold
  # functions
  ZSH_HIGHLIGHT_STYLES[function]=fg=white,bold
  # commands
  ZSH_HIGHLIGHT_STYLES[command]=fg=white,bold
  # precommands (i.e. exec, builtin, ...)
  ZSH_HIGHLIGHT_STYLES[precommand]=fg=white,underline
  # command separation tokens
  ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=214,bold
  # hashed commands
  ZSH_HIGHLIGHT_STYLES[hashed-command]=none
  # paths
  ZSH_HIGHLIGHT_STYLES[path]=fg=blue,bold
  # globbing expressions
  ZSH_HIGHLIGHT_STYLES[globbing]=fg=063,bold
  # history expansion expressions
  ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
  # single hyphen options
  ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
  # double hyphen options
  ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
  # backquoted expressions
  ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
  # single quoted arguments
  ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=214,bold
  # double quoted arguments
  ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=214,bold
  # dollar double quoted argument
  ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=214,bold
  # back double quoated argument
  ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=214,bold
  # variable assyignments
  ZSH_HIGHLIGHT_STYLES[assign]=none
  # default (does not match anything else)
  ZSH_HIGHLIGHT_STYLES[default]=none

fi

# Theme colors
ZSH_THEME_PROMPT_PATH_COLOR=$fg_bold[blue]

source ~/.dotfiles/git/git.zsh

function ssh_prompt() {
  if [ $SSH_CONNECTION ]; then echo "%{$fg_bold[green]%}%n@%m "; fi
}

function left_prompt() {
  cols="$(tput cols)"
  if [ "$cols" -gt 88 ]; then
    echo "$(ssh_prompt)%{$ZSH_THEME_PROMPT_PATH_COLOR%}%~ $(git_prompt)$(git_dirty_state)%{$reset_color%}"
  else
    echo "$(ssh_prompt)%{$ZSH_THEME_PROMPT_PATH_COLOR%}%~ %{$reset_color%}"
  fi
}

function right_prompt() {
  cols="$(tput cols)"
  if [ "$cols" -le 88 ]; then
    echo "$(git_dirty_state)$(git_prompt)"
  fi
}


PROMPT='$(left_prompt)'
RPROMPT='$(right_prompt)'

#function prompt_char {
#  if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
#}

#PROMPT='%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n@)%m %{$fg_bold[blue]%}%(!.%1~.%~) $(git_prompt_info)%_$(prompt_char)%{$reset_color%} '

