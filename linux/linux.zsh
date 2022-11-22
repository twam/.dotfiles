zmodload zsh/regex

# Check if were running OS X
if [[ "$OSTYPE" -regex-match "^linux-gnu$" ]] then

alias psc='ps xawf -eo pid,user,cgroup,args'

fi
