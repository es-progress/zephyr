# Customization

This chapter covers how to use Zephyr :eight_spoked_asterisk: to tailor your Ubuntu installation process by installing packages, applying configurations, and setting up the system in general.

This is the essential part, in fact it's the whole point of this project!
However, it's the simplest task. :wink:

## Modules

Customizations are organized into _Modules_.
Each module is responsible for configuring a specific application, tool, Linux subsystem, system administration job (or even a single setting), or installs a package from a package manager.
For a comprehensive list of modules see [Reference](reference/modules.md) or the example profile in `/example/profiles/default` directory.

It's also possible to create custom modules if your tools (apps, etc.) are not covered by Zephyr.
For details on how to create a module check the [`other/local` module](reference/modules.md#local).

Basically, customizing means running these modules. It's possible to run all or just one if you wish.
You can execute a module multiple times, it will always update to the latest change in the configuration files.

When to customize depends on your use.
Typically you'll run all modules after a new OS (re)install.
Then on a live system, update just the modules which configuration have changed.

## Execute modules

Executing a module is as simple as this:

```
zephyrctl customize PROFILE [MODULE]...

where:
PROFILE            Selected customization profile
MODULE             Module/category to run (eg. apt, system).
                   If prefixed with '~', then the module
                   or the whole category is skipped (e.g ~apt, ~system).
                   If none given, all modules will be executed.
```

For details see [Reference](reference/zephyrctl.md#customize).

---

This is the end of the guides.
By now, you should be familiar with how Zephyr :eight_spoked_asterisk: works and how it can streamline your Ubuntu installation & configuration workflow.

The best way to learn Zephyr is to jump right in and create your first configuration profile and run it! :smile:

However, if you want to dig deeper into available modules, their configuration options and settings for either Zephyr itself or `zephyrctl` check the Reference.
