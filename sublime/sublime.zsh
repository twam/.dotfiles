# Search for Sublime on OS X
if [[ -x /Applications/Sublime\ Text.app ]]
then
  alias subl=/Applications/Sublime\\\ Text.app/Contents/SharedSupport/bin/subl
fi

# Search for Sublime on Linux
if [[ -x ~/sublime_text_3/sublime_text ]]
then
  alias subl=~/sublime_text_3/sublime_text
fi

