# If not running interactively, don't do anything
[[ -z "${PS1}" ]] && return

# Get chroot you work in
if [[ -z "${debian_chroot:-}" ]] && [[ -r /etc/debian_chroot ]]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Prompt
PS1="${debian_chroot:+(${debian_chroot})}\[\033[01;96m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "

# Set the terminal title to user@host:dir
case "${TERM}" in
    xterm* | rxvt*) PS1="\[\e]0;${debian_chroot:+(${debian_chroot})}\u@\h: \w\a\]${PS1}" ;;
    *) ;;
esac

# set PATH so it includes user's private bin if it exists
if [[ -d "${HOME}/bin" ]] ; then
    if ! grep -qs -F "${HOME}/bin" <<< "${PATH}"; then
        PATH="${HOME}/bin:${PATH}"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [[ -d "${HOME}/.local/bin" ]] ; then
    if ! grep -qs -F "${HOME}/.local/bin" <<< "${PATH}"; then
        PATH="${HOME}/.local/bin:${PATH}"
    fi
fi
