if [[ ! -z "$EDITOR" ]]
then
	export EDITOR=nano
fi

if [[ ! -z "$SVN_EDITOR" ]]
then
	export SVN_EDITOR=nano
fi

if [[ ! -z "$GIT_EDITOR" ]]
then
	export GIT_EDITOR=nano
fi
