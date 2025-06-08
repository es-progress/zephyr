# Disk maps

Disk maps are a way to define disk structure (partitions, LVM, LUKS encryption, filesystems).
This will determine how the system is laid out and how the data is stored.

They are similar to configuration files for Modules, but there's no global/local distinction as disk maps are always specific to a system.
They are found in `install/disk-maps` directory of a Profile.
Disk maps are simple text files. Blank lines and lines starting with `#` are ignored with INI-like sections.

## Formats

Zephyr :eight_spoked_asterisk: supports two disk map formats:

1. **New Format**: Used by the `zephyrctl disk` command, providing comprehensive disk management capabilities.
2. **Legacy Format**: Used by the `zephyrctl partition` and `zephyrctl format` commands.

The following sections document both formats.

## New Format

The new format is used by the `zephyrctl disk` command and provides a more structured way to define disks, partitions, LVM volumes, LUKS encryption and filesystems.
It consists of several sections, each with its own purpose.
With this format, you can define complex disk structures like LVM-on-LUKS or LUKS-on-LVM, as well as simple partitioning schemes.

You can find example disk maps in the `/example/profiles/default/install/disk-maps` directory.

### disks

The first section of a disk map is the `disks` section, which lists the disks that are present.
Each disk is listed on its own line, options are separated by whitespace.

**Options**

- `DISK_NAME`: A name for the disk, used to refer to it in the rest of the disk map.
- `DEVICE`: The device file for the disk, such as `/dev/sda` or `/dev/nvme0n1`.
- `PART_PREFIX`: (Optional) A prefix to be used for the partition device files, such as `p` in `/dev/nvme0n1p1`.

**Example**

```ini
[disks]
# DISK_NAME DEVICE       [PART_PREFIX]
main        /dev/sda
ssd         /dev/nvme0n1 p
```

### partitions

The next section (`partitions`) of a disk map define the partitions for each disk.
Each partition is listed on its own line, options are separated by whitespace.

**Options**

- `DISK_NAME`: The name of the disk this partition belongs to, as defined in the `disks` section.
- `NUM`: The partition number. Use `1` for the first partition.
- `GAP`: The gap between the previous partition and this one. You can use `K` for kibibytes, `M` for mebibytes, `G` for gibibytes and so on.
- `SIZE`: The size of the partition, use the same units as `GAP`.
- `TYPE`: The partition type. This affects the partition type code (not the filesystem). Available types:
    - `efi`: EFI system partition (type code: ef00)
    - `msr`: Microsoft reserved (type code: 0c01)
    - `win`: Microsoft basic data (type code: 0700)
    - `linux`: Linux filesystem (type code: 8300)
    - `swap`: Linux swap partition (type code: 8200)
    - `luks`: Linux LUKS container (type code: 8309)
    - Or any other valid GPT type code
- `LABEL`: The label of the partition.
- `CRYPT`: (Optional) Type of LUKS encryption to use on this partition:
    - `luks1`: LUKS1 format
    - `luks2`: LUKS2 format
    - `-`: No encryption
- `FILESYSTEM`: (Optional) Filesystem to create on the partition:
    - `fat32`: FAT32 filesystem
    - `ext4`: Linux ext4 filesystem
    - `swap`: Linux swap partition
    - `ntfs`: NTFS filesystem
    - `msr`: Microsoft reserved (special handling)
    - `-`: Don't create a filesystem

**Example**

```ini
[partitions]
# DISK_NAME NUM  GAP  SIZE TYPE  LABEL          CRYPT FILESYSTEM
main          1    0  128M efi   EFI            -     fat32
main          2    0  512M luks  CRYPT_BOOT     luks1 ext4
main          3  32M   18G luks  CRYPT_PV_MAIN  luks2 -

ssd           1    0    2G win   MEDIA          -     ntfs
ssd           2 512M    2G luks  CRYPT_PV_STORE luks2 -
```

### vol-groups

The `vol-groups` section defines LVM volume groups to be created.
Each volume group is listed on its own line, options are separated by whitespace.

**Options**

- `VG_NAME`: The volume group name.
- `PHYSICAL_VOLUMES`: Comma-separated list of partition devices (specified by partition labels) that belong to this volume group. They will be made into physical volumes (PVs) for LVM.

**Example**

```ini
[vol-groups]
# VG_NAME  PHYSICAL_VOLUMES
vg-main    CRYPT_MAIN
vg-home    CRYPT_HOME_1,CRYPT_HOME_2
```

### volumes

The `volumes` section defines logical volumes to be created in each volume group.
Each logical volume is listed on its own line, options are separated by whitespace.

**Options**

- `VG_NAME`: The volume group name where this logical volume belongs.
- `NAME`: The logical volume name.
- `TYPE`: The LVM volume type (e.g., `linear`, `raid1`, `raid5`).
- `SIZE`: The size of the volume. Can be specified in bytes (K,M,G) or as a percentage of available space (e.g., `100%FREE`).
- `CRYPT`: (Optional) Type of LUKS encryption to use on this volume.
    - `luks1`: LUKS1 format
    - `luks2`: LUKS2 format
    - `-`: No encryption
- `FILESYSTEM`: (Optional) Filesystem to create on the volume.
    - `fat32`: FAT32 filesystem
    - `ext4`: Linux ext4 filesystem
    - `swap`: Linux swap partition
    - `ntfs`: NTFS filesystem
    - `msr`: Microsoft reserved (special handling)
    - `-`: Don't create a filesystem

**Example**

```ini
[volumes]
# VG_NAME NAME  TYPE       SIZE CRYPT FILESYSTEM
vg-main   root  linear     100G -     ext4
vg-main   swap  linear 100%FREE -     swap
vg-home   home  raid1  100%FREE -     ext4
```

## Legacy Format

This format is used by the older `zephyrctl partition` and `zephyrctl format` commands.

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
