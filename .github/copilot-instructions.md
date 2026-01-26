# Zephyr

## Overview

Zephyr is a powerful Bash-based framework designed to simplify and improve Ubuntu installation and configuration.
It separates generalized customization scripts (**Modules**) from the configurations they manage (**Profiles**), providing a flexible and maintainable approach to system customization.

Zephyr relies on modules to apply specific configurations and customizations to your system.
These modules perform a wide range of tasks, for example:

- install packages (APT, node, pip, snap)
- configure applications & tools (Apache, PHP, VirtualBox, Git, dig, ssh, nmap, etc.)
- configure GNOME, Bash
- set up Linux subsystems (e.g. sudo, cron, systemd)
- disk partitioning & formatting
- remix Ubuntu ISO

You can store your configurations organized into profiles.
It's possible to create many different profiles and a default one.
If a configuration value is not specified in the selected profile, it falls back to the default.
This provides flexibility so you can tailor customization to your needs.

## Tech stack

- Bash 5
- Beautysh (for shell formatting)
- ShellCheck (for shell linting)
- MkDocs (for documentation)

## Project structure

- `.github/`
    - GitHub Actions workflows & actions
    - Copilot instructions
- `bin/` - Bash shell scripts
- `bin/bootstrap.sh`- core initialization and environment setup
- `bin/completion.sh`- Bash completion script for zephyrctl
- `bin/library.sh` - shared functions and utilities
- `bin/zephyrctl` - main CLI controller
- `bin/customize/` - module scripts organized by category
- `bin/customize/runner` - module execution engine
- `bin/customize/apps/` - application modules
- `bin/customize/gnome/` - GNOME desktop modules
- `bin/customize/other/` - uncategorized modules
- `bin/customize/packages/` - package management modules
- `bin/customize/services/` - service configuration modules
- `bin/customize/shell/` - shell customization modules
- `bin/customize/system/` - system-level modules
- `bin/customize/tools/` - developer tool modules
- `bin/customize/` - module scripts organized by category
- `bin/install/` - pre- and post-installation scripts
- `bin/remix/` - ISO remixing scripts
- `docs/`
    - project documentation
    - generated static web site can be found in the `gh-pages` branch
- `example/` - example profiles for demonstration and testing
- `mixing/` - temporary files during ISO remixing (ISO contents, unpacked squashfs)
- `payload/` - additional files to be copied to the target system
- `profiles/` - user profiles containing configuration files
- `remix/` - configuration for Ubuntu ISO remixing

## Coding conventions

### Module development

- each module should be a standalone executable script in the appropriate category directory
- use configuration files from profiles
- support both global and local configuration variants
- configuration files use INI-style format with sections: `[section_name]`
- ensure modules are idempotent (safe to run multiple times)
- follow the existing code organization and naming patterns
- respect code-style rules defined by `.editorconfig` and follow existing code style in the project

### Code documentation

- update relevant documentation in `docs/` when making changes
- document module capabilities and configuration options
- maintain up-to-date help text in `zephyrctl` commands

### Module testing

- all modules should be testable in CI environment
- use the existing test framework in `.github/actions/run-tests`
- test modules should run without user interaction
- mock external dependencies when necessary for testing
- validate that modules don't break existing functionality

### Contribution guidelines

- commit messages should be short but descriptive and prefixed with the affected module, e.g. `customize/gnome/wallpaper: set background for dark mode also`, `zephyrctl/remix: use + in find not \;` or `docs/index: Add note about Know-how section`
- PR titles should be short but descriptive (no emojis), PR description should contain a short summary of changes, motivation, and any relevant links
