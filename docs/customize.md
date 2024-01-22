# Customization

This chapter is about how to use Zephyr :eight_spoked_asterisk: to customize your Ubuntu install: install packages, apply configurations and generally set up the system.

This is the essential part, in fact it's the whole point of this project!
However this is the easiest task. :wink:

## Modules

Customizations are organized into _Modules_.
Each module configures a specific application, tool, Linux subsystem, system administration job (or just one particular setting) or installs a package from a package manager.
For a comprehensive list of modules see Reference or the example profile in `example/default` directory.

Basically, customizing means running these modules. It's possible to run all or just one if you wish.
You can execute a module multiple times, it will always update to the latest change in the configuration files.

When to customize depends on your use.
Typically you'll run all modules after a new OS (re)install.
Then on a live system, update just the modules which configuration have changed.

## Execute modules

Executing a module is simple as this:

```
zephyrctl customize PROFILE [MODULE]...

where:
PROFILE            Selected customization profile
MODULE             List of modules to run
```

This is the end of the guides.
For now you should be familiar how Zephyr :eight_spoked_asterisk: works and how it can help you to streamline your Ubuntu install & configure workflow.

The best way to learn Zephyr is to jump right in and create your first configuration profile and run it! :smile:

However, if you want to dig deeper into available modules, their configuration options and configurations for Zephyr itself or `zephyrctl` you can check the Reference.
