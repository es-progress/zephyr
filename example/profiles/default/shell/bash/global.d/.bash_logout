# shellcheck shell=bash
#################
## Zephyr      ##
##             ##
## Bash logout ##
## Global      ##
#################

# Release sudo
/usr/bin/sudo -K

# Clear MySQL history
if [[ -f ~/.mysql_history ]]; then
    /usr/bin/rm -f ~/.mysql_history
fi
# Clear PHP history
if [[ -f ~/.php_history ]]; then
    /usr/bin/rm -f ~/.php_history
fi
# Clear Bash history
history -c
if [[ -f ~/.bash_history ]]; then
    /usr/bin/rm -f ~/.bash_history
fi

# Clear screen
/usr/bin/clear
