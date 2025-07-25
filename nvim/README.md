# Neovim Configuration

A modern Neovim configuration with LSP support, completions, and useful plugins managed by lazy.nvim.

## Features

- **Package Management**: Using [lazy.nvim](https://github.com/folke/lazy.nvim)
- **Theme**: [Ayu theme](src/plugins/ayu.lua) with transparent background
- **File Explorer**: [Neo-tree](src/plugins/neo-tree.lua) (`Ctrl + t`)
- **Fuzzy Finding**: [Telescope](src/plugins/telescope.lua) (`Ctrl + f`)
- **Git Integration**:
  - [LazyGit](src/plugins/lazygit.lua) (`<leader>lg`)
  - [Gitsigns](src/plugins/git-config.lua) for inline git information
- **LSP Support**:
  - Built-in LSP configuration with Mason
  - Automatic formatting with none-ls
  - Code completions with nvim-cmp
- **Quality of Life**:
  - Auto-pairs for brackets
  - Status line with lualine
  - Dashboard on startup
  - Treesitter for syntax highlighting
  - File save notifications

## Key Bindings

### General

- `<Space>` - Leader key
- `Ctrl + s` - Save file
- `Ctrl + q` - Quit
- `Ctrl + f` - Find files
- `Ctrl + t` - Toggle file explorer
- `Alt + Up/Down` - Move line up/down
- `Alt + z` - Toggle word wrap

### Window Navigation

- `Ctrl + Left/Right/Up/Down` - Navigate between windows

### Git

- `<leader>lg` - Open LazyGit
- `<leader>gp` - Preview git hunk
- `<leader>gt` - Toggle git blame

### LSP

- `K` - Hover documentation
- `gd` - Go to definition
- `<Space>ca` - Code actions
- `F` - Format document

## Installation

1. Clone this repository to your Neovim config location:

```bash
git clone <repo-url> ~/.config/nvim


2. Start Neovim - lazy.nvim will automatically install all plugins

## Requirements

- Neovim >= 0.8.0
- Git
- A Nerd Font (optional, disabled by default)
- ripgrep (for Telescope live grep)
```
