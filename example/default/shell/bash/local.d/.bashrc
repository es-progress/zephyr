# shellcheck shell=bash
# shellcheck disable=SC1090
#############
## Zephyr  ##
##         ##
## Bash RC ##
## Local   ##
#############

##########
# PROMPT #
##########

# Get chroot you work in
if [[ -z "${debian_chroot:-}" ]] && [[ -r /etc/debian_chroot ]]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Prompt
PS1="${debian_chroot:+(${debian_chroot})}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "

# Set the terminal title to user@host:dir
case "${TERM}" in
    xterm* | rxvt*) PS1="\[\e]0;${debian_chroot:+(${debian_chroot})}\u@\h: \w\a\]${PS1}" ;;
    *) ;;
esac
