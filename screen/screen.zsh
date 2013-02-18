zmodload zsh/regex

if [[ "$TERM" -regex-match "^screen" ]]; then
  # called by zsh before executing a command
  function preexec()
  {
    local -a cmd; cmd=(${(z)1})
    print -nR $'\033k'`basename $PWD` $cmd[1]:t$'\033'\\\
  }

  # called by zsh before showing the prompt
  function precmd()
  {
    print -nR $'\033k'`basename $PWD` $SHELL:t$'\033'\\\
  }
fi
