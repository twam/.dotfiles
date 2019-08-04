if (( ${+aliases[subl]} )) ; then
  export EDITOR="`whence subl` --wait"
  export SVN_EDITOR="`whence subl` --wait"
  export GIT_EDITOR="`whence subl` --wait"
fi

if (( ${+commands[subl]} )) ; then
  export EDITOR="subl --wait"
  export SVN_EDITOR="subl --wait"
  export GIT_EDITOR="subl --wait"
fi
