# shellcheck shell=bash
######################
## ES-Ubuntu        ##
##                  ##
## Shell library    ##
## Helper functions ##
######################

################
# FORMAT CODES #
################

_TXT_NORM="\e[0m"
_TXT_BOLD="\e[1m"
_TXT_RED="\e[31m"
_TXT_YELLOW="\e[33m"
_TXT_GREEN="\e[32m"
_TXT_BLUE="\e[34m"

#############
# FUNCTIONS #
#############

# Print error message
#
# @param    $*  Message
#######################
print-error() {
    echo -e "${_TXT_RED}${_TXT_BOLD}${*}${_TXT_NORM}"
}

# Print section header
#
# @param    $*  Message
#######################
print-section() {
    echo
    echo -e "${_TXT_BLUE}${_TXT_BOLD}${*}${_TXT_NORM}"
}

# Print header
#
# @param    $*  Message
#######################
print-header() {
    echo
    echo -e "${_TXT_YELLOW}${*}${_TXT_NORM}"
}

# Print status message
#
# @param    $*  Message
#######################
print-status() {
    echo -n -e "${_TXT_YELLOW}${*}${_TXT_NORM}"
}

# Print OK message
#
# @param    $*  Message
# @default      Done
#######################
print-finish() {
    echo -e "${_TXT_GREEN}${_TXT_BOLD}${*:-"Done."}${_TXT_NORM}"
}

# Check if not run as root
##########################
check-not-root() {
    if [[ $(id -u) -eq 0 ]]; then
        print-error "Don't run as root!"
        return 1
    fi
    return 0
}

# Read config file
#
# @param    $1  Config File
# @param    $2  Section (read only this section)
################################################
read-file-cfg(){
    local file="${1:?"File missing"}"
    local section="${2:-}"
    local contents

    # Remove blank lines, comments
    contents=$(sed -r -e '/^\s*$/ d' -e '/\s*#/ d' "${file}")

    # If a section is supplied return just that
    [[ -n "${section}" ]] && contents=$(sed -nr -e "/^\s*\[${section}\]/ , /^\s*\[.*\]/ p" <<<"${contents}")

    # Delete section headers
    sed -r -e '/^\s*\[/ d' <<<"${contents}"
}
