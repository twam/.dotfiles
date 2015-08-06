zmodload zsh/regex

# Check if were running OS X
if [[ "$OSTYPE" -regex-match "^cygwin$" ]] then

alias open='cygstart'

fi
