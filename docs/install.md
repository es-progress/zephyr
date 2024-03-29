# Installation

To install Zephyr :eight_spoked_asterisk: locally, clone the Git repository, modify a few configurations (usually unnecessary), run the installer and you're good to go!

Below are the detailed installation steps:

1. Clone the repository from GitHub
    ```bash
    cd /path/to/desired/directory
    git clone https://github.com/es-progress/zephyr.git
    ```
1. (Optional) Configure Zephyr
    1. Check the default configurations in `zephyr.cfg` or the [Reference](reference/configs.md) to understand what you can customize.
    1. Make a duplicate of this file and rename it to `zephyr.local.cfg`
        ```bash
        cp zephyr.cfg zephyr.local.cfg
        ```
    1. Adjust configurations in the local configuration file. Any value provided here will overwrite the defaults in `zephyr.cfg`. If a setting is not defined, the default value will be applied.
1. Run the installer, which will:
    - Set up Bash completion for `zephyrctl`
    - Create a symlink for `zephyrctl` in `/usr/local/bin`, making it accessible from anywhere (if `/usr/local/bin` is in your PATH).
    ```bash
    # Replace ZEPHYR_DIR with the actual path where Zephyr were cloned earlier
    cd ZEPHYR_DIR
    ./bin/zephyrctl install
    ```

And with that, you're all set! Let's rock! :metal:

If you want to start right away, and explore on your own, run `zephyrctl` without arguments to view the available commands. If you prefer to get informed first, check the next page to learn about how [customization profiles](profiles.md) work.

---

If you decide to uninstall Zephyr later (sorry to see you go!), just follow these steps:

1. Run `zephyrctl uninstall`
1. Delete the Git repository.

    Note: it may contain your local configuration file or profiles. If you want to preserve that, make a backup before deleting.
