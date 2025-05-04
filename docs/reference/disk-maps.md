# Disk maps

Disk maps are a way to define the disk architecture (partitions, LUKS encryption, LVM physical & logical volumes).
This will determine how the system is laid out and how the data is stored.

They are similar to configuration files for Modules, but there's no global/local distinction as disk maps are always specific to a system.
They are found in `install/disk-maps` directory of a Profile.
Disk maps are simple text files. Blank lines and lines starting with `#` are ignored with INI-like sections.

Historically, disk maps were used to define the disks and partitions for the `zephyrctl partition` and `zephyrctl format` commands.
But now, a new command called `zephyrctl disk` will be used to manage disks and partitions. It will support Logical Volume Management (LVM) also and will be more flexible.
You will be able to define complex disk layouts like [LVM on LUKS](https://wiki.archlinux.org/title/Dm-crypt/Encrypting_an_entire_system#LVM_on_LUKS){target=\_blank} or other combinations of LVM, LUKS and classic partitions.
For examples, check the `/examples/profiles/default/install/disk-maps` directory.

!!! note

    Currently, the `zephyrctl disk` command is not fully implemented.

    For already available features, check the [Reference](../reference/zephyrctl.md#disk) or run `zephyrctl help disk`.

Now let's see the different sections of a disk map.

## partitions

In this section, you can describe the disks and partitions. On a single line, you can define either a disk or a partition.

**Syntax**

1. Define a disk
    - `DISK`: The keyword to define a disk
    - `disk_name`: Arbitrary name of the disk, used to refer to it in the rest of the disk map
    - `device`: The device file for the disk
1. Describe a partition
    - `disk_name`: Name of the disk that contains this partition (as defined in the `DISK` line)
    - `num`: Partition number. Use `1` for the first partition.
    - `gap`: Gap between the previous partition and this one. You can use `K` for kibibytes, `M` for mebibytes, `G` for gibibytes, etc.
    - `size`: Size of the partition. Use the same units as `gap`.
    - `type`: Type code of the partition. Possible types can be listed by `sgdisk --list-types`. A few aliases are provided for common types:
        - `luks`: Linux LUKS container (8309)
        - `efi`: EFI system partition (ef00)
        - `msr`: Microsoft reserved (0c01)
        - `win`: Microsoft basic data (0700)
        - `linux`: Linux filesystem (8300)
        - `swap`: Linux swap partition (8200)
    - `label`: Label for the partition

**Example**

```ini
[partitions]
# DISK disk_name device
DISK   main      /dev/sda
DISK   store     /dev/sdb

# disk_name num  gap  size type  label
main          1    0  128M efi   EFI
main          2    0  512M linux BOOT
main          3  32M   14G 8304  ROOT
main          4  32M    3G 8306  SRV
main          5  32M    1G swap  SWAP

store         1    0    2G win   MEDIA
store         2 512M    2G linux BACKUP
```

## Legacy sections

These sections are used by `zephyrctl partition` and `zephyrctl format` commands.

### Disks

The first section of a disk map is the `DISKS` section, which lists the disks that are present.
Each disk is listed on its own line, options are separated by whitespace.

**Options**

- `NAME`: A name for the disk, used to refer to it in the rest of the disk map.
- `DEVICE`: The device file for the disk, such as `/dev/sda` or `/dev/nvme0n1`.
- `PARTITION_PREFIX`: (Optional) A prefix to be used for the partition device files, such as `p` in `/dev/nvme0n1p1`.

**Example**

```ini
[DISKS]
# NAME  DEVICE          PARTITION_PREFIX
main    /dev/sda
ssd     /dev/nvme0n1    p
```

### Partitions

The next section(s) of a disk map is the `PARTITIONS`, which lists the partitions that are present on each disk.
Each partition is listed on its own line, options are separated by whitespace.
The section is named after the disk, such as `PARTITIONS_main` for the `main` disk (defined in the `DISKS` section), so you need a separate section for each disk.

**Options**

- `PARTNUM`: The partition number. Use `1` for the first partition.
- `GAP`: The gap between the previous partition and this one. You can use `K` for kibibytes, `M` for mebibytes, `G` gibibytes and so on.
- `SIZE`: The size of the partition, use the same units as `GAP`.
- `TYPE`: The type of the partition. Available types:
    - `luks1`/`luks2`: Linux LUKS container
    - `efi` EFI system partition (FAT32)
    - `msr` Microsoft reserved
    - `win` Microsoft basic data (NTFS)
    - `linux` Linux filesystem (ext4)
    - `swap` Linux swap partition
- `LABEL`: The label of the partition.

**Example**

```ini
[PARTITIONS_main]
# PARTNUM   GAP     SIZE    TYPE    LABEL
1           0       512M    efi     EFI
2           0       1G      luks1   BOOT
3           128M    18G     luks2   SYSTEM
4           128M    1G      swap    SWAP
```
