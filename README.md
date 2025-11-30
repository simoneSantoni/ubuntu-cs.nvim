# yaru.nvim

This is the Yaru color scheme for Neovim.

## Features

- Faithful Yaru palette adapted for dark backgrounds
- Extra polish for LSP, Telescope, diagnostics, Git signs, and Indent Blankline
- Terminal colors set for a consistent feel in `:terminal`
- Optional transparency and italics toggle

## Installation

Install with your favorite plugin manager.

### Packer

```lua
use "simoneSantoni/yaru.nvim"
```

### Lazy

```lua
{
  "simoneSantoni/yaru.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "yaru"
  end,
}
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
