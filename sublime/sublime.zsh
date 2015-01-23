# Search for Sublime on OS X
if [[ "$OSTYPE" =~ "^darwin" ]]; then

if [[ -x /Applications/Sublime\ Text.app ]]
then
  SUBLIME_EXE=/Applications/Sublime\\\ Text.app/Contents/SharedSupport/bin/subl
fi

fi

# Search for Sublime on Linux
if [[ "$OSTYPE" =~ "^linux" ]]; then

if [[ -x ~/sublime_text_3/sublime_text ]]
then
  SUBLIME_EXE=~/sublime_text_3/sublime_text
fi

if [[ ! -z "$SUBLIME_EXE" ]]
then
	export EDITOR="$SUBLIME_EXE --wait"
	export SVN_EDITOR="$SUBLIME_EXE --wait"
	export GIT_EDITOR="$SUBLIME_EXE --wait"
	alias subl=$SUBLIME_EXE
fi

fi
