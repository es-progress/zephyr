# Configurations

This section is about the settings of Zephyr :eight_spoked_asterisk: itself.
Do not confuse with the [Customization](../customize.md) section, which is about applying the different configurations and customizations (defined in Profiles) to your system using Zephyr.

You can find all Zephyr settings in the `zephyr.cfg` file.
To alter any of these settings, create a copy of this file (called `zephyr.local.cfg`) in the project root and modify the parameters as needed.

!!! info

    Configuration files will be sourced by Bash, so you can use Bash syntax to define parameters, values or variables.

Below is a list of options along with their descriptions.

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
