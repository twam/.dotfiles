# Search for OpenSCAD on OS X
if [[ "$OSTYPE" =~ ^darwin ]]; then

if [[ -x /Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD ]]
then
  alias openscad=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD
fi

fi
