# zephyrctl

`zephyrctl` is a command-line interface (CLI) script that serves as the central control panel for Zephyr :eight_spoked_asterisk:.
This page outlines the available commands and their usages.

---

## burn

Craft a bootable USB stick by burning the provided disk-image (ISO file) onto a USB flash drive.
This can be the remixed ISO file or any other disk-image file.

!!! danger "All files on the drive will be lost!"

    There are some safe-guards in place, but still be careful when selecting the disk!

    Create backups if necessary.

**Usage**

```
zephyrctl burn ISO_FILE [DISK]

Params:
ISO_FILE           ISO file to burn (e.g. zephyr.iso)
DISK               Target USB flash drive device (e.g. /dev/sdc).
                   Interactive selection if not specified.
```

---

## customize

Execute a customization module for a specific profile.
Effectively update the system to match configurations in the customization profile.

**Usage**

```
zephyrctl customize PROFILE [MODULE]...

Params:
PROFILE            Customization profile to use
MODULE             Module to run (e.g. 'packages', 'bash').
                   If none given, all modules will be executed.
```

---

## format

Format partitions as per the provided profile and disk maps.

!!! danger "This will delete all files on selected partitions!"

    Don't forget to back up your data!

**Usage**

```
zephyrctl format PROFILE MAP...

Params:
PROFILE            Customization profile to use
MAP                Disk maps
```

---

## help

Obtain information on how to use `zephyrctl` commands.

**Usage**

```
zephyrctl help [COMMAND]

Params:
COMMAND            Name of the command to show help for.
                   If empty, all available commands will be listed.
```

---

## install

Install Zephyr :eight_spoked_asterisk: on your computer.

**Usage**

```
zephyrctl install
```

---

## partition

Partition a drive according to the provided profile and disk maps.

!!! danger "This will delete all files on selected partitions!"

    Please watch out for possible data-loss and back up your data beforehand!

**Usage**

```
zephyrctl partition PROFILE MAP...

Params:
PROFILE            Customization profile to use
MAP                Disk maps
```

---

## post-install

Perform various OS post-installation steps such as GRUB configuration and GPT backup.

**Usage**

```
zephyrctl post-install PROFILE MAP...

Params:
PROFILE            Customization profile to use
MAP                Disk maps
```

---

## remix

Remix an Ubuntu image file to embed Zephyr & customization profiles, and an optional payload.
This payload can be any files or scripts that you want to embed into the ISO file.

**Usage**

```
zephyrctl remix ISO_IN [ISO_OUT]

Params:
ISO_IN             ISO file to remix (e.g. path/to/ubuntu-20.04.6-desktop-amd64.iso)
ISO_OUT            Path to save the remixed ISO file.
                   Default is 'zephyr.iso' in the current directory.
```

---

## uninstall

Removes Zephyr from your computer.

**Usage**

```
zephyrctl uninstall
```
