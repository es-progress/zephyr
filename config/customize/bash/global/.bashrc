# shellcheck shell=bash
###############
## ES-Ubuntu ##
##           ##
## Bash RC   ##
## Global    ##
###############

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return ;;
esac

###########
# OPTIONS #
###########

# . matching
shopt -s dotglob

# Check window size after each command & update LINES and COLUMNS
shopt -s checkwinsize

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

# umask (o-rwx on newly created files)
umask 007

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
