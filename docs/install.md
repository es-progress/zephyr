# Installation

You can install Zephyr locally by cloning the Git repository, modifying a few configurations (usually not necessary), running the installer and you're good to go!

Here are the detailed installation steps:

1. Clone the Git repository from GitHub
    ```
    git clone https://github.com/es-progress/zephyr.git
    ```
1. Configure Zephyr
    1. Check the default configurations in `zephyr.cfg`
    1. Make a duplicate of this file and rename it to `zephyr.local.cfg`
        ```
        cp zephyr.cfg zephyr.local.cfg
        ```
    1. Adjust configurations in the local configuration file. Any value provided here will overwrite the defaults in `zephyr.cfg`. If you omit a configuration, default value will be used.
1. Run the installer, which will:
    - Set up Bash completion for `zephyrctl`
    - Create a symlink for `zephyrctl` in `/usr/local/bin`, making it accessible from anywhere (provided that `/usr/local/bin` is in your PATH).
    ```
    cd ZEPHYR_DIR
    ./bin/zephyrctl install
    ```

That's it, you're ready to roll! :metal:

It you want to start right away, and explore on your own, run `zephyrctl` without arguments to view the available commands. If you prefer to get informed first, check next page where you can learn about how customization profiles work.

---

If you decide to uninstall Zephyr later (sorry to see you go!), just follow these steps:

1. Run `zephyrctl uninstall`
1. Delete the Git repository