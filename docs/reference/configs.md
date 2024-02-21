# Configurations

This section is about the settings of Zephyr :eight_spoked_asterisk: itself.
Do not confuse with the [Customization](../customize.md) section, which is about applying the different configurations and customizations (defined in [Profiles](../profiles.md)) to your system using Zephyr.

You can find all Zephyr settings in the `zephyr.cfg` file.
To alter any of these settings, create a copy of this file (called `zephyr.local.cfg`) in the project root and modify the parameters as needed.

!!! info

    Configuration files will be sourced by Bash, so you can use Bash syntax to define variables, set values or use environment variables.

Here is a list of options along with their descriptions.

---

## INSTALL_DIR

This option specifies the installation directory for Zephyr. Default is `/usr/local/share/zephyr`.

---

## ASSETS_DIR

Zephyr assets will be stored in this directory.
This can include various media or other files that are required. Default is `/usr/local/share/zephyr/assets`.

---

## ISO_FILE_NAME

Default file name for the remixed ISO file when Zephyr crafts a new disk image.
This will be used if no explicit file name was given to `zephyrctl remix` command. Default is `zephyr.iso`.

---

## ISO_LABEL

The value of this setting determines the label for the remixed ISO file. Default is `zephyr`.

---

## MODULE_BLACKLIST

Comma-separated list of modules to be blacklisted. These modules won't be executed during customization (`zephyrctl customize`).
Modules listed here are practically disabled, it's not possible to run them, even explicitly requested with `zephyrctl customize BLACKLISTED_MODULE`.
Use this setting to skip modules that are not needed.
Default is `''`.

---

## MODULE_WHITELIST

Comma-separated list of modules to be whitelisted. Only these modules will be executed during customization if no other module was specified (`zephyrctl customize`).
You can still run any module if requested explicitly with `zephyrctl customize NOT_WHITELISTED_MODULE`.
Use this setting to run only a few selected modules by default. If you just want to disable some modules, use `MODULE_BLACKLIST` instead.
Default is `''`.
