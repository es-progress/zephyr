# Zephyr

## Overview

Zephyr is a powerful Bash-based framework designed to simplify and improve Ubuntu installation and configuration.
It separates generalized customization scripts (**Modules**) from the configurations they manage (**Profiles**), providing a flexible and maintainable approach to system customization.

Zephyr relies on modules to apply specific configurations and customizations to your system.
These modules perform a wide range of tasks, for example:

- Install packages (APT, node, pip, snap)
- Configure applications & tools (Apache, PHP, VirtualBox, Git, dig, ssh, nmap, etc.)
- Configure GNOME, Bash
- Set up Linux subsystems (e.g. sudo, cron, systemd)
- Disk partitioning & formatting
- Remix Ubuntu ISO

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
- `bin/bootstrap.sh`- Core initialization and environment setup
- `bin/completion.sh`- Bash completion script for zephyrctl
- `bin/library.sh` - Shared functions and utilities
- `bin/zephyrctl` - Main CLI controller
- `bin/customize/` - Module scripts organized by category
- `bin/customize/runner` - Module execution engine
- `bin/customize/apps/` - Application modules
- `bin/customize/gnome/` - GNOME desktop modules
- `bin/customize/other/` - Uncategorized modules
- `bin/customize/packages/` - Package management modules
- `bin/customize/services/` - Service configuration modules
- `bin/customize/shell/` - Shell customization modules
- `bin/customize/system/` - System-level modules
- `bin/customize/tools/` - Developer tool modules
- `bin/customize/` - Module scripts organized by category
- `bin/install/` - Pre- and post-installation scripts
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

### Module Development

- Each module should be a standalone executable script in the appropriate category directory
- Use configuration files from profiles
- Support both global and local configuration variants
- Configuration files use INI-style format with sections: `[section_name]`
- Ensure modules are idempotent (safe to run multiple times)
- Follow the existing code organization and naming patterns
- respect code-style rules defined by `.editorconfig` and follow existing code style in the project

### Code Documentation

- Update relevant documentation in `docs/` when making changes
- Document module capabilities and configuration options
- Maintain up-to-date help text in `zephyrctl` commands

### Module Testing

- All modules should be testable in CI environment
- Use the existing test framework in `.github/actions/run-tests`
- Test modules should run without user interaction
- Mock external dependencies when necessary for testing
- Validate that modules don't break existing functionality

### Contribution Guidelines

- commit messages should be short but descriptive and prefixed with the affected module, e.g. `customize/gnome/wallpaper: set background for dark mode also`, `zephyrctl/remix: use + in find not \;` or `docs/index: Add note about Know-how section`
- PR titles should be short but descriptive (no emojis), PR description should contain a short summary of changes, motivation, and any relevant links
