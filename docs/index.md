# Welcome!

This is the comprehensive documentation for [_Zephyr_ :eight_spoked_asterisk:](https://github.com/es-progress/zephyr){target=\_blank} -- your companion in streamlining Ubuntu installation and configuration (customization).
If you're looking to optimize your customization workflow, you've come to the right place!

## What is Zephyr?

Zephyr :eight_spoked_asterisk: is a powerful framework designed to simplify and improve your experience with Ubuntu installation & configuration.
It separates the generalized scripts that apply the customizations (**Modules**) from the configurations they manage (**Profiles**).

Let's see these two core concepts as they tell the most about Zephyr and how it helps.

**Profiles**

You can store your configurations organized into profiles.
It's possible to create many different profiles and a default one.
If a configuration value is not specified in the selected profile, it falls back to the default.
This provides flexibility so you can tailor customization to your needs.

**Modules**

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

Additionally, `zephyrctl` is included, a handy tool to accomplish these jobs.

Also, as Zephyr was written in Bash, there's no dependency (other than Bash :smile:).

Now that you have a glimpse of what Zephyr is and how it works at its core, let's explore the different sections of our documentation to help you get started on your journey with Zephyr.

## Documentation Sections

The [Installation Guide](install.md) will walk you through the process of getting Zephyr up and running on your computer.

In the [Profiles](profiles.md) section, you'll discover how to create and manage customization profiles.

Then you can learn how to create your own [Ubuntu remix](remix.md).

Are you setting up a fresh system or reinstalling an existing one?
The [Ubuntu Installation](ubuntu.md) section provides guidance on the pre-install, install, and post-install phases to ensure a smooth Ubuntu setup.

[Customization](customize.md) is at the heart of Zephyr.
In this section, you'll learn how to use modules to customize your system.

Finally, the Reference sections provide detailed information about [Zephyr settings](reference/configs.md), [zephyrctl](reference/zephyrctl.md) and the [modules](reference/modules.md).

!!! note

    This project is licensed under the GPLv3 license.

    PRs are always welcomed! :heart:

    **DISCLAIMER**:
    Ubuntu is a registered trademark owned by Canonical. Zephyr is NOT affiliated with, endorsed or sponsored by Canonical in any ways.
