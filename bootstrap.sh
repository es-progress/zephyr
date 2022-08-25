# shellcheck shell=bash
##################
## ES-Ubuntu    ##
##              ##
## Bootstrapper ##
##################

# Project structure
###################
# Local configs
export ES_CFG_LOCAL="${PROJECT_ROOT}/local"
# Scripts
export PATH_SCRIPTS_REMIX="${PROJECT_ROOT}/bin/remix"
export PATH_SCRIPTS_CUSTOMIZE="${PROJECT_ROOT}/bin/customize"
export PATH_SCRIPTS_INSTALL="${PROJECT_ROOT}/bin/install"
# Config
export ES_INSTALL_CFG="${PROJECT_ROOT}/config/install"

# Customization profiles
export PATH_PROFILES="${PROJECT_ROOT}/profiles"
# ISO files
export PATH_ISO="${PROJECT_ROOT}/mixing/iso"
# Mount point for iso images
export PATH_MOUNT="${PROJECT_ROOT}/mixing/mnt"
# Extracted files from iso image
export PATH_EXTRACT="${PROJECT_ROOT}/mixing/extract"

# Import configs
source "${PROJECT_ROOT}/ESubuntu.cfg"

# Import shell library
source "${PROJECT_ROOT}/bin/library.sh"
