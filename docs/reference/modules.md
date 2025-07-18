# Modules

This is the reference documentation for the [customization modules](../customize.md#modules) that are part of Zephyr :eight_spoked_asterisk:.
These modules allow you to customize your system according to your preferences and usage.
They are organized into different categories, such as `apps`, `services`, and more.

Modules can be configured by [Profiles](../profiles.md), which are a collection of config files and possibly some other files that are relevant to the module (e.g. `.tff` files for Fonts module).
Module-specific files are located in the directory named after the module, e.g. `gnome/fonts` for Fonts.
Other module settings can be found in the category's config file, e.g. `gnome/global.cfg`.
This file contains headers (`[some-header]`). The settings and the syntax (format) is varied in each section, though empty lines and lines starting with `#` are always ignored.

All global configuration directory and file have a local counterpart.
If there is `global` in the name of a directory (or file) it can be replaced with `local` to get the counterpart.
For example, `gnome/fonts/global.d` :arrow_right: `gnome/fonts/local.d` and `gnome/global.cfg` :arrow_right: `gnome/local.cfg`.

Local files don't replace global files, they complement global configuration files as local ones contain extra settings.
If you want to override a global setting, you need to add a global file with the same name to the profile (e.g `default/other/global.cfg` and `tester/other/global.cfg`).
There's one exception to this rule: if a setting is a simple key-value pair (e.g. `url` in `tools/composer` module), then the local setting will override the global one.

Only the `global` files will be listed in the documentation for brevity.

!!! note

    For examples check the profiles in `example/profiles` directory.
    A default profile and a named profile is provided with different types of configuration overrides mentioned above.

---

## Application modules

These modules allow you to modify applications according to your usage and preferences.

### jmeter

Installation of [Apache JMeter](https://jmeter.apache.org/){target=\_blank}, a load-testing testing tool.

**Configuration**

- `apps/global.cfg`:
    - `jmeter`: jmeter script settings. Format: INI-file format.
        - `url`: download URL
        - `checksum`: SHA512 checksum
        - `install_dir`: installation directory

---

### pulse-effects

Install [PulseEffects](https://github.com/wwmm/easyeffects){target=\_blank} and manage output audio presets.

**Configuration**

- `apps/pulse-effects/global.d`: output presets.

---

### vbox

The module is for installation and the configuration of [VirtualBox virtualization software](https://www.virtualbox.org/){target=\_blank}.

!!! tip

    Only the base `virtualbox` package is installed by this module.
    You might want to install `virtualbox-qt` (the GUI) and `virtualbox-guest-additions-iso` (for extra functions like shared folders and clipboard between host and guest).
    Use the `packages/apt` module for that.

**Configuration**

- `apps/global.cfg`:
    - `virtualbox`:
        - `repo`: Oracle VirtualBox APT repository
        - `gpg_key_url`: URL to the GPG key file for the repo
        - `gpg_key_fingerprint`: Expected GPG key fingerprint
        - `version`: VirtualBox version to install
    - `virtualbox-vboxmanage`: Virtualbox settings to apply. Format: "config_name value" (one setting per line).
    - `virtualbox-settings`: parameters for vbox script. Currently only `VM_LOCAL_DIR` (directory for virtual machines) is supported.
    - `virtualbox-virtmachines`: virtual machines definitions. Format: "virtmachines+=(vm_dir@UUID)".
- `apps/vbox/vm.global.d`: virtual machines definitions. You need to create a sub-directory for each VM and put `.vbox` files in it.

---

## GNOME modules

These modules allow you to customize and manage different aspects of your [GNOME desktop environment](https://www.gnome.org/){target=\_blank}.

### autostart

With the autostart module you can control which applications should start automatically when you log into your GNOME desktop.

**Configuration**

- `gnome/autostart/global.d`: `.desktop` files for each application you wish to autostart.

---

### dash-to-panel

This module installs the GNOME shell extension [Dash to Panel](https://extensions.gnome.org/extension/1160/dash-to-panel/){target=\_blank} and allows you to customize it.

**Configuration**

- `gnome/dash-to-panel/global.d`: `.dconf` configuration files for Dash to Panel.
- `gnome/global.cfg`:
    - `dash-to-panel`: dash-to-panel script settings. Format: INI-file format.
        - `version`: Dash to Panel extension version to install (git tag to checkout)

---

### fonts

It installs additional fonts.

**Configuration**

- `gnome/fonts/global.d`: `.tff` files for different fonts. Create a sub-directory for each font family and put the `.tff` files in it.

---

### gnome-config

This module provides global configuration options for the GNOME desktop environment.

**Configuration**

- `gnome/config/global.d`: you can place your GNOME desktop-wide customization files in this directory (`.dconf` files).

---

### user-dirs

This module is responsible for customizing user directories.

**Configuration**

- `gnome/user-dirs.defaults`: this will be your custom `/etc/xdg/user-dirs.defaults` file.
- `gnome/user-dirs.dirs`: your custom `~/.config/user-dirs.dirs` file.
- `gnome/global.cfg`:
    - `bookmarks`: Nautilus bookmarks. Format: "file:///path/to/bookmarked/dir" (one per line).

---

### wallpaper

With this module you can set the desktop background.

**Configuration**

- `gnome/wallpaper.jpg`: your wallpaper image.

---

## Install modules

These modules play a role in the [post-installation](../ubuntu.md#post-installation) process.
They can't be executed independently, all of them will run with `zephyrctl post-install` command.

!!! note

    Typically they are used after a fresh installation of the system in the post-installation phase (in this case use the `install` environment).
    But they can be executed anytime to reconfigure a live system (`live` environment), as it is non-destructive.

### backup-gpt

This backups the GUID Partition Table (GPT) after the disk has been partitioned.
In case of an emergency, the partition table can be restored from this backup.
It uses Disk maps to determine the disk(s) to backup.

**Configuration**

- `install/global.cfg`:
    - `backup-gpt`: backup-gpt script settings. Format: INI-file format.
        - `backup_dir`: directory for GPT partition table backups

---

### grub-config

This module assists in configuring the GRUB bootloader.

**Configuration**

- `install/grub/default`: custom GRUB default config file (`/etc/default/grub`).
- `install/grub/global.d/`: configuration files for `grub-mkconfig` (these are shell scripts).

---

### luks-automount

With this module you can set up automatic mounting of LUKS encrypted partitions.
It creates an additional key to the LUKS partition (machine key) and adds an entry to `/etc/crypttab` to automatically unlock and mount the partition on boot.
It needs Disk maps to find LUKS partitions.

You can configure `initramfs` also.

**Configuration**

- `install/initramfs/global.d/`: `initramfs-tools` configuration files (`.conf`).
- `install/global.cfg`:
    - `luks`: luks-automount script settings. Format: INI-file format.
        - `key_dir`: directory for LUKS machine keys
        - `key_slot`: key slot number for LUKS machine keys

---

### random

Assortment of random, non-categorized post-installation tasks.

**Tasks**

- select Windowing System to use (e.g. X11 or Wayland)

**Configuration**

- `install/global.cfg`:
    - `random`: random script settings. Format: INI-file format.
        - `window_system`: Window System for GNOME, default is `wayland`

---

## Other modules

Random, non-categorized modules.

### cron

With this module you can setup weekly and daily cron jobs.

**Configuration**

- `other/global.cfg`:
    - `cron-hourly`: hourly cron jobs. Format: "script_path job_name" (one per line).
    - `cron-daily`: daily cron jobs. Format: "script_path job_name" (one per line).
    - `cron-weekly`: weekly cron jobs. Format: "script_path job_name" (one per line).
    - `cron-monthly`: monthly cron jobs. Format: "script_path job_name" (one per line).

---

### local

This module executes your local, custom modules (that are not part of Zephyr).

A module is basically an executable file, so you can write your own module in any language you like.
If you choose to write your module in Bash, you can use the functions from Zephyr, just source the bootstrap file (`${PROJECT_ROOT}/bin/bootstrap.sh`) to make them available.
It's also possible to define new configuration sections in `other/global.cfg` and use them in your module.
During execution the current working directory will be the script's directory, so you can use relative paths to access files should your module need extra files.

For details check the example module in `example/profiles/default/other/local/global.d/` and study the core Zephyr modules in `bin/customize`.

**Configuration**

- `other/local/global.d`: any executable file in this directory will be run.

---

## Package modules

With the help of the following modules you can install packages using various package managers.

### apt

The apt module assists with the management of packages using the Debian package manager (APT).

!!! note "It also upgrades all installed packages!"

**Configuration**

- `packages/global.cfg`:
    - `apt-install`: APT packages to install. Format: "package_name apt_repository" (one per line, apt_repository optional).
    - `apt-remove`: APT packages to remove. Format: "package_name" (one per line).

---

### bin

Shell binaries (or scripts, PHAR files, basically any executable file) to download and install to `/usr/local/bin/`.

!!! note

    This module needs the `bin_global` configuration to be defined in `shell/scripts` module to work.

**Configuration**

- `packages/global.cfg`:
    - `bin`: shell binaries to install. Format: "Name URL SHA256SUM" (one per line, SHA256SUM optional).

---

### node

With the node module you can install Node.js packages.

**Configuration**

- `packages/global.cfg`:
    - `managers`: package manager settings. Format: INI-file format.
        - `node_version`: major version of Node to install e.g. `18`, `20`.
    - `node`: Node modules to install. Format: "package_name" (one per line).

---

### pip

This module is used to manage Python packages installed via pip.

**Configuration**

- `packages/pip.global`: pip requirements file.

---

### snap

The snap module assists with installing Snap packages.

!!! note "It upgrades installed snaps and purges old revisions."

**Configuration**

- `packages/global.cfg`:
    - `snap`: snaps to install. Format: "snap_name install_options" (one per line).
      "install_options" is an optional comma-separated list of options to pass to `snap install` without the hyphens (`--`) e.g. `classic,channel=18/stable`.

---

## Service modules

These modules allow you to configure various services such as database servers, web servers.

### apache

The module is for installation and the configuration of the [Apache web server](https://httpd.apache.org/){target=\_blank}.

!!! note

    You need to run `system/certificate` module beforehand to generate self-signed SSL certificates, which will be used by Apache.

**Configuration**

- `services/apache/config.global.d`: use this directory to place Apache's configuration files (`.conf`).
- `services/apache/vhost-default.conf`: default virtual host file. You can use templated variables like `{{ DOC_ROOT }}` in this file.
  It will be replaced with the actual value configured in `services/global.cfg`. The following variables are available:
    - `DOC_ROOT`: web root for virtual hosts
    - `DEF_VIRT_HOST_NAME`: name for default vhost
    - `ROOT_CA_NAME`: root CA name (configured in `system/certificate` module)
- `services/global.cfg`:
    - `apache`: apache script settings. Format: INI-file format.
        - `web_root`: web root for virtual hosts
        - `def_virt_host_name`: name for default vhost (which will also be used for certificate and key filenames)
        - `def_virt_host_subject`: default virtual host certificate subject
        - `def_virt_host_cert_key`: (optional) default virtual host certificate private key configuration in format "algorithm,option1,option2,...". If not specified, defaults to 4096 bit RSA
    - `apache-module`: list of Apache modules to enable. Format: "module_name" (one per line).
    - `apache-conf`: list of Apache configuration files to enable. Format: "conf_name" (one per line).

---

### mariadb

This will install & customize [MariaDB database server](https://mariadb.org/){target=\_blank}, including creating an admin user with full privileges.

**Configuration**

- `services/mariadb/global.d`: directory for MariaDB's configuration files (`.cnf`).
- `services/global.cfg`:
    - `mariadb`: mariadb script settings. Format: INI-file format.
        - `repo`: MariaDB APT repository URL
        - `admin_name`: username for MySQL admin user
        - `admin_pass`: password for MySQL admin user

---

### php

This module will install and configure [PHP](https://www.php.net/){target=\_blank} and start the PHP-FPM service with Apache.

!!! note

    It expects Apache to be installed. Use the `services/apache` module to install it!

**Configuration**

- `services/php/global.d`: directory for PHP's `.ini` configuration files.
- `services/global.cfg`:
    - `php`: php script settings. Format: INI-file format.
        - `version`: comma-separated list of PHP versions to install
        - `cli_version`: Single PHP version to be used by PHP CLI

---

### phpmyadmin

Use this module to install and configure [phpMyAdmin](https://www.phpmyadmin.net/){target=\_blank}. It also creates phpMyAdmin control database & user.

!!! note

    phpMyAdmin needs a LAMP stack to work, so you need to install Apache, MariaDB and PHP first (see the `services/apache`, `services/mariadb` and `services/php` modules).

**Configuration**

- `services/phpmyadmin/config.inc.php`: phpMyAdmin configuration file.
- `services/global.cfg`:
    - `phpmyadmin`: php script settings. Format: INI-file format.
        - `url`: download URL for phpMyAdmin tarball
        - `checksum`: SHA256 checksum for download tar-archive
        - `service_user`: phpMyAdmin control user name
        - `service_pass`: phpMyAdmin control user password

---

## Shell modules

Modules to customize Bash and install your custom shell scripts.

### bash

This module is called `bash` but it could have been called `home-dir` too, as it setup your whole home directory not just Bash (through `.bashrc`).
Typically you would put your custom `.bashrc` here, but you can put any file here and it will be copied to your home directory: like `.profile`, `.inputrc` etc.
In this module there is a difference between `global` and `local` files.
Global files are installed globally for all users, and local files are installed only for the current user.

**Configuration**

- `shell/bash/global.d`: all files here will be copied to your HOME directory, `/root`, `/etc/skel` so it will be default for new users and root too.
  The directory structure will be preserved, so you can implement your custom directory structure.
- `shell/bash/local.d`: files in this directory will be copied only to your HOME directory so it's local for the current user only with directory structure preserved.
- `shell/bash/root.d`: these files will be copied to `/root` to customize root's Bash only (directory structure preserved).

---

### scripts

This module installs your custom shell scripts to directories that are in your `PATH` (configurable).
In this module there is a difference between `global` and `local` files.
Global files are installed to `/usr/local/bin` (by default) - so it's global for all users - and local files are installed to `~/.local/bin` (by default) - so it's local for the current user only.

**Configuration**

- `shell/bin/global.d`: contains system-wide shell scripts.
- `shell/bin/local.d`: contains shell scripts for the current user.
- `shell/lib/global.d`: contains system-wide shell libraries.
- `shell/lib/local.d`: contains shell libraries for the current user.
- `shell/global.cfg`:
    - `scripts`: scripts script settings. Format: INI-file format.
        - `bin_global`: directory for global shell scripts
        - `bin_local`: directory for local shell scripts
        - `lib_global`: directory for global shell library
        - `lib_local`: directory for local shell library

---

## System modules

The modules under this category are mainly used for customizing system-wide settings and Linux subsystems.

### certificates

This module handles the generation and installation of a Machine Owner Key (MOK) and self-signed SSL certificates.
This certificate is a root Certificate Authority (CA) for the system and can be used to sign other certificates.
The CA certificate is installed in the system and Firefox trusted certificate store, so all certificates signed by this CA will be trusted by the system and Firefox.
Certificates signed by this CA are used by the `services/apache` and the `services/phpmyadmin` module.

**Configuration**

- `system/firefox-policies.json`: Firefox policy file.
- `system/global.cfg`:
    - `certificate`: certificates script settings. Format: INI-file format.
        - `root_ca_key`: key configuration for the root CA in format "algorithm,option1,option2,...". If not specified, defaults to 4096 bit RSA.
        - `root_ca_name`: self-signed Root Certificate Authority (CA) name
        - `root_ca_subject`: root CA subject
        - `mok_key_name`: Machine Owner Key (MOK) name
        - `mok_key_subject`: MOK subject

---

### dirs

Create directories and set permissions for them.

**Configuration**

- `system/global.cfg`:
    - `dirs-create`: directories to create, you can use variables like `$USER` as owner. Format: "path owner" (one per line, owner optional).
    - `dirs-remove`: directories to delete. Format: "path" (one per line).
    - `perms`: permission settings. Format: INI-file format.
        - `perm_home`: permission to set on $HOME (non-recursive). Use format allowed by `chmod` command.

---

### locale

Configures system locale.

**Configuration**

- `system/global.cfg`:
    - `locales`: locales to install. Format: "locale_name" (one per line).
    - `locale`: set locale. You can use different locale in each locale categories. Format: "category name" (one per line).

---

### netplan

This module is responsible for network plan creation and management (netplan).
Also disables connectivity checking.

**Configuration**

- `system/netplan/global.d`: place for your network plans (`.yaml` files).

---

### resolved

Configure the systemd DNS resolver `systemd-resolved` service.

**Configuration**

- `system/resolved/global.d`: `systemd` service configuration files (`.conf`).

---

### shorewall

This is used to install & configure the [Shorewall firewall](https://shorewall.org/){target=\_blank}.

!!! note

    You can use the `{{ interface }}` string as template in the `interfaces` file and the module will replace it with the actual interface name.

**Configuration**

- `system/shorewall/global.d`: contains files for zones, policy, interfaces and rules.
  All files here will be copied to `/etc/shorewall/` with directory structure preserved.

---

### sudo

Configure `sudo`.

!!! warning

    Configuration files will be verified by `sudo` before they are installed, so syntax errors will be caught.

    However, be careful with this module, as it can lock you out of `sudo` if you make a mistake in the configuration files!

**Configuration**

- `system/sudo/global.d`: custom `sudoers` configuration files. These files will be copied to `/etc/sudoers.d/`.

---

### sysctl

You can tweak Linux kernel parameters with this module via `sysctl` configuration files. These changes are permanent, they will survive reboots.

**Configuration**

- `system/sysctl/global.d`: place your `sysctl` configuration files here (`.conf`).
  All files in this directory will be installed to `/etc/sysctl.d/`.

---

### systemd

This module can install new `systemd` units (services, timers, etc.) and can override existing units (e.g. `fstrim.service`).

!!! note

    This module needs the `lib_global` configuration to be defined in `shell/scripts` module to work.

**Configuration**

- `system/systemd/files.global.d`: additional files (script, resources) that are needed for units, like an executable for a service. These files will be copied to `lib_global` dir as configured in `shell/scripts` module.
- `system/systemd/override.global.d`: place `.conf` files for each unit you want to override in a subdirectory named as the unit (e.g. "fstrim.service").
- `system/systemd/install.global.d`: put your new custom unit files here. These will be copied to `/usr/local/lib/systemd/system`. You can use `{{ GLOBAL_LIB }}` template string in unit files, it will be replaced with the actual directory. This can be useful in a `ExecStart` directive.

---

### users

Create users (normal and system users too) and optionally add them to groups.

**Configuration**

- `system/global.cfg`:
    - `users`: users to add to the system. Format: "user_name type groups" (one per line), "type" can be `normal` or `system` if omitted defaults to `normal`, "groups" is an optional comma-separated list of groups to add the user to. Groups will be created if not exist.
      For normal users login will be disabled (so the module can run unattented), to enable the account you will be need to manually set a password later with `passwd`.

        !!! tip "You can use environment variables (like `$USER`) as user name!"

---

## Tool modules

The Tool modules provide configurations for various tools.

### composer

This module provides configuration settings for the [Composer dependency manager](https://getcomposer.org/){target=\_blank} for PHP and installs it globally.
Bash completion is also installed.

**Configuration**

- `tools/global.cfg`:
    - `composer`: composer script settings. Format: INI-file format.
        - `url`: download URL for composer PHAR file
        - `checksum`: SHA256 checksum for downloaded PHAR file

---

### dig

Install and configure `dig` DNS lookup utility.

**Configuration**

- `tools/digrc`: your custom `.digrc` file.

---

### gh

This installs the [GitHub CLI](https://cli.github.com/){target=\_blank} tool with Bash completion.

**Configuration**

- `tools/global.cfg`:
    - `gh`: gh script settings. Format: INI-file format.
        - `url`: download URL for GitHub CLI deb package
        - `checksum`: SHA256 checksum for downloaded deb file

---

### git

This module configures Git.

**Configuration**

- `tools/global.cfg`:
    - `git`: Git configurations. Format: "cfg-location config.name value" (one per line).

---

### gpg

This provides configuration settings for the GPG encryption program.

**Configuration**

- `tools/gpg-agent.conf`: your custom `gpg-agent.conf` file.

---

### mc

It allows you to install and configure [Midnight Commander](https://midnight-commander.org/){target=\_blank}, a robust file manager.

**Configuration**

- `tools/mc/global.d`: configuration files for Midnight Commander can be placed in this directory.

---

### nano

With this module you can install additional syntax highlighting files for Nano.

!!! tip

    You can use `shell/bash` module to install your custom `.nanorc` file to configure Nano.

**Configuration**

- `tools/nano/global.d`: syntax highlighting files for Nano.

---

### nmap

This installs [Nmap](https://nmap.org/){target=\_blank} (network mapper tool), and - currently - only one plugin: "network-control".

---

### pass-update

This module installs [pass-update](https://github.com/roddhjav/pass-update){target=\_blank} an extension for the [pass password manager](https://www.passwordstore.org/){target=\_blank}.

**Configuration**

- `tools/global.cfg`:
    - `pass-update`: pass-update script settings. Format: INI-file format.
        - `version`: pass-update version to install (git tag to checkout)

---

### ssh

With this module you can configure SSH and add already known hosts.

**Configuration**

- `tools/ssh/global.d`: SSH configuration files. Will be copied to `~/.ssh/` with directory structure preserved.
- `tools/global.cfg`:
    - `ssh-known`: entries to SSH known host file (`.ssh/known_hosts`). Format: as-is, will be appended to the file verbatim.

---

### tomb

This module installs the [Tomb file encryption utility](https://dyne.org/software/tomb/){target=\_blank}.

**Configuration**

- `tools/global.cfg`:
    - `tomb`: tomb script settings. Format: INI-file format.
        - `url`: download URL for Tomb tarball
        - `checksum`: SHA256 checksum for downloaded tar-archive
