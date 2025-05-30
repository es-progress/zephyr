# Profiles

As _Profiles_ are the heart of remixing, this part is very important to fully understand.
This makes it a bit longer, but don't worry the rest will be nice & easy after this (they are handled by Zephyr after all). :wink:

## Introduction

Zephyr :eight_spoked_asterisk: is merely a framework to organize & apply your local configurations.
It eliminates manual work but it knows nothing about the actual modifications, customizations and configuration values.
All these details are contained in configuration profiles.
This way we can separate the generalized scripts that do the heavy lifting and the content they manage.

During [customization](customize.md) you can choose which profile to use, and the system will get customized according to that.
You can design many "named" profiles and a default one.
If a configuration value is not specified in the selected profile, it will fallback to the default.
This allows to have (let's say) different wallpapers on individual machines but your shared configs need to be defined only once in the default profile.

!!! note

    Currently only two levels of profiles are supported: default and other (named). No OOP-style profile inheritance is possible.

You can create just a default profile or a named one, if that approach fits, but all configurations (well, actually the ones you want to run) need to be set in at least one of the profiles.

Zephyr will look for profiles in the `/profiles` directory in the local Git clone (e.g. `DIR_ZEPHYR/profiles`).
This directory is ignored by Git, so you can freely add your configs, updating Zephyr won't mess up your files.
Symlinking also works, so you can have your profiles anywhere else just symlink that directory to `/profiles` and Zephyr will follow links.

!!! tip

    Store your profiles in a Git repository and symlink your (probably private) config repo to `/profiles`.

    This allows you to keep your configurations under version control without interfering with Zephyr.

## Create profiles

To define a profile, you create a directory in `/profiles` named as your new profile.

```bash
# This will create a named profile called "foo"
cd ZEPHYR_DIR
mkdir -p profiles/foo
```

You can also create from scratch, but an easier way is to copy the default profile in `/example/profiles` directory.

```bash
# Use supplied default profile
cd ZEPHYR_DIR
mkdir -p profiles
cp -r example/profiles/default profiles/

# Create a new profile called "bar" based on default
cd ZEPHYR_DIR
mkdir -p profiles
cp -r example/profiles/default profiles/bar
```

## Profile structure

Zephyr consists of different _Modules_ that are responsible to configure a specific application (Virtualbox, Apache etc.), tool (Git, `gpg` for example), Linux subsystem (like `sudo` or `systemd-resolved`), a system administration job (disk partitioning, backing up GPT partition table) or just one particular setting (e.g. GNOME wallpaper).
For more about modules see [Customizations](customize.md).

Inside profiles configuration files are grouped by category (e.g. apps, system) and then by name of module (e.g. system/netplan, system/shorewall).
There are configurations for each module, and each config file or directory has a global and a local counterpart.
They use the same syntax and hold the same configurations.
The reason for this is to be able to override only parts of a configuration in a named profile.
During customization, configuration values are merged from the named and the default profile.

Typically you would place your global files in the default profile and local files in named profiles.
But you can have global files on named profile also, in this case the global config file will be ignored in default profile.
You can mix global/local files in any profile (including default) to achieve your goals.

!!! abstract

    Check profiles in `/example/profiles/default` and `/example/profiles/tester` for examples on using global and local config files.

    Also each available configuration is present in the default example profile with a short description.
    For more details about configurations see [Reference](reference/modules.md).

    Happy profiling! :grinning:

Now, once your profiles are ready :heavy_check_mark:, you can [remix Ubuntu](remix.md) and create your custom ISO file!
Alternatively, if you just want to update any module on a live system go to [Customizations](customize.md).
