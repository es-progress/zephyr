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

echo Running shell script...
id -u
echo Finished

exit 0
