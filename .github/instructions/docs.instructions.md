---
applyTo: "docs/**"
---

# Project coding standards for documentation

> **Context**: These standards apply to all documentation files in the `docs/` directory. See [copilot-instructions.md](../copilot-instructions.md) for general project conventions and [AGENTS.md](../AGENTS.md) for specialized agent information.

## Standards

- documentation file structure:
    - `/docs/nav.md`: navigation structure for the documentation site
    - `/docs/index.md`: main landing page for the documentation site
    - `/docs/install.md`: Zephyr installation instructions
    - `/docs/profiles.md`: information about profiles
    - `/docs/remix.md`: information about remixing Ubuntu ISOs
    - `/docs/ubuntu.md`: Ubuntu installation instructions
    - `/docs/customize.md`: customization instructions
    - `/docs/know-how/`: directory for technical know-how articles
    - `/docs/reference/`: directory for reference materials (configs, modules, `zephyrctl` etc.)
    - `/docs/theme/`: custom theme files for `mkdocs`
- use Markdown format for documentation files
- use clear and concise language
- use headings to organize content into sections and subsections
- use bullet points or numbered lists for clarity (ordered lists use `1.` for all items)
- include code snippets with proper syntax highlighting
- include configuration examples and use cases
- use links to reference other documentation pages or external resources
- keep reference materials up to date with code changes, follow existing documentation style and patterns
- review documentation for accuracy and completeness before publishing

## Additional resources

- [Main Copilot Instructions](../copilot-instructions.md) - project overview and general conventions
- [AGENTS.md](../AGENTS.md) - Documentation Expert agent for specialized assistance
- [MkDocs Configuration](../../mkdocs.yml) - documentation site configuration
- [Online Documentation](https://zephyr.es-progress.hu/) - published documentation site
