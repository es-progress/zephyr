# shellcheck shell=bash
######################
## Zephyr           ##
##                  ##
## Shell library    ##
## Helper functions ##
######################

##################
## FORMAT CODES ##
##################

TXT_NORM=$(tput sgr0)
TXT_BOLD=$(tput bold)
TXT_RED=$(tput setaf 1)
TXT_YELLOW=$(tput setaf 3)
TXT_GREEN=$(tput setaf 2)
TXT_BLUE=$(tput setaf 4)

###############
## FUNCTIONS ##
###############

## Print error message
##
## @param    $*  Message
########################
print-error() {
    # shellcheck disable=SC2086
    echo -e ${TXT_RED}${TXT_BOLD}${*}${TXT_NORM} >&2
}

## Print section header
##
## @param    $*  Message
########################
print-section() {
    local msg="${*}"
    echo
    # shellcheck disable=SC2086
    echo -e ${TXT_BLUE}${TXT_BOLD}${*}${TXT_NORM}
    for ((i = 0 ; i < ${#msg} ; i++)); do
        echo -ne "${TXT_BLUE}${TXT_BOLD}=${TXT_NORM}"
    done
    echo
}

## Print header
##
## @param    $*  Message
########################
print-header() {
    # shellcheck disable=SC2086
    echo -e ${TXT_YELLOW}${*}${TXT_NORM}
}

## Print status message
##
## @param    $*  Message
########################
print-status() {
    # shellcheck disable=SC2086
    echo -ne ${TXT_YELLOW}${*}${TXT_NORM}
}

## Print OK message
##
## @param    $*  Message
## @default      Done
########################
# shellcheck disable=SC2120
print-finish() {
    # shellcheck disable=SC2086
    echo -e ${TXT_GREEN}${TXT_BOLD}${*:-Done.}${TXT_NORM}
}

## Print error message and exit
##
## @param    $1  Error message
###############################
error-exit() {
    print-error "${*}"
    exit 1
}

## Check if run as root
#######################
check-root() {
    local userid
    userid=$(id -u)
    if [[ "${userid}" -ne 0 ]]; then
        print-error Run as root!
        return 1
    fi
    return 0
}

## Check if not run as root
###########################
check-not-root() {
    local userid
    userid=$(id -u)
    if [[ "${userid}" -eq 0 ]]; then
        print-error "Don't run as root!"
        return 1
    fi
    return 0
}

## Get config file path
##
## @param   $1  Profile name
## @param   $1  Config file
############################
cfg-get() {
    local profile="${1:?Profile missing}"
    local file="${2:?Config file missing}"

    # First check in selected profile
    if [[ -r "${PATH_PROFILES}/${profile}/${file}" ]]; then
        echo "${PATH_PROFILES}/${profile}/${file}"
        return 0
    fi

    # Fall back to default
    if [[ -r "${PATH_PROFILES}/default/${file}" ]]; then
        echo "${PATH_PROFILES}/default/${file}"
        return 0
    fi

    # Not exists
    return 1
}

## Read config file
##
## @param    $1  Config File
## @param    $2  Section (read only this section)
#################################################
cfg-read() {
    local file="${1:?File missing}"
    local section="${2:-}"
    local contents

    # Remove blank lines, comments
    contents=$(sed -r -e '/^\s*$/ d' -e '/\s*#/ d' "${file}")

    # If a section is supplied return just that
    [[ -n "${section}" ]] && contents=$(sed -nr -e "/^\s*\[${section}\]/ , /^\s*\[.*\]/ p" <<<"${contents}")

    # Delete section headers
    sed -r -e '/^\s*\[/ d' <<<"${contents}"
}

## Eval config file
##
## @param    $1  Config File
## @param    $2  Section (eval only this section)
#################################################
cfg-eval() {
    local cfg_file="${1:?Config file missing}"
    local section="${2:-}"

    for line in $(cfg-read "${cfg_file}" "${section}"); do
        eval "${line}"
    done
}

## Join arguments by char
##
## @param    $1  Joining character
## @param    $*  Items to join
##################################
implode() {
    local IFS="${1:?Field separator missing}"
    shift
    echo "${*}"
}

## Install package via APT
##
## @param    $*  Packages
##########################
install-apt() {
    local install=()
    for package in "${@}"; do
        if dpkg --status "${package}" >/dev/null 2>&1; then
            print-status Install "${package}..."
            print-finish Already installed, skip.
        else
            install+=("${package}")
        fi
    done

    if [[ -z "${install[*]}" ]]; then
        return 0
    fi

    print-header Install "${install[*]}..."
    sudo apt-get update
    sudo apt-get install --yes --no-install-recommends --autoremove "${install[@]}"
    print-finish
}

## Install package via Snap
##
## @param    $1  Package
## @param    $2  Install mode
#############################
install-snap() {
    local package="${1:?Package missing}"
    local mode="${2:-}"
    local options=()
    local snaps_installed

    [[ "${mode}" == classic ]] && options=(--classic)

    snaps_installed=$(snap list --color=never --unicode=never)
    if grep -qs "^${package}" <<<"${snaps_installed}"; then
        print-status Install "${package}..."
        print-finish Already installed, skip.
        return 0
    else
        print-header Install "${package}..."
        sudo snap install "${package}" "${options[@]}"
        print-finish
    fi
}
