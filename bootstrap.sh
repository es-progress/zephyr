# shellcheck shell=bash
##################
## ES-Ubuntu    ##
##              ##
## Bootstrapper ##
##################

# Project structure
###################
# Scripts
export PATH_SCRIPTS_REMIX="${PROJECT_ROOT}/bin/remix"
export PATH_SCRIPTS_CUSTOMIZE="${PROJECT_ROOT}/bin/customize"
export PATH_SCRIPTS_INSTALL="${PROJECT_ROOT}/bin/install"
# Customization profiles
export PATH_PROFILES="${PROJECT_ROOT}/profiles"
# ISO files
export PATH_ISO="${PROJECT_ROOT}/mixing/iso"
# Mount point for iso images
export PATH_MOUNT="${PROJECT_ROOT}/mixing/mnt"
# Extracted files from iso image
export PATH_EXTRACT="${PROJECT_ROOT}/mixing/extract"

# Imports
#########
# Shell library
source "${PROJECT_ROOT}/bin/library.sh"
# Defaults
source "${PROJECT_ROOT}/ESubuntu.default.cfg"
# Local configs
if [[ -r "${PROJECT_ROOT}/ESubuntu.local.cfg" ]]; then
    source "${PROJECT_ROOT}/ESubuntu.local.cfg"
fi
