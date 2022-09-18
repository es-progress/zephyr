## Bash completion for esubuntuctl
##################################
__esubuntuctl_complete() {
    local cur words cword command commands profiles scripts
    _init_completion

    command="${words[1]}"
    commands=(burn create help install partition post-install customize self-install)
    profiles=$(find -L "{{ INSTALL_DIR }}/profiles" -mindepth 1 -maxdepth 1 -type d -printf "%f\n")
    scripts=$(find "{{ INSTALL_DIR }}/bin/customize" -type f -printf "%f\n")

    case "${cword}" in
        1) __esubuntu_gen_word "${commands[*]}" ;;
        2)
            case "${command}" in
                help) __esubuntu_gen_word "${commands[*]}" ;;
                customize) __esubuntu_gen_word "${profiles}" ;;
                create|burn|install) __esubuntu_gen_file ;;
                *) ;;
            esac
            ;;
        3)
            case "${command}" in
                burn) __esubuntu_gen_file ;;
                customize) __esubuntu_gen_word "${scripts}" ;;
                *) ;;
            esac
            ;;
        *) ;;
    esac
}

## Generate completions from word list
##
## @param   $*  Word list
######################################
__esubuntu_gen_word() {
    local result
    result=$(compgen -W "${*}" "${cur}")
    readarray -t COMPREPLY <<<"${result}"
}

## Generate completions from filenames
######################################
__esubuntu_gen_file() {
    local result
    result=$(compgen -f "${cur}")
    readarray -t COMPREPLY <<<"${result}"
}

complete -F __esubuntuctl_complete -o filenames esubuntuctl
