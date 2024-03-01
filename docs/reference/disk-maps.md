# Disk maps

Disk maps are a way to define how the disks are partitioned and formatted.
This will determine how the system is laid out and how the data is stored.

They are similar to configuration files for Modules, but there's no global/local distinction as disk maps are always specific to a system.
They are found in `install/disk_maps` directory of a Profile.
Disk maps are simple text files. Blank lines and lines starting with `#` are ignored with INI-like sections.

## Disks

The first section of a disk map is the `DISKS` section, which lists the disks that are present.
Each disk is listed on its own line, options are separated by whitespace.

**Options**

-   `NAME`: A name for the disk, used to refer to it in the rest of the disk map.
-   `DEVICE`: The device file for the disk, such as `/dev/sda` or `/dev/nvme0n1`.
-   `PARTITION_PREFIX`: (Optional) A prefix to be used for the partition device files, such as `p` in `/dev/nvme0n1p1`.

**Example**

```ini
[DISKS]
# NAME  DEVICE          PARTITION_PREFIX
main    /dev/sda
ssd     /dev/nvme0n1    p
```

## Partitions

The next section(s) of a disk map is the `PARTITIONS`, which lists the partitions that are present on each disk.
Each partition is listed on its own line, options are separated by whitespace.
The section is named after the disk, such as `PARTITIONS_main` for the `main` disk (defined in the `DISKS` section), so you need a separate section for each disk.

**Options**

-   `PARTNUM`: The partition number. Use `1` for the first partition.
-   `GAP`: The gap between the previous partition and this one. You can use `K` for kibibytes, `M` for mebibytes, `G` gibibytes and so on.
-   `SIZE`: The size of the partition, use the same units as `GAP`.
-   `TYPE`: The type of the partition. Available types:
    -   `luks1`/`luks2`: Linux LUKS container
    -   `efi` EFI system partition (FAT32)
    -   `msr` Microsoft reserved
    -   `win` Microsoft basic data (NTFS)
    -   `linux` Linux filesystem (ext4)
    -   `swap` Linux swap partition
-   `LABEL`: The label of the partition.

**Example**

```ini
[PARTITIONS_main]
# PARTNUM   GAP     SIZE    TYPE    LABEL
1           0       512M    efi     EFI
2           0       1G      luks1   BOOT
3           128M    18G     luks2   SYSTEM
4           128M    1G      swap    SWAP
```
