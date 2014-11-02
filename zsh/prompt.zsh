# Enable colors
source ~/.dotfiles/zsh/spectrum.zsh
autoload colors && colors

# Enable substitutions
setopt prompt_subst

# Theme colors
ZSH_THEME_PROMPT_PATH_COLOR=$fg_bold[blue]

source ~/.dotfiles/git/git.zsh

function ssh_prompt() {
  if [ $SSH_CONNECTION ]; then echo "%{$fg_bold[green]%}%n@%m "; fi
}

function left_prompt() {
  cols="$(tput cols)"
  if [ "$cols" -gt 88 ]; then
#    echo "$(ssh_prompt)%{$ZSH_THEME_PROMPT_PATH_COLOR%}%~ $(git_prompt)$(git_dirty_state)%{$reset_color%}"
    echo "$(ssh_prompt)%{$ZSH_THEME_PROMPT_PATH_COLOR%}%~ $(git_prompt)%{$reset_color%}"
  else
    echo "$(ssh_prompt)%{$ZSH_THEME_PROMPT_PATH_COLOR%}%~ %{$reset_color%}"
  fi
}

function right_prompt() {
  cols="$(tput cols)"
  if [ "$cols" -le 88 ]; then
#    echo "$(git_dirty_state)$(git_prompt)"
    echo "$(git_prompt)"
  fi
}


PROMPT='$(left_prompt)'
RPROMPT='$(right_prompt)'

#function prompt_char {
#  if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
#}

#PROMPT='%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n@)%m %{$fg_bold[blue]%}%(!.%1~.%~) $(git_prompt_info)%_$(prompt_char)%{$reset_color%} '

