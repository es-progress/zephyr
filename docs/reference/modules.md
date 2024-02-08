# Modules

This is the reference documentation for the [customization modules](../customize.md#modules) that are part of Zephyr :eight_spoked_asterisk:.
These modules allow you to customize your system according to your preferences and usage.
They are organized into different categories, such as `apps`, `services`, and more.

Modules can be configured by [Profiles](../profiles.md), which are a collection of config files and possibly some other files that are relevant to the module (e.g. `.tff` files for Fonts module).
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

The module handles the installation of the [Atom text editor](https://atom.io){target=\_blank} and configuration of preferred packages, themes, and settings.

**Configuration**

-   `apps/atom/global.d`: files in this directory will be copied to `~/.atom/` and the directory structure will be preserved.
    You can put your configuration files here like `config.cson`, `init.coffee`, `keymap.cson` etc.
-   `apps/global.cfg`:
    -   `atom-packages`: a list of Atom packages to install. Format: one package per line.

---

### jmeter

Installation of [Apache JMeter](https://jmeter.apache.org/){target=\_blank}, a load-testing testing tool.

**Configuration**

-   `apps/global.cfg`:
    -   `jmeter`: jmeter script settings. Format: INI-file format.
        -   `url`: download URL
        -   `checksum`: SHA512 checksum
        -   `install_dir`: installation directory

---

### pulse-effects

Manage output audio presets for [PulseEffects](https://github.com/wwmm/easyeffects){target=\_blank}.

!!! warning "PulseEffects is not installed by this module"

    Use the `packages/apt` module to install it!

**Configuration**

-   `apps/pulse-effects/global.d`: output presets.

---

### vbox

The module is for the configuration of [VirtualBox virtualization software](https://www.virtualbox.org/){target=\_blank}.

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

These modules allow you to customize and manage different aspects of your [GNOME desktop environment](https://www.gnome.org/){target=\_blank}.

### autostart

With the autostart module you can control which applications should start automatically when you log into your GNOME desktop.

**Configuration**

-   `gnome/autostart/global.d`: `.desktop` files for each application you wish to autostart.

---

### dash-to-panel

This module installs the GNOME shell extension [Dash to Panel](https://extensions.gnome.org/extension/1160/dash-to-panel/){target=\_blank} and allows you to customize it.

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

---

## Random modules

Other, non-categorized modules.

### cron

With this module you can setup weekly and daily cron jobs.

**Configuration**

-   `random/global.cfg`:
    -   `cron-weekly`: weekly cron jobs. Format: "script_path job_name" (one per line).
    -   `cron-daily`: daily cron jobs. Format: "script_path job_name" (one per line).

---

### goto

With this module you can add aliases to to [Bash Goto](https://github.com/iridakos/goto){target=\_blank}.

!!! note

    For this to work you need to install Bash Goto first.

**Configuration**

-   `random/global.cfg`:
    -   `goto`: Bash Goto aliases. Format: "alias directory" (one per line).

---

### local

This module executes your local, custom modules.

**Configuration**

-   `random/local/global.d`: any executable file in this directory will be run.
    During execution the current working directory will be this directory, so you can use relative paths to access files in this directory if your module needs extra files.

---

## Service modules

These modules allow you to configure various services such as database servers, web servers.

### apache

The module is for the configuration of the [Apache web server](https://httpd.apache.org/){target=\_blank}.

!!! note

    This module does not install Apache. Use the `packages/apt` module to install it!

    Also you need to run `system/certificate` module beforehand to generate self-signed SSL certificates, which will be used by Apache.

**Configuration**

-   `services/apache/config.global.d`: use this directory to place Apache's configuration files (`.conf`).
-   `services/apache/vhost-default.conf`: default virtual host file.
-   `services/global.cfg`:
    -   `apache`: apache script settings. Format: INI-file format.
        -   `web_root`: web root for virtual hosts
        -   `def_virt_host_name`: name for default vhost (which will also be used for certificate and key filenames)
        -   `def_virt_host_subject`: default virtual host certificate subject
    -   `apache-module`: list of Apache modules to enable. Format: "module_name" (one per line).

---

### mariadb

This will install & customize [MariaDB database server](https://mariadb.org/){target=\_blank}, including creating an admin user with full privileges.

**Configuration**

-   `services/mariadb/global.d`: directory for MariaDB's configuration files (`.cnf`).
-   `services/global.cfg`:
    -   `mariadb`: mariadb script settings. Format: INI-file format.
        -   `repo`: MariaDB APT repository URL
        -   `admin_name`: username for MySQL admin user
        -   `admin_pass`: password for MySQL admin user

---

### php

This module will configure [PHP](https://www.php.net/){target=\_blank} and start the PHP-FPM service with Apache.

!!! note

    This module does not install PHP. Use the `packages/apt` module to install it!

    Also it expects Apache to be installed.

**Configuration**

-   `services/php/global.d`: directory for PHP's `.ini` configuration files.
-   `services/global.cfg`:
    -   `php`: php script settings. Format: INI-file format.
        -   `version`: PHP version

---

### phpmyadmin

Use this module to install and configure [phpMyAdmin](https://www.phpmyadmin.net/){target=\_blank}. It also creates phpMyAdmin control database & user.

!!! note

    phpMyAdmin needs a LAMP stack to work, so you need to install Apache, MariaDB and PHP first.

**Configuration**

-   `services/phpmyadmin/config.inc.php`: phpMyAdmin configuration file.
-   `services/global.cfg`:
    -   `phpmyadmin`: php script settings. Format: INI-file format.
        -   `url`: Download URL for phpMyAdmin tarball
        -   `checksum`: SHA256 checksum for download tar-archive
        -   `service_user`: phpMyAdmin control user name
        -   `service_pass`: phpMyAdmin control user password

---

## Shell modules

Modules to customize Bash and install your custom shell scripts.

### bash

This module is called `bash` but it could have been called `home-dir` too, as it setup your whole home directory not just Bash (through `.bashrc`).
Typically you would put your custom `.bashrc` here, but you can put any file here and it will be copied to your home directory: like `.profile`, `.inputrc` etc.
In this module there is a difference between `global` and `local` files.
Global files are installed globally for all users, and local files are installed only for the current user.

**Configuration**

-   `shell/bash/global.d`: all files here will be copied to your HOME directory, `/root`, `/etc/skel` so it will be default for new users and root too.
    The directory structure will be preserved, so you can implement your custom directory structure.
-   `shell/bash/local.d`: files in this directory will be copied only to your HOME directory so it's local for the current user only with directory structure preserved.
-   `shell/bash/root.d`: these files will be copied to `/root` to customize root's Bash only (directory structure preserved).

---

### scripts

This module installs your custom shell scripts to directories that are in your `PATH` (configurable).
In this module there is a difference between `global` and `local` files.
Global files are installed to `/usr/local/bin` (by default) - so it's global for all users - and local files are installed to `~/bin` (by default) - so it's local for the current user only.

**Configuration**

-   `shell/bin/global.d`: contains system-wide shell scripts.
-   `shell/bin/local.d`: contains shell scripts for the current user.
-   `shell/lib/global.d`: contains system-wide shell libraries.
-   `shell/lib/local.d`: contains shell libraries for the current user.
-   `shell/global.cfg`:
    -   `scripts`: scripts script settings. Format: INI-file format.
        -   `bin_global`: Directory for global shell scripts
        -   `bin_local`: Directory for local shell scripts
        -   `lib_global`: Directory for global shell library
        -   `lib_local`: Directory for local shell library

---

## System modules

The modules under this category are mainly used for customizing system-wide settings and Linux subsystems.

### certificates

This module handles the generation and installation of a Machine Owner Key (MOK) and self-signed SSL certificates.
This certificate is a root Certificate Authority (CA) for the system and can be used to sign other certificates.
The CA certificate is installed in the system and Firefox trusted certificate store, so all certificates signed by this CA will be trusted by the system and Firefox.
Certificates signed by this CA are used by the `services/apache` and the `services/phpmyadmin` module.

**Configuration**

-   `system/firefox-policies.json`: Firefox policy file.
-   `system/global.cfg`:
    -   `certificate`: certificates script settings. Format: INI-file format.
        -   `root_ca_name`: self-signed Root Certificate Authority (CA) name
        -   `root_ca_subject`: root CA subject
        -   `mok_key_name`: Machine Owner Key (MOK) name
        -   `mok_key_subject`: MOK subject

---

### dirs

Create directories and set permissions for them.

**Configuration**

-   `system/global.cfg`:
    -   `dirs-create`: directories to create, you can use variables like `$USER` as owner. Format: "path owner" (one per line, owner optional).
    -   `dirs-remove`: directories to delete. Format: "path" (one per line).
    -   `perms`: permission settings. Format: INI-file format.
        -   `perm_home`: permission to set on $HOME (non-recursive). Use format allowed by `chmod` command.

---

### fstab

Manage the `/etc/fstab` file. Currently only adds `noatime` to all partitions.

---

### fstrim

Configure the `fstrim` service.

**Configuration**

-   `system/fstrim/global.d`: `systemd` service configuration files (`.conf`).

---

### groups

Adds the current user to the specified groups.

**Configuration**

-   `system/global.cfg`:
    -   `groups`: user groups to add current user to. Format: "group_name" (one per line).

---

### locale

Configures system locale.

**Configuration**

-   `system/global.cfg`:
    -   `locales`: locales to install. Format: "locale_name" (one per line).
    -   `locale`: set locale. You can use different locale in each locale categories. Format: "category name" (one per line).

---

### netplan

This module is responsible for network plan creation and management (netplan).
Also disables connectivity checking.

**Configuration**

-   `system/netplan/global.d`: Place to put your network plans.

---

### resolved

Configure the systemd DNS resolver `systemd-resolved` service.

**Configuration**

-   `system/resolved/global.d`: `systemd` service configuration files (`.conf`).

---

### shorewall

This is used to install & configure the [Shorewall firewall](https://shorewall.org/){target=\_blank}.

!!! note

    You can use the `{{ interface }}` string as template in the `interfaces` file and the module will replace it with the actual interface name.

**Configuration**

-   `system/shorewall/global.d`: Contains files for zones, policy, interfaces and rules.
    All files here will be copied to `/etc/shorewall/` with directory structure preserved.

---

### sudo

Configure `sudo`.

!!! warning

    Configuration files will be verified by `sudo` before they are installed, so syntax errors will be caught.

    However, be careful with this module, as it can lock you out of `sudo` if you make a mistake in the configuration files!

**Configuration**

-   `system/sudo/global.d`: custom `sudoers` configuration files. These files will be copied to `/etc/sudoers.d/`.

---

## Tool modules

The Tool modules provide configurations for various tools.

### composer

This module provides configuration settings for the [Composer dependency manager](https://getcomposer.org/){target=\_blank} for PHP and installs it globally.
Bash completion is also installed.

**Configuration**

-   `tools/global.cfg`:
    -   `composer`: composer script settings. Format: INI-file format.
        -   `url`: download URL for composer PHAR file
        -   `checksum`: SHA256 checksum for downloaded PHAR file

---

### dig

Configure `dig` DNS lookup utility.

!!! warning "dig is not installed by this module"

    Use the `packages/apt` module to install it!

**Configuration**

-   `tools/digrc`: your custom `.digrc` file.

---

### gh

This installs the [GitHub CLI](https://cli.github.com/){target=\_blank} tool with Bash completion.

**Configuration**

-   `tools/global.cfg`:
    -   `gh`: gh script settings. Format: INI-file format.
        -   `url`: download URL for GitHub CLI deb package
        -   `checksum`: SHA256 checksum for downloaded deb file

---

### git

This module configures Git.

**Configuration**

-   `tools/global.cfg`:
    -   `git`: Git configurations. Format: "cfg-location config.name value" (one per line).

---

### gpg

This provides configuration settings for the GPG encryption program.

**Configuration**

-   `tools/gpg-agent.conf`: your custom `gpg-agent.conf` file.

---

### mc

It allows you to configure [Midnight Commander](https://midnight-commander.org/){target=\_blank}, a robust file manager.

!!! warning "Midnight Commander is not installed by this module"

    Use the `packages/apt` module to install it!

**Configuration**

-   `tools/mc/global.d`: configuration files for Midnight Commander can be placed in this directory.

---

### nano

With this module you can install additional syntax highlighting files for Nano.

!!! tip

    You can use `shell/bash` module to install your custom `.nanorc` file to configure Nano.

**Configuration**

-   `tools/nano/global.d`: syntax highlighting files for Nano.

---

### nmap

This currently only installs a plugin ("network-control") for [Nmap](https://nmap.org/){target=\_blank}, a network mapper tool.

!!! warning "Nmap is not installed by this module"

    Use the `packages/snap` module to install it!

---

### pass-update

This module installs [pass-update](https://github.com/roddhjav/pass-update){target=\_blank} an extension for the [pass password manager](https://www.passwordstore.org/){target=\_blank}.

**Configuration**

-   `tools/global.cfg`:
    -   `pass-update`: pass-update script settings. Format: INI-file format.
        -   `version`: pass-update version to install (git tag to checkout)

---

### ssh

With this module you can configure SSH and add already known hosts.

**Configuration**

-   `tools/ssh/global.d`: SSH configuration files. Will be copied to `~/.ssh/` with directory structure preserved.
-   `tools/global.cfg`:
    -   `ssh-known`: entries to SSH known host file (`.ssh/known_hosts`). Format: as-is, will be appended to the file verbatim.

---

### tomb

This module installs the [Tomb file encryption utility](https://dyne.org/software/tomb/){target=\_blank}.

**Configuration**

-   `tools/global.cfg`:
    -   `tomb`: tomb script settings. Format: INI-file format.
        -   `url`: download URL for Tomb tarball
        -   `checksum`: SHA256 checksum for downloaded tar-archive