function ssh_prompt() {
  echo -n "%B%{%(#~%F{red}~%F{green})%}%n"
  if (( ${+SSH_CONNECTION} )); then
	echo -n "@%m"
  fi
  echo -n "%f%b "
}

local git_branch='$(git_prompt_info)$(git_remote_status)'

PROMPT="$(ssh_prompt)%B%F{blue}%~%f%b ${git_branch}"

ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{cyan}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f%b "
ZSH_THEME_GIT_PROMPT_DIRTY=" %B%F{red}✘%f%b"
ZSH_THEME_GIT_PROMPT_CLEAN=" %B%F{green}✔%f%b"

ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_DETAILED=true

ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_PREFIX="%B%F{yellow}("
ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_SUFFIX="%B%F{yellow})%f%b "

ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE=" +"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE_COLOR=%F{green}

ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE=" -"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE_COLOR=%F{red}


# function toon {
#   echo -n ""
# }

# get_git_dirty() {
#   git diff --quiet || echo '*'
# }

# autoload -Uz vcs_info
# zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:*' unstagedstr '%F{red}*'   # display this when there are unstaged changes
# zstyle ':vcs_info:*' stagedstr '%F{yellow}+'  # display this when there are staged changes
# zstyle ':vcs_info:*' actionformats '%F{5}%F{5}[%F{2}%b%F{3}|%F{1}%a%c%u%F{5}]%f '
# zstyle ':vcs_info:*' formats     '%F{5}%F{5}[%F{2}%b%c%u%F{5}]%f '
# zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
# zstyle ':vcs_info:*' enable git cvs svn

# theme_precmd () {
#     vcs_info
# }

# setopt prompt_subst
# PROMPT='%{$fg[magenta]%}$(toon)%{$reset_color%} %~/ %{$reset_color%}${vcs_info_msg_0_}%{$reset_color%}'

# autoload -U add-zsh-hook
# add-zsh-hook precmd theme_precmd
