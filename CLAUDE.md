# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

yaru.nvim is a Neovim colorscheme plugin implementing the Ubuntu Yaru theme. It's a single-file colorscheme located at `colors/yaru.lua`.

## Development

No build or test commands - this is a pure Lua colorscheme. To test changes, load it in Neovim:

```vim
:source colors/yaru.lua
```

Or reload the colorscheme after making changes:

```vim
:colorscheme yaru
```

## Architecture

The colorscheme is self-contained in `colors/yaru.lua`:

1. **Palette definition** (lines 1-17): Core colors from Ubuntu Yaru theme
2. **User options** (lines 19-27): `vim.g.yaru_transparent_background` and `vim.g.yaru_disable_italics`
3. **Highlight groups** (lines 53-170): Standard Vim highlights, diagnostics, LSP, Telescope, GitSigns, Treesitter, and IndentBlankline
4. **Terminal colors** (lines 176-191): 16-color terminal palette

When adding new highlight groups, follow the existing pattern using the `palette` table and `with_style()` wrapper for italic handling.
