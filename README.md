# Zephyr

[![CI](https://github.com/es-progress/zephyr/actions/workflows/main.yml/badge.svg)](https://github.com/es-progress/zephyr/actions/workflows/main.yml)

## What is Zephyr?

Zephyr :eight_spoked_asterisk: is a powerful framework designed to simplify and improve your experience with Ubuntu installation & configuration.
It separates the generalized scripts that apply the customizations (**Modules**) from the configurations they manage (**Profiles**).
If you're looking to optimize your customization workflow, you've come to the right place!

Let's see these two core concepts as they tell the most about Zephyr and how it helps.

For more detailed information, please refer to the online [documentation](https://zephyr.es-progress.hu/).

## Profiles

You can store your configurations organized into profiles.
It's possible to create many different profiles and a default one.
If a configuration value is not specified in the selected profile, it falls back to the default.
This provides flexibility so you can tailor customization to your needs.

## Modules

Zephyr relies on modules to apply specific configurations and customizations to your system.
These modules perform a wide range of tasks, for example:

-   Install packages (APT, node, pip, snap)
-   Configure applications & tools (Apache, PHP, VirtualBox, Git, dig, ssh, nmap, etc.)
-   Configure GNOME, Bash
-   Set up Linux subsystems (e.g. sudo, cron, systemd)
-   Disk partitioning & formatting
-   Remix Ubuntu

As you can see, the core modules cover the needs of a web developer, sysadmin, or power user.
If you're missing a module, you can roll your own to extend Zephyr's capabilities!

## Installation

To install Zephyr locally, clone the Git repository, modify a few configurations (usually unnecessary), run the installer and you're good to go!

Below are the detailed installation steps:

1. Clone Git repository
    ```
    cd /path/to/desired/directory
    git clone https://github.com/es-progress/zephyr.git
    ```
1. (Optional) Configure Zephyr
    1. Check the default configurations in `zephyr.cfg` or the [Reference](https://zephyr.es-progress.hu/reference/configs/) to understand what you can customize.
    1. Make a duplicate of this file and rename it to `zephyr.local.cfg`
        ```
        cp zephyr.cfg zephyr.local.cfg
        ```
    1. Adjust configurations in the local configuration file. Any value provided here will overwrite the defaults in `zephyr.cfg`. If you omit a configuration, default value will be used.
1. Run the installer, which will:
    - Set up Bash completion for `zephyrctl`
    - Create a symlink for `zephyrctl` in `/usr/local/bin`, making it accessible from anywhere (if `/usr/local/bin` is in your PATH).
    ```
    # Replace ZEPHYR_DIR with the actual path where Zephyr were cloned earlier
    cd ZEPHYR_DIR
    ./bin/zephyrctl install
    ```

## Execute modules

Executing a module is simple as this:

```
zephyrctl customize PROFILE [MODULE]...

where:
PROFILE            Selected customization profile
MODULE             List of modules to run
```

## Note

This project is licensed under the GPLv3 license.

PRs are always welcomed! :heart:

**DISCLAIMER**:
Ubuntu is a registered trademark owned by Canonical. Zephyr is NOT affiliated with, endorsed or sponsored by Canonical in any ways.
