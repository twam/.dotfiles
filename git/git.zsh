ZSH_THEME_GIT_PROMPT_COLOR=$FG[045]
ZSH_THEME_GIT_PROMPT_BRANCH_COLOR=$FG[063]
ZSH_THEME_GIT_PROMPT_DETACHED_COLOR=$FG[009]

ZSH_THEME_GIT_TIME_SINCE_LAST_COMMIT_LONG_COLOR=$FG[009]
ZSH_THEME_GIT_TIME_SINCE_LAST_COMMIT_MEDIUM_COLOR=$FG[142]
ZSH_THEME_GIT_TIME_SINCE_LAST_COMMIT_SHORT_COLOR=$FG[118]

ZSH_THEME_GIT_PROMPT_AHEAD_COLOR=$FG[118]
ZSH_THEME_GIT_PROMPT_BEHIND_COLOR=$FG[009]

ZSH_THEME_GIT_PROMPT_BRANCH_PREFIX="%{$ZSH_THEME_GIT_PROMPT_BRANCH_COLOR%}"
ZSH_THEME_GIT_PROMPT_BRANCH_SUFFIX="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_DETACHED_PREFIX="%{$ZSH_THEME_GIT_PROMPT_DETACHED_COLOR%}"
ZSH_THEME_GIT_PROMPT_DETACHED_SUFFIX="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_UNSTAGED=" ○ "
ZSH_THEME_GIT_PROMPT_STAGED=" ● "
ZSH_THEME_GIT_PROMPT_CLEAN=" "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$ZSH_THEME_GIT_PROMPT_COLOR%}git:("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$ZSH_THEME_GIT_PROMPT_COLOR%})%{$reset_color%}"

# Name of the current branch
function git_current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "${ref#refs/heads/}"
}

# Short SHA of the current head
function git_short_sha() {
  sha=$(git rev-parse --short HEAD 2> /dev/null)
  echo "$sha"
}

# Name of the current remote
function git_remote_name() {
  remote=$(git config branch.$(git_current_branch).remote 2> /dev/null) || return
  echo "$remote"
}

# Refspec marked for merging
function git_merge_name() {
  merge=$(git config branch.$(git_current_branch).merge 2> /dev/null) || return
  echo "$merge"
}

function git_remote_ref() {
  remote="$(git_remote_name 2> /dev/null)"
  if [ "$remote" = "." ]; then
    echo "$(git_merge_name)"
  else
    merge=$(git_merge_name)
    echo "refs/remotes/$(git_remote_name)/${merge#refs/heads/}"
  fi
}

# Prints the number of commits your are ahead or behind of the upstream repo,
# e.g. '2,3' means 2 ahead, 3 behind
# TODO: Make the colors customizable
function git_ahead_behind_state() {
  list="$(git rev-list --left-right $(git_remote_ref)...HEAD 2> /dev/null)"
  ahead=$(echo $list | grep '>' | wc -l | tr -d ' ')
  behind=$(echo $list | grep '<' | wc -l | tr -d ' ')

  if [ "$ahead" -gt 0 ] && [ "$behind" -gt 0 ]; then
    echo "%{$ZSH_THEME_GIT_PROMPT_COLOR%}:%{$ZSH_THEME_GIT_PROMPT_AHEAD_COLOR%}$ahead%{$reset_color%},%{$ZSH_THEME_GIT_PROMPT_BEHIND_COLOR%}$behind"
  elif [ "$ahead" -gt 0 ]; then
    echo "%{$ZSH_THEME_GIT_PROMPT_COLOR%}:%{$ZSH_THEME_GIT_PROMPT_AHEAD_COLOR%}$ahead"
  elif [ "$behind" -gt 0 ]; then
    echo "%{$ZSH_THEME_GIT_PROMPT_COLOR%}:%{$ZSH_THEME_GIT_PROMPT_BEHIND_COLOR%}$behind"
  fi
}

# Time since last commit, in seconds
# Inspired by @goldjunge
# https://github.com/goldjunge/oh-my-zsh/commit/084c44a9cbb82fc6d78396d053539162331fa7c0
function git_time_since_last_commit() {
  sha="$(git_short_sha)"
  if [ -n "$sha" ]; then
    last="$(git log --pretty=format:'%at' -1 2> /dev/null)"
    now="$(date +%s)"

    echo "$((now - last))"
  fi
}

function git_color_for_time_since_last_commit() {
  seconds="$(git_time_since_last_commit)"
  if [ "$seconds" -gt 1800 ]; then
    echo "%{$ZSH_THEME_GIT_TIME_SINCE_LAST_COMMIT_LONG_COLOR%}"
  elif if [ "$seconds" -gt 900 ]; then
    echo "%{$ZSH_THEME_GIT_TIME_SINCE_LAST_COMMIT_MEDIUM_COLOR%}"
  else
    echo "%{$ZSH_THEME_GIT_TIME_SINCE_LAST_COMMIT_SHORT_COLOR%}"
  fi
}

function git_branch_state() {
  branch="$(git_current_branch)"
  if [ -n "$branch" ]; then
    echo "$ZSH_THEME_GIT_PROMPT_BRANCH_PREFIX$branch$ZSH_THEME_GIT_PROMPT_BRANCH_SUFFIX$(git_ahead_behind_state)"
  else
    sha="$(git_short_sha)"
    echo "$ZSH_THEME_GIT_PROMPT_DETACHED_PREFIX$sha$ZSH_THEME_GIT_PROMPT_DETACHED_SUFFIX"
  fi
}

function git_dirty_state() {
  sha="$(git_short_sha)"
  if [ -z "$sha" ]; then
    return
  fi

  untracked="$(git ls-files --other --exclude-standard | wc -l | tr -d ' ')"
  changed="$(git diff --name-status | wc -l | tr -d ' ')"
  staged="$(git diff --staged --name-status | wc -l | tr -d ' ')"

  if  [ "$staged" -gt 0 ]; then
    echo "$(git_color_for_time_since_last_commit)$ZSH_THEME_GIT_PROMPT_STAGED"
  elif [ "$untracked" -gt 0 ] || [ "$changed" -gt 0 ]; then
    echo "$(git_color_for_time_since_last_commit)$ZSH_THEME_GIT_PROMPT_UNSTAGED"
  else
    echo "$(git_color_for_time_since_last_commit)$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi
}

function git_prompt() {
  sha="$(git_short_sha)"
  if [ -n "$sha" ]; then
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(git_branch_state)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}
