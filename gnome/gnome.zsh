zmodload zsh/regex

# Enable color support for gnome-terminal by setting TERM correctly
if [[ ($COLORTERM = "gnome-terminal") && (! "$TERM" -regex-match "-256color$") ]] then
  export TERM="$TERM-256color"
fi

