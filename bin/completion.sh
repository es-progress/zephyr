# shellcheck shell=bash
## Bash completion for zephyrctl
################################
__zephyrctl_complete() {
    local cur words cword command commands profiles scripts categories maps
    _init_completion

    command="${words[1]}"
    commands=(extract-grub burn remix help launch disk post-install customize install uninstall)
    profiles=
    [[ -r "{{ INSTALL_DIR }}/profiles" ]] && profiles=$(find -L "{{ INSTALL_DIR }}/profiles" -mindepth 1 -maxdepth 1 -type d -printf "%f\n")
    scripts=$(find "{{ INSTALL_DIR }}/bin/customize" -mindepth 2 -type f -executable -printf "%f\n^%f\n")
    categories=$(find "{{ INSTALL_DIR }}/bin/customize" -mindepth 1 -maxdepth 1 -type d -printf "%f\n^%f\n")

    case "${cword}" in
        1) __zephyr_gen_word "${commands[*]}" ;;
        2)
            case "${command}" in
                help) __zephyr_gen_word "${commands[*]}" ;;
                post-install) __zephyr_gen_word live install dev ;;
                customize) __zephyr_gen_word "${profiles}" ;;
                extract-grub|remix|burn) __zephyr_gen_file ;;
                disk) __zephyr_gen_word decrypt encrypt format info lvm partition zap ;;
                *) ;;
            esac
            ;;
        3)
            case "${command}" in
                extract-grub|remix|burn) __zephyr_gen_file ;;
                customize) __zephyr_gen_word "${scripts}" "${categories}" ;;
                disk|post-install) __zephyr_gen_word "${profiles}" ;;
                *) ;;
            esac
            ;;
        *)
            case "${command}" in
                customize) __zephyr_gen_word "${scripts}" "${categories}" ;;
                disk|post-install)
                    maps=
                    [[ -r "{{ INSTALL_DIR }}/profiles" ]] && maps=$(find -L "{{ INSTALL_DIR }}/profiles" -type f -path "*${words[3]}/install/disk-maps*" -printf "%f\n")
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
