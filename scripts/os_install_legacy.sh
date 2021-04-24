#!/usr/bin/env bash
########################
## OLYMPUS            ##
##                    ##
## URANOS             ##
## OS install package ##
########################

##########
# CONFIG #
##########

LIBRARY_DIR="/srv/www/library"
URANOS_DIR="${DIR_OLYMPUS}/_modules/uranos"

################
# SCRIPT START #
################

# Exit on error
set -e

# Allow dot globbing
shopt -s dotglob

# Check if not run as root
if [[ "$(id -u)" -eq 0 ]]; then
  echo "Dont run as root!"
  exit 1
fi

# Create package directory
mkdir -p "${DIR_PACKAGES}/os_install"

# Copy Install scripts & local configs
rsync -r --delete --inplace --exclude=".git*" --exclude="/templates" "${URANOS_DIR}/" "${DIR_PACKAGES}/os_install/"

# Global config
rsync -r --delete --inplace "${DIR_OLYMPUS}/roles/admin/users/files/global" "${DIR_PACKAGES}/os_install/config/"

# Common config
rsync -r --delete --inplace "${DIR_OLYMPUS}/roles/admin/users/files/common" "${DIR_PACKAGES}/os_install/config/"

# Build library
upd doc >/dev/null

# Copy Library html
rsync -aAXHEh --delete --inplace "${LIBRARY_DIR}" "${DIR_PACKAGES}/os_install/"

exit 0
