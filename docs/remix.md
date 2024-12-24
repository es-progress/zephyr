# Remixing

When your profiles are all set up, the more exciting part comes: the remixing!
Now you can create _your own_ Ubuntu remix.

!!! info

    If you prefer applying your configurations to an existing system, that's perfectly fine as well.
    In that case you can skip this part and go directly to [Customization](customize.md).

Zephyr :eight_spoked_asterisk: with your profiles will be preinstalled on a stock Ubuntu ISO.
So, after a fresh install no other setup is needed, applying the customizations can start right away.
This results in a smooth (re)install/configure flow. :relaxed:

The remixing process is entirely automated; you will only have to run a few `zephyrctl` commands (as explained later).
However, you'll need to choose the Ubuntu ISO file you want to remix.

!!! note

    Currently, remixing has only been tested with the Ubuntu 20.04 desktop ISO.

Additionally, if you have your own scripts for initializing/bootstrapping your workspace or want to embed any other projects/files into the ISO file that's possible too.

For this purpose use `/payload` directory in Zephyr root.
It's similar in concept to `/profiles` dir: it's ignored by Git, so you can copy any payload (files) into this directory (or symlink to any other dir!) it won't disturb Zephyr.
That directory and its contents will be packed into the _SquashFS_ filesystem, so they are available when booting from the ISO (live desktop), and they are copied to the freshly installed system too!
You can find them in `/usr/local/share/zephyr/payload` by default, but this can be changed (see `INSTALL_DIR` config).

Besides the payload, you can further customize the remixing, like adding your own preseed files.
The configuration files live in the `/remix` directory. This works similarly to the `/profiles` and `/payload` directories.

**Remixing steps**

1.  Download the ISO file that will be remixed (e.g. Ubuntu 20.04 desktop ISO)
    ```bash
    # There are many methods, in this example I use 'wget'
    wget https://releases.ubuntu.com/20.04.6/ubuntu-20.04.6-desktop-amd64.iso
    ```
1.  (Optional) Create preseed files in `/remix/preseeds` directory.

    These files will be included in the remixed ISO image, and they can be used to bootstrap the installation process by [preseeding](https://wiki.ubuntu.com/UbiquityAutomation){target=\_blank} the installer with answers to questions it asks.
    You need to give the preseed file as kernel boot parameter to the installer.

    ```
    linux	/casper/vmlinuz  file=/cdrom/preseed/zephyr.seed maybe-ubiquity quiet splash ---
    ```

1.  (Optional) Customize GRUB menu of the remixed ISO.

    You can override the stock `grub.cfg` with your own at `/remix/grub.cfg`.
    This is useful if you want to add extra boot options (maybe ones with your preseed files as boot options) or change the default boot entry.

    There's a [helper](reference/zephyrctl.md#extract-grub) to extract the stock `grub.cfg` from the ISO file, so you can start from that.

    ```bash
    zephyrctl extract-grub ubuntu-20.04.6-desktop-amd64.iso
    ```

1.  Remix the ISO file

    ```bash
    zephyrctl remix ubuntu-20.04.6-desktop-amd64.iso
    ```

    By default, this will create a remixed ISO file named `zephyr.iso` in the current directory.
    This can be configured or you can set a filename on CLI also.
    For details run `zephyrctl help remix`.

    !!! success

        If you want install your remix on a virtual machine then you're ready!

        Just boot from the newly generated ISO.

1.  (Optional) Burn the ISO file to a USB-stick, if you want install on a physical machine.

    ```bash
    zephyrctl burn zephyr.iso
    ```

    This will interactively ask for a disk (device file). It's possible to give the disk as a parameter, in this case it will run non-interactively.
    Also make sure the USB-stick is plugged in. :nerd_face:

    For details execute `zephyrctl help burn`.

    !!! danger "Any previous data on the disk will be deleted!"

        There are some safeguards, so hopefully won't overwrite your root filesystem, but please be careful and always double check that the correct device is selected :bangbang:

At this point you have remixed Ubuntu. The next step is [Ubuntu installation](ubuntu.md).
