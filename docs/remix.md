# Remixing

Once your profiles are all set up comes a more exciting part: the remixing!
Now you can create _your own_ Ubuntu remix.

!!! info

    If you prefer applying your configurations to an existing system, that's perfectly fine as well.
    In that case you can skip this part and go directly to [Customization](customize.md).

Zephyr :eight_spoked_asterisk: and your configurations will be preinstalled on a stock Ubuntu ISO.
So, after a fresh install no other setup is needed, applying the customizations can start right away.
This results in a smooth (re)install/configure flow. :relaxed:

Remixing process is entirely automated, you only have to execute two `zephyrctl` commands (will see later).
However, you'll need to choose the Ubuntu ISO file you want to remix.

!!! note

    At the moment remixing is only tested with Ubuntu 20.04 desktop ISO.

Additionally, if you have your own scripts for initializing/bootstrapping your workspace or want to embed any other projects/files into the ISO file that's possible too.

For this purpose use `/payload` directory in Zephyr project root.
It's similar in concept to `/profiles` dir: it's ignored by Git, so you can copy any payload (files) into this directory (or symlink to any other dir!) it won't disturb Zephyr.
That directory and it's contents will be packed into the _SquashFS_ filesystem, so they are available when booting from the ISO (live desktop), and they are copied to the freshly installed system too!
You can find them in `/usr/local/share/zephyr/payload` by default, but this can be changed (see `INSTALL_DIR` config).

**Remixing steps**

1.  Download ISO file that will be remixed (e.g. Ubuntu 20.04 desktop ISO)
    ```
    # There are many methods, in this example I use 'wget'
    wget https://releases.ubuntu.com/20.04.6/ubuntu-20.04.6-desktop-amd64.iso
    ```
1.  Remix ISO file

    ```
    zephyrctl remix ubuntu-20.04.6-desktop-amd64.iso
    ```

    By default, this will create a remixed ISO file named `zephyr.iso` in the current directory.
    This can be configured or you can set a filename on CLI also.
    For details run `zephyrctl help remix`.

    !!! success

        If you want install your remix on a virtual machine then you're ready!
        Just boot from the newly generated ISO.

1.  (Optional) Burn ISO to USB-stick, if you want install on a physical machine.

    ```
    zephyrctl burn zephyr.iso
    ```

    This will interactively ask for a disk (device file). It's possible to give the disk as a parameter, in this case it will run non-interactively.
    Also make sure the USB-stick is plugged in. :nerd_face:

    For details execute `zephyrctl help burn`.

    !!! danger "Any previous data on the disk will be deleted!"

        There are some safeguards, so hopefully won't overwrite your root filesystem, but please be careful and always double check that the correct device is selected :bangbang:

At this point you have remixed Ubuntu. The next step is [Ubuntu installation](ubuntu.md).
