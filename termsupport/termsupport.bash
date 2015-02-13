case "$TERM" in
xterm*|rxvt*)
	echo "test" | sed -r 's|test||' > /dev/null 2>&1
	if [ $? -eq 0 ]; then
		PWDSHORT=`echo "$PWD" | sed -r 's|^.+(/[^/]*/[^/]*)$|...\1|'`
	fi

    if [[ -z $PROMPT_COMMAND ]]; then
    	if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    	    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME} ${PWDSHORT}\007"'
        else
    	    PROMPT_COMMAND='echo -ne "\033]0;${PWDSHORT}\007"'
    	fi
    fi

    # Show the currently running command in the terminal title:
    # http://www.davidpashley.com/articles/xterm-titles-with-bash.html
    show_command_in_title_bar()
    {
        case "$BASH_COMMAND" in
            *\033]0*)
                # The command is trying to set the title bar as well;
                # this is most likely the execution of $PROMPT_COMMAND.
                # In any case nested escapes confuse the terminal, so don't
                # output them.
                ;;
            *)
                echo -ne "\033]0;${BASH_COMMAND}\007"
                ;;
        esac
    }
    trap show_command_in_title_bar DEBUG
    ;;
*)
    ;;
esac
