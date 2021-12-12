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

TXT_NORM="\e[0m"
TXT_BOLD="\e[1m"
TXT_RED="\e[31m"
TXT_YELLOW="\e[33m"
TXT_GREEN="\e[32m"
TXT_BLUE="\e[34m"

#############
# FUNCTIONS #
#############

# Print error message
#
# @param    $*  Message
#######################
print-error() {
    echo -e "${TXT_RED}${TXT_BOLD}${*}${TXT_NORM}"
}

# Print section header
#
# @param    $*  Message
#######################
print-section() {
    local msg="${*}"
    echo
    echo -e "${TXT_BLUE}${TXT_BOLD}${msg}${TXT_NORM}"
    for ((i = 0 ; i < ${#msg} ; i++)); do
        echo -ne "${TXT_BLUE}${TXT_BOLD}=${TXT_NORM}"
    done
    echo
}

# Print header
#
# @param    $*  Message
#######################
print-header() {
    echo -e "${TXT_YELLOW}${*}${TXT_NORM}"
}

# Print status message
#
# @param    $*  Message
#######################
print-status() {
    echo -n -e "${TXT_YELLOW}${*}${TXT_NORM}"
}

# Print OK message
#
# @param    $*  Message
# @default      Done
#######################
print-finish() {
    echo -e "${TXT_GREEN}${TXT_BOLD}${*:-"Done."}${TXT_NORM}"
}

# Print error message and exit
#
# @param    $1  Error message
##############################
error-exit(){
    print-error "${*}"
    exit 1
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
