# shellcheck shell=bash
##################
## ES-Ubuntu    ##
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
source "${PROJECT_ROOT}/ESubuntu.cfg"
# Local configs
if [[ -r "${PROJECT_ROOT}/ESubuntu.cfg.local" ]]; then
    source "${PROJECT_ROOT}/ESubuntu.cfg.local"
fi
