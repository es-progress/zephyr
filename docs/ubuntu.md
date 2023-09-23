# Installing Ubuntu

## Overview

Most of the time you'll customize a non-freshly installed OS.
Probably you don't want to reinstall Ubuntu just because an environment variable is changed or a new Git alias is added to your configuration...
In this case you can skip this part and see _Customization_.

But there are some tasks (like partitioning disks) that are best to do before a full reinstall.
Also sometimes you might like to start fresh or you've got a new device and want to install and setup Ubuntu.
If that's true this section could be interesting as Zephyr :eight_spoked_asterisk: can help in that too!

This process consists of :three: distinctive phases: _Pre-install_, _Install_ and _Post-install_.
It's mostly the standard (stock) Ubuntu installation (install phase) with some steps before/after that (pre-install, post-install).

In pre/post-install _Disk-maps_ play a crucial role.
They are just normal configuration files in your profiles and as the name suggest in these files you can describe your disks, partitions and file-systems and let Zephyr know about them.

!!! danger "Backup"

    First and foremost **backup** all your data!

    This is a destructive process **it will delete all files!**

## Pre-install

After you've backed up any important files (Are you sure:question: Take a moment to reconsider, don't be sorry later!) you can boot from the remixed USB-stick (that have `zephyr.iso` burned).

If you don't want to partition any disk or let the Ubuntu installer to format partitions you can skip phase.

At the end of this phase the actual install is not yet started, however the disks & partitions are partitioned & formatted, so **all files will be deleted**.

**Pre-install steps**

1. Boot from live USB (Zephyr)
1. :computer_mouse: **Try Ubuntu**
1. Open Terminal
1. (Optional) This is a good time to securely wipe disks or perform memory cell clearing (only for SSD). This is a manual process.
1. (Optional) Partition disk(s). If you don't want to change existing partitions this can be skipped.
    ```
    zephyrctl partition <PROFILE> <DISK_MAP>...
    ```
1. Format partitions
    ```
    zephyrctl format <PROFILE> <DISK_MAP>...
    ```

!!! success "You now have clean & empty disks, ready for a fresh install. :white_flag:"

## Install

This is the standard Ubuntu install process.

**Steps**

1. :computer_mouse: **Install Ubuntu**
1. Complete forms, settings in GUI
1. After installation ready, :computer_mouse: **Continue Testing**
1. **DO NOT REBOOT!** :warning:

!!! success "Stock Ubuntu is installed. In the next step we setup Zephyr and prepare for first boot! Yay!"

## Post-install

Ubuntu is already installed, but we need to perform the post-install steps too.
Then we will reboot the system and see the first boot (hopefully without any problems! :crossed_fingers:)

**Post-install steps**

1.  Run post-install

    ```
    zephyrctl post-install <PROFILE> <DISK_MAP>...
    ```

1.  :red_circle: Reboot system

!!! success "You're done! You've successfully booted into your brand new system!"

    Now, just one step (actually the most important :smile:) remains: customizing Ubuntu.