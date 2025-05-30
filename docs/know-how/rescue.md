# System rescue

System Rescue means recovering a system after it has become unbootable or unstable due to some sort of software complication (e.g. you've locked out yourself from `sudo`... :wink:) or hardware failure.
Mostly you want to access the system to recover data or to fix the problem.
These two goals need different approaches.

In case of a hardware failure, you can remove the drive (provided not your hard-drive is the faulty one :smile:) and connect it to another computer to recover data.
If you just need to resolve a software issue, you can boot from a live USB and repair the system from there.

Now let's see how to do these.

## Recover data

1. Remove hard-drive and insert to another machine :hammer_and_wrench:
1. :red_circle: Boot system
1. (If encrypted) Open LUKS container

    ```
    cryptsetup open DEVICE LUKS_CONTAINER

    where:
    DEVICE              Hard-drive device file (e.g. /dev/sdb)
    LUKS_CONTAINER      Name of the LUKS device (e.g. CRYPT_sdb)
    ```

1. Mount drive

    ```
    mount DRIVE MOUNT_POINT

    where:
    DRIVE               Hard-drive device file (e.g. /dev/sdb or /dev/mapper/CRYPT_sdb)
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

1. :red_circle: Boot from live USB
1. Mount root partition. You can mount anywhere, but I'll use `/target` in this example.

    1. (If encrypted) Open LUKS container

        ```
        cryptsetup open DEVICE LUKS_CONTAINER

        where:
        DEVICE              Hard-drive device file (e.g. /dev/sdb)
        LUKS_CONTAINER      Name of the LUKS device (e.g. CRYPT_sdb)
        ```

    1. Create mount point
        ```bash
        mkdir /target
        ```
    1. Mount drive

        ```
        mount DRIVE /target

        where:
        DRIVE               Hard-drive device file (e.g. /dev/sdb or /dev/mapper/CRYPT_sdb)
        ```

1. Mount device filesystems, so your installed system can access them
    ```bash
    ROOT=/target
    for n in proc sys dev etc/resolv.conf; do mount --rbind --make-rslave /$n "$ROOT/$n"; done
    ```
1. Access the installed system
    ```bash
    chroot /target
    ```
1. (Optional) Mount other partitions from `/etc/fstab`
    ```bash
    mount -a
    ```

!!! success "System accessed!"

    Now you can do what is needed to fix the issue, the system will behave as if you booted from the installed system.

    In addition you're `root`! :muscle:
