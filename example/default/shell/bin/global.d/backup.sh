#!/usr/bin/env bash
##################
## Zephyr       ##
##              ##
## Example      ##
## Shell script ##
##################

# Strict mode
set -eufo pipefail
IFS=$'\n\t'

echo Simulate backup shell script...
echo rsync -av /home /mnt/backup
echo Finished

exit 0
