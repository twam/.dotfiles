# TermSupport from oh-my-zsh (https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/termsupport.zsh)

# usage: title short_tab_title looooooooooooooooooooooggggggg_windows_title
# http://www.faqs.org/docs/Linux-mini/Xterm-Title.html#ss3.1
# Fully support screen, iterm, and probably most modern xterm and rxvt
# Limited support for Apple Terminal (Terminal can't set window or tab separately)
function title {
  if [[ "$TERM" == screen* ]]; then
    print -Pn "\ek$1:q\e\\" #set screen hardstatus, usually truncated at 20 chars
    print -Pn "\eP\e]0;[$1]\a\e\\" # set the xterm window title by escaping (http://serverfault.com/questions/35085/set-xterm-putty-window-title-when-using-screen)
  elif [[ "$TERM" == xterm* ]] || [[ $TERM == rxvt* ]] || [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
    print -Pn "\e]2;$2:q\a" #set window name
    print -Pn "\e]1;$1:q\a" #set icon (=tab) name (will override window name on broken terminal)
  fi
}

ZSH_THEME_TERM_TAB_TITLE_IDLE="%15<..<%~%<<" #15 char left truncated PWD
ZSH_THEME_TERM_TAB_TITLE_SSH_IDLE="%15<..<%~%<<" #15 char left truncated PWD
ZSH_THEME_TERM_TITLE_IDLE="%~"
ZSH_THEME_TERM_TITLE_SSH_IDLE="%n@%m: %~"

# Appears when you have the prompt
function omz_termsupport_precmd {
  if [ $SSH_CONNECTION ]; then
    title $ZSH_THEME_TERM_TAB_TITLE_SSH_IDLE $ZSH_THEME_TERM_TITLE_SSH_IDLE
  else
    title $ZSH_THEME_TERM_TAB_TITLE_IDLE $ZSH_THEME_TERM_TITLE_IDLE
  fi
}

# Appears at the beginning of (and during) of command execution
function omz_termsupport_preexec {
  emulate -L zsh
  setopt extended_glob
  local CMD=${1[(wr)^(*=*|screen|sudo|ssh|rake|-*)]} #cmd name only, or if this is sudo or ssh, the next cmd
  title "$CMD" "%100>...>${2:gs/%/%%}%<<"
}

autoload -U add-zsh-hook
add-zsh-hook precmd  omz_termsupport_precmd
add-zsh-hook preexec omz_termsupport_preexec

