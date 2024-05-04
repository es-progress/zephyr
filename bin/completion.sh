# shellcheck shell=bash
## Bash completion for zephyrctl
################################
__zephyrctl_complete() {
    local cur words cword command commands profiles scripts categories maps
    _init_completion

    command="${words[1]}"
    commands=(burn remix help partition format post-install customize install uninstall)
    profiles=$(find -L "{{ INSTALL_DIR }}/profiles" -mindepth 1 -maxdepth 1 -type d -printf "%f\n")
    scripts=$(find "{{ INSTALL_DIR }}/bin/customize" -mindepth 2 -type f -executable -printf "%f\n~%f\n")
    categories=$(find "{{ INSTALL_DIR }}/bin/customize" -mindepth 1 -maxdepth 1 -type d -printf "%f\n~%f\n")

    case "${cword}" in
        1) __zephyr_gen_word "${commands[*]}" ;;
        2)
            case "${command}" in
                help) __zephyr_gen_word "${commands[*]}" ;;
                post-install) __zephyr_gen_word live install dev ;;
                customize|partition|format) __zephyr_gen_word "${profiles}" ;;
                remix|burn) __zephyr_gen_file ;;
                *) ;;
            esac
            ;;
        3)
            case "${command}" in
                remix|burn) __zephyr_gen_file ;;
                customize) __zephyr_gen_word "${scripts}" "${categories}" ;;
                post-install) __zephyr_gen_word "${profiles}" ;;
                partition|format)
                    maps=$(find -L "{{ INSTALL_DIR }}/profiles" -type f -path "*${words[2]}/install/disk-maps*" -printf "%f\n")
                    __zephyr_gen_word "${maps}"
                    ;;
                *) ;;
            esac
            ;;
        *)
            case "${command}" in
                customize) __zephyr_gen_word "${scripts}" "${categories}" ;;
                post-install)
                    maps=$(find -L "{{ INSTALL_DIR }}/profiles" -type f -path "*${words[3]}/install/disk-maps*" -printf "%f\n")
                    __zephyr_gen_word "${maps}"
                    ;;
                partition|format)
                    maps=$(find -L "{{ INSTALL_DIR }}/profiles" -type f -path "*${words[2]}/install/disk-maps*" -printf "%f\n")
                    __zephyr_gen_word "${maps}"
                    ;;
                *) ;;
            esac
            ;;

    esac
}

## Generate completions from word list
##
## @param   $*  Word list
######################################
__zephyr_gen_word() {
    local result
    result=$(compgen -W "${*}" "${cur}")
    readarray -t COMPREPLY <<<"${result}"
}

## Generate completions from filenames
######################################
__zephyr_gen_file() {
    local result
    result=$(compgen -f "${cur}")
    readarray -t COMPREPLY <<<"${result}"
}

complete -F __zephyrctl_complete -o filenames zephyrctl
