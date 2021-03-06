# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Adding directory path to bash prompt
PS1="\w: "

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# make vim default text editor
export VISUAL=vim
export EDITOR="$VISUAL"

#Dev mutt for sr.ht
alias dmutt='mutt -F ~/.devmuttrc'

# Base16 Shell
# Current: 3024
# git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
            eval "$("$BASE16_SHELL/profile_helper.sh")"

# (cat ~/.cache/wal/sequences &)
set -o vi

alias u="cd .."
alias c="clear"
alias e=$EDITOR
alias droplet="ssh bauerj@167.99.145.89"

setxkbmap -option ctrl:swapcaps

complete -cf sudo

alias dark="base16_unikitty-dark"
alias light="base16_unikitty-light"

#Adding python scripts installed at user level
export PATH="${PATH}:${HOME}/.local/bin/"

# Adding go path
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$HOME/go/bin

# Adding rust to path
export PATH=$PATH:$HOME/.cargo/bin/

# Adding personal bin to path
export PATH=$PATH:$HOME/bin/

# Digital ocean doesn't like TERM being set to alacitty
export TERM=linux

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
source "$HOME/.cargo/env"
