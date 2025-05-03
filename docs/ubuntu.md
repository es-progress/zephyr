# Installing Ubuntu

## Overview

Most of the time you'll customize a non-freshly installed OS.
Chances are, you don't want to reinstall Ubuntu just because you've changed an environment variable or added a new Git alias to your configuration...
In this case you can skip this part and see [Customization](customize.md).

However, there are some tasks (like partitioning disks) that are best to do before a full reinstall.
Also sometimes you might like to start fresh or you've got a new device and want to install and setup Ubuntu.
If that's true, you may find this section helpful as Zephyr :eight_spoked_asterisk: can assist with that too!

This process consists of :three: distinctive phases: _Pre-installation_, _Installation_ and _Post-installation_.
It's mostly the standard (stock) Ubuntu installation (install phase) with some steps before/after that (pre-install, post-install).

In pre/post-installation [Disk maps](reference/disk-maps.md) play a crucial role.
They are just normal configuration files in your profiles and as the name suggest in these files you can describe your disks, partitions and file-systems and let Zephyr know about them.

!!! danger Backup

    First and foremost, **back up** all your data!

    This is a destructive process **it will delete all files!**

## Pre-installation

After you've backed up all your important files (Are you sure:question: Take a moment to reconsider, don't be sorry later!) you can boot from the remixed USB-stick (that have `zephyr.iso` burned).

If you don't want to partition any disk or let the Ubuntu installer to format partitions you can skip phase.

At the end of this phase the actual install is not yet started, however the disks and partitions are partitioned & formatted, so **all files will be deleted**.

**Pre-installation steps**

1. :red_circle: Boot from live USB (Zephyr)
1. :computer_mouse: **Try Ubuntu**
1. Open Terminal
1. (Optional) This is a good time to [securely wipe disks](know-how/erase-disk.md#securely-wipe-disk) or perform [memory cell clearing](know-how/erase-disk.md#memory-cell-clearing-only-for-ssds) (only for SSD). This is a manual process.
1. (Optional) Partition disk(s). If you don't want to change existing partitions this can be skipped.

    ```
    zephyrctl partition PROFILE DISK_MAP...

    where:
    PROFILE            Selected customization profile
    DISK_MAP           Disk-map to use
    ```

    or the new `disk partition` command (this uses the new Disk map format):

    ```
    zephyrctl disk partition PROFILE DISK_MAP...

    where:
    PROFILE            Selected customization profile
    DISK_MAP           Disk-map to use
    ```

1. (Optional) Format partitions

    ```
    zephyrctl format PROFILE DISK_MAP...

    where:
    PROFILE            Selected customization profile
    DISK_MAP           Disk-map to use
    ```

!!! success "You now have clean & empty disks, ready for a fresh install. :white_flag:"

## Installation

This is the standard Ubuntu install process.

**Installation steps**

1. :computer_mouse: **Install Ubuntu**
1. Complete forms, settings in GUI
1. After installation ready, :computer_mouse: **Continue Testing**
1. **DO NOT REBOOT!** :warning:

!!! success "Stock Ubuntu is installed. In the next step we setup Zephyr and prepare for first boot! Yay!"

## Post-installation

Ubuntu is already installed, but we need to perform the post-installation steps too.
Then we will reboot the system and see the first boot (hopefully without any problems! :crossed_fingers:)

**Post-installation steps**

1.  Mount root filesystem to `/target` if unmounted

    ```bash
    # Check still mounted
    findmnt /target

    # No lines returned --> not mounted --> mount
    sudo mount ROOT_FS_DEVICE /target
    ```

1.  Run post-install

    ```
    zephyrctl post-install install PROFILE DISK_MAP...

    where:
    PROFILE            Selected customization profile
    DISK_MAP           Disk-map to use
    ```

1.  :red_circle: Reboot system

!!! success "You're done! You've successfully booted into your brand new system!"

    Now, just one step (actually the most important :smile:) remains: [customizing Ubuntu](customize.md).
