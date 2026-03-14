# electro-nvim

A structured, Lua-based Neovim configuration built for Neovim 0.10+.

Managed via `lazy.nvim` (https://github.com/folke/lazy.nvim), the setup is split into a clean `core` for base behavior and a modular `plugins` directory.

## Architecture

*   `init.lua`: Main entry point.
*   `lua/core/`: Native Neovim configuration (`options`, `keymaps`, `autocmds`).
*   `lua/plugins/`: Individual plugin specs.
    *   Core UI & Navigation: Telescope, Harpoon, Neo-tree, Lualine.
    *   Editor Experience: Treesitter, Completion, Conform (formatting), Gitsigns.
    *   Language Support: Dedicated Rust integration.

## Prerequisites

Ensure your system has the following dependencies to support the configured plugins:

*   Neovim >= 0.10.0 (Strict requirement)
*   Git
*   C Compiler (`gcc`, `clang`, or `build-essential`) — Required by `nvim-treesitter`
*   Ripgrep (`rg`) & fd — Required by `telescope.nvim`
*   Rust Toolchain (`cargo`, `rustc`, `rust-analyzer`) — Required for the Rust environment
*   A Nerd Font — Recommended for `lualine` and `neo-tree` icons

### Ubuntu / WSL2 Dependency Setup
```bash
sudo apt update
sudo apt install build-essential ripgrep fd-find
```

### macOS Dependency Setup
```bash
brew install ripgrep fd
```

## Installation

1. Clean out any existing Neovim configuration:
   ```bash
   rm -rf ~/.config/nvim
   ```

2. Clone this repository:
   ```bash
   git clone https://github.com/electropicks/electro-nvim.git ~/.config/nvim
   ```

3. Launch Neovim:
   ```bash
   nvim
   ```
   Note: `lazy.nvim` will automatically bootstrap and install all plugins defined in `lua/plugins/`. Wait for the UI to finish syncing before proceeding.
