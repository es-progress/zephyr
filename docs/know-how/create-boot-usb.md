# Bootable USB stick

This is how to create a bootable USB drive.

Preferably, opt for the same OS for this operation as the bootable USB you want to burn (Windows-stick on Windows, Ubuntu-stick on Ubuntu).
It is possible to do it the other way around but it's just more hassle...

Before you start, check your USB stick is empty or you've already backed up the files!

!!! danger "All files on the drive will be lost!"

    Create backups if necessary and double-check the device name!

## Ubuntu boot

1. Download Ubuntu image (ISO file) that you want to install
1. Plug in USB stick, open it and ensure it actually contains what you believe! :wink:
1. Create a bootable USB drive for Ubuntu.

    - on Windows: use [Rufus](https://rufus.ie/en/){target=\_blank}. Usage is pretty straight-forward, but you can find instructions on the site.
    - on Ubuntu

        ```
        dd bs=4M oflag=sync status=progress if=ISO_FILE of=USB_DEVICE

        where:
        ISO_FILE            Ubuntu image file
        USB_DEVICE          USB drive device (e.g. /dev/sdb)
        ```

!!! success "Bootable Ubuntu USB drive is ready!"

## Windows boot

1. Plug in USB stick, open and confirm its contents match your expectation! :wink:
1. Create Windows bootable USB drive

    - on Windows: use "MediaCreationTool", the native Windows tool for this purpose
    - on Ubuntu: it's a bit complicated, but you can use [WoeUSB](https://github.com/WoeUSB/WoeUSB){target=\_blank}

        1. Download Bash script from [WoeUSB releases](https://github.com/WoeUSB/WoeUSB/releases){target=\_blank} and make executable
            ```bash
            wget https://github.com/WoeUSB/WoeUSB/releases/download/v5.2.4/woeusb-5.2.4.bash
            chmod +x woeusb-5.2.4.bash
            ```
        1. Install dependencies
            ```bash
            apt install wimtools
            ```
        1. Download [Windows ISO](https://www.microsoft.com/software-download/windows10ISO){target=\_blank}
        1. Burn ISO to USB

            ```
            sudo ./woeusb-5.2.4.bash --device ISO_FILE USB_DEVICE

            where:
            ISO_FILE            Windows image file
            USB_DEVICE          USB drive device (e.g. /dev/sdb)
            ```

!!! success "Bootable Windows USB drive is ready!"
