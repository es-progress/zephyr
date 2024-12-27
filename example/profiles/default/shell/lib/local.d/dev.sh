# shellcheck shell=bash

## Pretty print serialized PHP object
##
## @param   $1  Serial string
#####################################
ppretty-php() {
    local serial="${1:-}"
    [[ -z "${serial}" ]] && read -r serial

    php <<EOF
<?php
echo "\n";
print_r(unserialize('${serial}'));
echo "\n";
?>
EOF
}
