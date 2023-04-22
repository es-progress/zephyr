# shellcheck shell=bash
# shellcheck disable=SC2034
##################
## Zephyr       ##
##              ##
## Bootstrapper ##
##################

# Project structure
###################
# Scripts
PATH_SCRIPTS_REMIX="${PROJECT_ROOT}/bin/remix"
PATH_SCRIPTS_CUSTOMIZE="${PROJECT_ROOT}/bin/customize"
PATH_SCRIPTS_INSTALL="${PROJECT_ROOT}/bin/install"
# Customization profiles
PATH_PROFILES="${PROJECT_ROOT}/profiles"
# ISO files
PATH_ISO="${PROJECT_ROOT}/mixing/iso"
# Mount point for iso images
PATH_MOUNT="${PROJECT_ROOT}/mixing/mnt"
# Extracted files from iso image
PATH_EXTRACT="${PROJECT_ROOT}/mixing/extract"

# Imports
#########
# Shell library
source "${PROJECT_ROOT}/bin/library.sh"
# Defaults
source "${PROJECT_ROOT}/zephyr.cfg"
# Local configs
if [[ -r "${PROJECT_ROOT}/zephyr.local.cfg" ]]; then
    # shellcheck disable=SC1091
    source "${PROJECT_ROOT}/zephyr.local.cfg"
fi
