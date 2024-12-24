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
# Custom payload to copy to remixed SquashFS
PATH_PAYLOAD="${PROJECT_ROOT}/payload"
# Configuration files for remixing
PATH_REMIX="${PROJECT_ROOT}/remix"
# Temporary directory for remixing
PATH_MIXING="${PROJECT_ROOT}/mixing"
# Mount point for iso images
PATH_MOUNT="${PATH_MIXING}/mnt"
# Extracted files from iso image
PATH_EXTRACT="${PATH_MIXING}/extract"

# Imports
#########
# Shell library
source "${PROJECT_ROOT}/bin/library.sh"
# Defaults
source "${PROJECT_ROOT}/zephyr.cfg"
# Local configs
if [[ -n "${ZEPHYR_CONFIG:-}" && -r "${ZEPHYR_CONFIG}" ]]; then
    # shellcheck disable=SC1090
    source "${ZEPHYR_CONFIG}"
elif [[ -r "${PATH_PROFILES}/zephyr.local.cfg" ]]; then
    # shellcheck disable=SC1091
    source "${PATH_PROFILES}/zephyr.local.cfg"
elif [[ -r "${PROJECT_ROOT}/zephyr.local.cfg" ]]; then
    # shellcheck disable=SC1091
    source "${PROJECT_ROOT}/zephyr.local.cfg"
fi
