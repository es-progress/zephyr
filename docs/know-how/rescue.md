# System rescue

System Rescue means recovering a system after it has become un-bootable or unstable due to some sort of software complication (e.g. you've locked out yourself from `sudo`... :wink:) or hardware failure.
Mostly you want to access the system to recover data or to fix the problem.
These two goals need different approaches.

In case of a hardware failure, you can remove the drive (provided not your hard-drive is the faulty one :smile:) and connect it to another computer to recover data.
If you just need to fix a software issue, you can boot from a live USB and repair the system from there.

Now let's see how to do these.

## Recover data

1. Remove hard-drive and insert to another machine :hammer_and_wrench:
1. Boot system
1. (If encrypted) Open LUKS encryption

    ```
    cryptsetup open DEVICE LUKS_DEVICE_NAME

    where:
    DEVICE              Hard-drive device file (e.g. /dev/sdb)
    LUKS_DEVICE_NAME    Name of the LUKS device (e.g. LUKS_sdb)
    ```

1. Mount drive

    ```
    mount DRIVE MOUNT_POINT

    where:
    DRIVE               Hard-drive device file (e.g. /dev/sdb or /dev/mapper/LUKS_sdb)
    MOUNT_POINT         Mount point (e.g. /mnt/backup)
    ```

1. Copy files

    ```
    cp -av MOUNT_POINT/* DESTINATION

    where:
    MOUNT_POINT         Mount point (e.g. /mnt/backup)
    DESTINATION         Destination directory (e.g. /home/user/backup)
    ```

!!! success "Data recovered! :relieved:"

## Access system

This method works if the machine is still bootable without faulty hardware.
Basically you boot from a live USB and chroot to the installed system.

1. Boot from live USB
1. Mount root partition. You can mount anywhere, but I'll use `/target` in this example.

    1. (If encrypted) Open LUKS encryption

        ```
        cryptsetup open DEVICE LUKS_DEVICE_NAME

        where:
        DEVICE              Hard-drive device file (e.g. /dev/sdb)
        LUKS_DEVICE_NAME    Name of the LUKS device (e.g. LUKS_sdb)
        ```

    1. Create mount point
        ```
        mkdir /target
        ```
    1. Mount drive

        ```
        mount DRIVE /target

        where:
        DRIVE               Hard-drive device file (e.g. /dev/sdb or /dev/mapper/LUKS_sdb)
        ```

1. Mount device filesystems, so your installed system can access them
    ```
    ROOT=/target
    for n in proc sys dev etc/resolv.conf; do mount --rbind /$n "$root/$n"; done
    ```
1. Enter the installed system
    ```
    chroot /target
    ```
1. (Optional) Mount other partitions from `/etc/fstab`
    ```
    mount -a
    ```

!!! success "System accessed!"

    Now you can do what is needed to fix the issue, the system will behave as if you booted from the installed system.

    In addition you're `root`! :muscle:
