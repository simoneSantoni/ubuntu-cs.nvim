# ubuntu-yaru.nvim

A Neovim colorscheme based on Ubuntu's [Yaru](https://github.com/ubuntu/yaru) theme, featuring the iconic aubergine and orange palette.

## Features

- Faithful Yaru palette adapted for dark backgrounds
- Treesitter highlighting support
- LSP, diagnostics, Telescope, GitSigns, and IndentBlankline integration
- Terminal colors for a consistent `:terminal` experience
- Optional transparency and italics toggle

## Requirements

- Neovim 0.8+ with `termguicolors` enabled

## Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "simoneSantoni/ubuntu-yaru.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "yaru"
  end,
}
```

### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'simoneSantoni/ubuntu-yaru.nvim'
```

## Usage

Set the colorscheme in your `init.lua`:

```lua
vim.cmd.colorscheme "yaru"
```

## Options

Add these before setting the colorscheme:

```lua
-- Keep your terminal or compositor background visible
vim.g.yaru_transparent_background = true

-- Turn off italics everywhere
vim.g.yaru_disable_italics = true
```
