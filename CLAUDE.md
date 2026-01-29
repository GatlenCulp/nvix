# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Nvix is a modular Neovim configuration framework built with Nix and Nixvim. It provides three pre-configured packages (bare, core, full) and a library of reusable Neovim plugin modules that can be imported independently.

## Architecture

### Flake Structure

The repository uses `flake-parts` to organize the Nix flake into modular components:

- **flake.nix**: Entry point that imports `modules/flake`, `overlays`, and `plugins`
- **modules/flake/**: Flake-level configuration (devshell, perSystem setup)
- **packages/**: Defines the three package variants (bare, core, full)
- **plugins/**: Nixvim modules exposed as `flake.nvixPlugins`
- **overlays/**: Nix overlays (provides `pkgs.stable` from nixpkgs-stable)

### Plugin System

Plugins are auto-discovered Nixvim modules located in `plugins/`:

- `plugins/default.nix` uses a utility function `forAllNixFiles` to automatically expose all `.nix` files and directories with `default.nix` as `flake.nvixPlugins.<name>`
- Each plugin is a self-contained Nixvim module that can be imported independently
- Plugins can be nested in directories (e.g., `plugins/lsp/default.nix` → `nvixPlugins.lsp`)
- Common pattern: directories use `default.nix` to import all sibling files (see `plugins/lang/default.nix`, `plugins/lsp/default.nix`)

### Package Variants

Defined in `packages/default.nix`:

- **bare**: Minimal config with core UX (`common`, `buffer`, `ux`, `snacks`)
- **core** (default): Bare + LSP, treesitter, git, completions, UI plugins
- **full**: Core + advanced plugins (LaTeX via `tex`)

Each uses `inputs'.nixvim.legacyPackages.makeNixvimWithModule` to build a standalone Neovim package.

### Module Imports Pattern

Many modules use this pattern to auto-import sibling files:

```nix
imports = with builtins; with lib;
  map (fn: ./${fn}) (
    filter (fn: (fn != "default.nix" && !hasSuffix ".md" "${fn}"))
    (attrNames (readDir ./.))
  );
```

This allows splitting large configurations across multiple files without manually maintaining import lists.

## Development Commands

### Building Packages

```bash
# Build specific package variant
nix build .#bare
nix build .#core
nix build .#full

# Build and run directly
nix run .#bare
nix run .#core
nix run .#full

# Or from GitHub
nix run "github:niksingh710/nvix#core"
```

### Development Shell

```bash
nix develop
# Provides: just, nil, nix-output-monitor, nixfmt-rfc-style
# Pre-commit hooks enabled for nixfmt-rfc-style
```

### Formatting

```bash
# Format all Nix files (pre-commit hook will run this automatically)
nixfmt-rfc-style **/*.nix
```

### Testing Local Changes

```bash
# Run your modified config without installing
nix run .#core -- /path/to/file

# Or enter development mode
nix develop
# Then test individual modules
```

## Key Configuration Points

### Custom Icons and Options

The `plugins/common/icons.nix` file defines `config.nvix.icons` used throughout modules. Other common options:

- `config.nvix.leader`: Leader key (set in `common`)
- `config.nvix.border`: Window border style
- `config.nvix.mkKey.mkKeymap`: Helper for creating keymaps

### Language Support

Language-specific configuration is in `plugins/lang/`:

- Each language file configures LSP servers, formatters, and language-specific plugins
- General formatters (xml, yaml, json) are in `plugins/lang/default.nix`
- Uses `conform-nvim` for formatting

### LSP Configuration

Split across `plugins/lsp/`:

- `default.nix`: Core LSP setup with lsp-saga, trouble, ufo (folding)
- `conform.nix`: Formatter configuration
- `mappings.nix`: LSP keybindings

## Adding New Plugins

1. Create `plugins/<name>.nix` or `plugins/<name>/default.nix`
2. Write a standard Nixvim module (can use `config`, `lib`, `pkgs`)
3. No manual export needed - it's auto-discovered as `nvixPlugins.<name>`
4. Add to appropriate package variant in `packages/default.nix`

Example plugin structure:

```nix
{ lib, config, pkgs, ... }:
{
  plugins.my-plugin = {
    enable = true;
    settings = { };
  };
}
```

## Integration with Other Configs

Users can import individual modules into their Nixvim configs:

```nix
{
  inputs.nvix.url = "github:niksingh710/nvix";

  # In Nixvim config:
  modules = [
    inputs.nvix.nvixPlugins.common  # Essential
    inputs.nvix.nvixPlugins.lualine
    # Pick any modules needed
  ];
}
```

Or extend a complete package:

```nix
inputs.nvix.packages.${pkgs.system}.core.extend {
  # Override/extend configuration
  colorschemes.tokyodark.enable = true;
}
```

## Notable Design Decisions

- Uses `Snacks.picker` instead of Telescope for fuzzy finding
- OSC 52 clipboard support for SSH sessions (in `common/default.nix`)
- Pre-commit hooks enforce nixfmt-rfc-style formatting
- Overlays provide `pkgs.stable` for packages that need stable nixpkgs
- `luaLoader.enable = false` in common config
- KISS principle: keep modules simple and focused
