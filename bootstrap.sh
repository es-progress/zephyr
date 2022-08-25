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
export PATH_SCRIPTS_REMIX="${PROJECT_ROOT}/bin/bundle"
export ES_CUSTOMIZE_SCRIPTS="${PROJECT_ROOT}/bin/customize"
export ES_INSTALL_SCRIPTS="${PROJECT_ROOT}/bin/install"
# Config
export ES_CUSTOMIZE_CFG="${PROJECT_ROOT}/config/customize"
export ES_INSTALL_CFG="${PROJECT_ROOT}/config/install"
# Files
export ES_CUSTOMIZE_FILES="${PROJECT_ROOT}/files"

# Customization profiles
export PATH_PROFILES="${PROJECT_ROOT}/profiles"
# ISO files
export PATH_ISO="${PROJECT_ROOT}/bundling/iso"
# Mount point for iso images
export PATH_MOUNT="${PROJECT_ROOT}/bundling/mnt"
# Extracted files from iso image
export PATH_EXTRACT="${PROJECT_ROOT}/bundling/extract"

# Import configs
source "${PROJECT_ROOT}/ESubuntu.cfg"

# Import shell library
source "${PROJECT_ROOT}/bin/library.sh"
