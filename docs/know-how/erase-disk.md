# Erase disk

This is how to erase a disk securely.

!!! note

    This guide is based on the ArchLinux Wiki page for [Memory cell clearing](https://wiki.archlinux.org/title/Solid_state_drive/Memory_cell_clearing){target=\_blank} and [Securely wipe disk](https://wiki.archlinux.org/title/Securely_wipe_disk){target=\_blank}.

    This is a summarized abstract, that contains all essential steps to securely erasing your disks. For more detailed instructions and explanations, please refer to the Wiki.

There are cases when you might want to securely wipe a disk.
For example the device changes hands and you want to ensure that your sensitive files can not be recovered.
Or you want to restore an SSD drive (Solid State Drive) to its factory default write performance by Memory Cell Clearing.

The disk you want to delete must **NOT** be mounted! If you can't unmount it (e.g. it's mounted at `/`), you can boot from an [Ubuntu USB stick](create-boot-usb.md) (live image).

!!! warning "Data loss alert"

    This warning is a bit silly, as the point of this operation is to wipe the disk and get rid all of the files.
    But this will actually erase all your data on the disk, so please think twice before you start:

    Have I backed up everything?

## Memory cell clearing (Only for SSDs)

Flash-based solid state disks have a very different internal architecture so proper wiping needs Memory cell clearing: reset the SSD to the initial "clean" state it was manufactured with.
This has the additional benefit, that the original write performance might be achieved again. :sunglasses:

!!! danger

    Do **NOT** proceed with this if the target drive is not connected directly to a SATA/NVMe interface!

    Issuing the Secure Erase/Format/Sanitize command on a drive connected via USB or a SAS/RAID card could potentially brick the drive!

**Steps** for SATA SSD drives:

1. Check if drive security is frozen

    ```
    hdparm -I DEVICE

    where:
    DEVICE              SSD drive device file (e.g. /dev/sdb)
    ```

1. If frozen :arrow_right: suspend & wake-up computer
1. Enable security by setting a user password

    ```
    hdparm --user-master u --security-set-pass PASS DEVICE

    where:
    PASS                Master password
    DEVICE              SSD drive device file (e.g. /dev/sdb)
    ```

1. Issue the ATA Secure Erase command

    ```
    hdparm --user-master u --security-erase PASS DEVICE

    where:
    PASS                Master password
    DEVICE              SSD drive device file (e.g. /dev/sdb)
    ```

!!! success "SATA SSD memory cells reset!"

**Steps** for NVMe SSD drives:

1. Get `nvme-cli` utility
    ```
    apt install nvme-cli
    ```
1. Verify what is supported by the drive

    ```
    nvme id-ctrl DEVICE -H | grep "Format \|Crypto Erase\|Sanitize"

    where:
    DEVICE              SSD drive device file (e.g. /dev/nvme0)
    ```

1. Format device

    ```
    nvme format DEVICE -ses 1 -n 1

    where:
    DEVICE              SSD drive device file (e.g. /dev/nvme0)
    ```

!!! success "NVMe SSD memory cells reset!"

## Securely wipe disk

1.  List drives & partitions to select disk to delete
    ```
    lsblk
    ```
1.  Info about a drive

    ```
    fdisk -l DEVICE

    where:
    DEVICE              Disk device file (e.g. /dev/sdb)
    ```

1.  Fill drive with random data

    ```
    dd status=progress bs=1M if=/dev/urandom of=DEVICE

    where:
    DEVICE              Disk device file (e.g. /dev/sdb)
    ```

    !!! warning "It is a slow process!"

        Running times are for reference only, actual time might differ:

        - NVMe SSD, HDD: **30-40 MB/sec**, so for a 1TB drive it takes ~8 hours
        - SATA SSD: 140 MB/sec, that means 84 minutes for a 120GB drive

!!! success "Finish! Drive is securely erased."
