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
export ES_BUNDLE_SCRIPTS="${PROJECT_ROOT}/bin/bundle"
export ES_CUSTOMIZE_SCRIPTS="${PROJECT_ROOT}/bin/customize"
export ES_INSTALL_SCRIPTS="${PROJECT_ROOT}/bin/install"
# Config
export ES_CUSTOMIZE_CFG="${PROJECT_ROOT}/config/customize"
export ES_INSTALL_CFG="${PROJECT_ROOT}/config/install"
# Files
export ES_CUSTOMIZE_FILES="${PROJECT_ROOT}/files"

export PATH_PROFILES="${PROJECT_ROOT}/profiles"

# Import configs
source "${PROJECT_ROOT}/ESubuntu.cfg"

# Import shell library
source "${PROJECT_ROOT}/bin/library.sh"
