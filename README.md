# ESubuntu

This is a custom Ubuntu remix. It is packaged as a bootable ISO file,
which can be burned to an USB stick and can act like a rescue (live) CD.
Then you can install ESubuntu.

If you implement your own customizations (probably not the ones I prefer :wink:),
you can have an installer that creates an Ubuntu system which is already configured for you.

Basically you can fully automate Ubuntu customization & configuration.

## Customizations

There are several customizations:

- Packages
    - Install extra packages
    - Removed some default ones
- GNOME
    - Key-bindings
    - Bookmarks
    - /home directory structure
- bash
    - Shell scripts
    - Aliases
    - `.bashrc`
    - Bash completion
- Config packages
- Misc
    - Set up cron jobs
    - Create self-signed certificate

etc...

## Building

Scripts included so you can build your own ISO.

**Scripts**
- Unpack official Ubuntu ISO
- Apply customizations
- Pack files and create bootable ISO file
