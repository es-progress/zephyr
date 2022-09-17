## Bash completion for esubuntuctl
##################################
_complete_esubuntuctl() {
    local index="${COMP_CWORD}"
    local cur="${COMP_WORDS[${index}]}"
    local command=${COMP_WORDS[1]}
    local commands="burn create help install partition post-install customize self-install"

    [[ "${index}" == 1 ]] && readarray -t COMPREPLY < <(compgen -W "${commands}" "${cur}")

    if [[ "${index}" == 2 ]]; then
        case "${command}" in
            help) readarray -t COMPREPLY < <(compgen -W "${commands}" "${cur}") ;;
            customize) readarray -t COMPREPLY < <(compgen -W "$(find -L "{{ INSTALL_DIR }}/profiles" -mindepth 1 -maxdepth 1 -type d -printf "%f\n")" "${cur}") ;;
            create|burn|install) readarray -t COMPREPLY < <(compgen -f "${cur}") ;;
        esac
    fi

    if [[ "${index}" == 3 ]]; then
        case "${command}" in
            burn) readarray -t COMPREPLY < <(compgen -f "${cur}") ;;
            customize) readarray -t COMPREPLY < <(compgen -W "$(find "{{ INSTALL_DIR }}/bin/customize" -type f -printf "%f\n")" "${cur}") ;;
        esac
    fi
}

complete -F _complete_esubuntuctl -o filenames esubuntuctl
