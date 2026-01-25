---
applyTo: "bin/**"
---

# Project coding standards for Shell scripts

## Standards

- always use `#!/usr/bin/env bash` shebang
- always use Bash strict mode by adding these lines at the beginning of the script main logic:

    ```bash
    # Strict mode
    set -eufo pipefail
    IFS=$'\n\t'
    ```

- script structure (example: `/bin/customize/services/php`):
    1. Shebang
    1. Header e.g.
        ```bash
        ############
        ## Zephyr ##
        ##        ##
        ## Config ##
        ## PHP    ##
        ############
        ```
    1. Global variables and constants
    1. Function definitions
    1. Main script logic
        1. Bash strict mode setup
        1. Bootstrap: `source "${PROJECT_ROOT}/bin/bootstrap.sh"`
        1. Check privileges (e.g. `check-root` or `check-not-root`)
        1. Read configuration values from profile files (global and local), e.g.
            ```bash
            if file=$(cfg-get "${profile}" services/global.cfg); then
            cfg-eval "${file}" php
            fi
            # shellcheck disable=SC2310,SC2311
            if file=$(cfg-get "${profile}" services/local.cfg); then
                cfg-eval "${file}" php
            fi
            ```
        1. Validate inputs, check required arguments: `[[ -z "${version}" ]] && error-exit Missing version`
        1. Execute main functionality

- for required arguments, check if they are provided; if not, print a meaningful error message e.g. `[[ -z "${url}" ]] && error-exit Missing url`
- check for root privileges when needed: `check-not-root` or `check-root`
- use `sudo` appropriately for system-level changes
- never run as root unless absolutely necessary
- use secure temporary directories for extraction operations
- set appropriate file permissions using `install` command with `--mode` flags
- preserve existing permissions when modifying system files
- add short comments to each logical block of code to explain its purpose, also for non-trivial commands
- document complex functions with clear parameter descriptions
- always provide meaningful status updates during long operations, use library functions for consistent output
- use functions to encapsulate reusable logic; avoid code duplication
- use helper functions from the library found in `bin/library.sh` whenever possible
- if a new function is added that could be useful in other scripts, consider adding it to the library
- use meaningful variable and function names that convey their purpose
- follow existing function naming conventions: `kebab-case` for functions, `UPPER_CASE` for constants
- use double quotes around variable expansions to prevent word splitting and globbing, e.g. `"${var}"`
- use shellcheck-compliant code (see `.shellcheckrc` for project rules)
