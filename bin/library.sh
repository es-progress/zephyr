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

# Print 'Done'
##############
print-finish() {
    echo -e "${_TXT_GREEN}${_TXT_BOLD}Done.${_TXT_NORM}"
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

# Join arguments by char
#
# @param    $1  Joining character
# @param    $*  Items to join
#################################
implode() {
    local IFS="${1:?"Field separator missing"}"
    shift
    echo "${*}"
}
