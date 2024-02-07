# Modules

This is the reference documentation for the customization modules that are part of Zephyr :eight_spoked_asterisk:.
These modules allow you to customize your system according to your preferences and usage.
They are organized into different categories, such as `apps`, `services`, and more.

Modules can be configured by Profiles, which are a collection of config files and possibly some other files that are relevant to the module (e.g. `.tff` files for Fonts module).
Module-specific files are located in the directory named after the module, e.g. `gnome/fonts` for Fonts.
Other module settings can be found in the category's config file, e.g. `gnome/global.cfg`.
This file contains headers (`[some-header]`) that contains different settings and the format for the configurations are varied.
Empty lines and lines starting with `#` are ignored.

All global configuration directory and file have a local counterpart.
If there is `global` in the name of a directory (or file) it can be replaced with `local` to get the counterpart.
For example, `gnome/fonts/global.d` ==> `gnome/fonts/local.d` and `gnome/global.cfg` ==> `gnome/local.cfg`.
Only the `global` files will be listed in the documentation for brevity.

For examples check the `example/default` directory.

---

## Application modules

These modules allow you to modify applications according to your usage and preferences.

### atom

The module handles the installation of the Atom text editor and configuration of preferred packages, themes, and settings.

**Configuration**

-   `apps/atom/global.d`: files in this directory will be copied to `~/.atom/` and the directory structure will be preserved.
    You can put your configuration files here like `config.cson`, `init.coffee`, `keymap.cson` etc.
-   `apps/global.cfg`:
    -   `atom-packages`: a list of Atom packages to install. Format: one package per line.

---

### jmeter

Installation of Apache JMeter, a load-testing testing tool.

**Configuration**

-   `apps/global.cfg`:
    -   `jmeter`: jmeter script settings. Format: INI-file format.
        -   `url`: download URL
        -   `checksum`: SHA512 checksum
        -   `install_dir`: installation directory

---

### pulse-effects

Manage output audio presets for PulseEffects.

!!! warning "PulseEffects is not installed by this module"

    Use the `packages/apt` module to install it!

**Configuration**

-   `apps/pulse-effects/global.d`: output presets.

---

### vbox

The module is for the configuration of VirtualBox virtualization software.

!!! warning "VirtualBox is not installed by this module"

    Use the `packages/apt` module to install it!

**Configuration**

-   `apps/vbox/vm.global.d`: virtual machines definitions. You need to create a sub-directory for each VM and put `.vbox` files in it.

-   `apps/global.cfg`:
    -   `virtualbox-vboxmanage`: Virtualbox settings to apply. Format: "config_name value" (one setting per line).
    -   `virtualbox-settings`: parameters for vbox script. Currently only `VM_LOCAL_DIR` (directory for virtual machines) is supported.
    -   `virtualbox-virtmachines`: virtual machines definitions. Format: "vm+=(vm_dir@UUID)".

---

## GNOME modules

These modules allow you to customize and manage different aspects of your GNOME desktop environment.

### autostart

With the autostart module you can control which applications should start automatically when you log into your GNOME desktop.

**Configuration**

-   `gnome/autostart/global.d`: `.desktop` files for each application you wish to autostart.

---

### dash-to-panel

This module installs the GNOME shell extension Dash to Panel and allows you to customize it.

**Configuration**

-   `gnome/dash-to-panel/global.d`: `.dconf` configuration files for Dash to Panel.
-   `gnome/global.cfg`:
    -   `dash-to-panel`: dash-to-panel script settings. Format: INI-file format.
        -   `version`: Dash to Panel extension version to install (git tag to checkout)

---

### fonts

It installs additional fonts.

**Configuration**

-   `gnome/fonts/global.d`: `.tff` files for different fonts. Create a sub-directory for each font family and put the `.tff` files in it.

---

### gnome-config

This module provides global configuration options for the GNOME desktop environment.

**Configuration**

-   `gnome/config/global.d`: you can place your GNOME desktop-wide customization files in this directory (`.dconf` files).

---

### user-dirs

This module is responsible for customizing user directories.

**Configuration**

-   `gnome/user-dirs.defaults`: this will be your custom `/etc/xdg/user-dirs.defaults` file.
-   `gnome/user-dirs.dirs`: your custom `~/.config/user-dirs.dirs` file.
-   `gnome/global.cfg`:
    -   `bookmarks`: Nautilus bookmarks. Format: "file:///path/to/bookmarked/dir" (one per line).

---

### wallpaper

With this module you can set the desktop background.

**Configuration**

-   `gnome/wallpaper.jpg`: your wallpaper image.

---

## Package modules

With the help of the following modules you can install packages using various package managers.

### apt

The apt module assists with the management of packages using the Debian package manager (APT).

!!! note "It also upgrades all installed packages!"

**Configuration**

-   `packages/global.cfg`:
    -   `apt-install`: APT packages to install. Format: "package_name apt_repository" (one per line, apt_repository optional).
    -   `apt-remove`: APT packages to remove. Format: "package_name" (one per line).

---

### bin

Shell binaries (or scripts, PHAR files, basically any executable file) to download and install to `/usr/local/bin/`.

!!! note

    This module needs the `bin_global` configuration to be defined in `shell/scripts` module to work.

**Configuration**

-   `packages/global.cfg`:
    -   `bin`: shell binaries to install. Format: "Name URL SHA256SUM" (one per line, SHA256SUM optional).

---

### node

With the node module you can install Node.js packages.

!!! note "It will also install nodejs and npm if not already installed."

**Configuration**

-   `packages/global.cfg`:
    -   `node`: Node modules to install. Format: "package_name" (one per line).

---

### pip

This module is used to manage Python packages installed via pip.

!!! note "It will install pip if not installed."

**Configuration**

-   `packages/pip.global`: pip requirements file.

---

### snap

The snap module assists with installing Snap packages.

!!! note "It will install snapd if not installed and purge old revisions of installed snaps."

**Configuration**

-   `packages/global.cfg`:
    -   `snap`: snaps to install. Format: "snap_name install_mode" (one per line, install_mode optional, e.g. "classic").
