#!/usr/bin/env bash
######################
## Zephyr           ##
##                  ##
## Poweroff routine ##
######################

# Strict mode
set -eufo pipefail
IFS=$'\n\t'

# Execute bash_logout for logged in users
while read -r user; do
    # shellcheck disable=SC1091,SC2312
    if home=$(getent passwd "${user}" | cut -d: -f6) && [[ -r "${home}/.bash_logout" ]]; then
        su "${user}" -c "/usr/bin/env bash '${home}/.bash_logout'"
    fi
done < <(who --count || true)

exit 0
