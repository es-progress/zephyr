# shellcheck shell=bash
###############
## ES-Ubuntu ##
##           ##
## Bash RC   ##
## Global    ##
###############

# If not running interactively, don't do anything
[ -z "${PS1}" ] && return

###########
# OPTIONS #
###########

# . matching
shopt -s dotglob
# Autocd
shopt -s autocd
# Exit pipe on non-zero return value
set -o pipefail
# Allow pipe to read
shopt -s lastpipe

# Don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth
# Don't save bash history
unset HISTFILE
# Don't save less history
export LESSHISTFILE=-

##########
# PROMPT #
##########

# Get chroot you work in
if [[ -z "${debian_chroot:-}" ]] && [[ -r /etc/debian_chroot ]]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Prompt
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;96m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Set the terminal title to user@host:dir
case "$TERM" in
    xterm* | rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    *) ;;
esac

########
# PATH #
########

# set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ] ; then
    if ! grep -qs -F "${HOME}/bin" <<< "${PATH}"; then
        PATH="${HOME}/bin:${PATH}"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/.local/bin" ] ; then
    if ! grep -qs -F "${HOME}/.local/bin" <<< "${PATH}"; then
        PATH="${HOME}/.local/bin:${PATH}"
    fi
fi

##########
# RANDOM #
##########

# Make less friendly
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"

# Enable programmable completion features
if ! shopt -oq posix; then
    if [[ -f /usr/share/bash-completion/bash_completion ]]; then
        . /usr/share/bash-completion/bash_completion
    elif [[ -f /etc/bash_completion ]]; then
        . /etc/bash_completion
    fi
fi

############
# INCLUDES #
############

# Environment variables
[[ -r ~/.bash/env_vars.local ]] && source ~/.bash/env_vars.local
# Local .bashrc
[[ -r ~/.bash/rc.local ]] && source ~/.bash/rc.local
# Common alias
[[ -r ~/.bash/alias ]] && source ~/.bash/alias
# Local alias
[[ -r ~/.bash/alias.local ]] && source ~/.bash/alias.local
# Bash completion
[[ -r ~/.bash/completion.local ]] && source ~/.bash/completion.local
# Bash goto command
[[ -r ~/.bash/goto ]] && source ~/.bash/goto
