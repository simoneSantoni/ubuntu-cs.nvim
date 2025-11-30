local palette = {
  bg = "#2C001E",
  bg_alt = "#3B1028",
  bg_float = "#31091F",
  fg = "#F6F5F4",
  fg_dim = "#D5CFCA",
  comment = "#B7A7B4",
  orange = "#E95420",
  aubergine = "#772953",
  aubergine_dark = "#5E2750",
  gold = "#F99B15",
  green = "#26A269",
  teal = "#19B6EE",
  red = "#C7162B",
  border = "#4A1D33",
  selection = "#3D1E2F",
}

local transparent = vim.g.yaru_transparent_background == true
local enable_italics = vim.g.yaru_disable_italics ~= true

local backgrounds = {
  main = transparent and "NONE" or palette.bg,
  alt = transparent and "NONE" or palette.bg_alt,
  float = transparent and "NONE" or palette.bg_float,
  gutter = transparent and "NONE" or palette.bg,
}

local function with_style(spec)
  local result = {}
  for key, value in pairs(spec) do
    result[key] = value
  end

  if not enable_italics and result.italic then
    result.italic = nil
  end

  return result
end

vim.opt.termguicolors = true

vim.cmd("hi clear")

if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.g.colors_name = "yaru"

local highlights = {
  Normal = { fg = palette.fg, bg = backgrounds.main },
  NormalNC = { fg = palette.fg_dim, bg = backgrounds.main },
  NormalFloat = { fg = palette.fg, bg = backgrounds.float },
  FloatBorder = { fg = palette.aubergine, bg = backgrounds.float },
  FloatTitle = { fg = palette.orange, bg = backgrounds.float, bold = true },
  WinSeparator = { fg = palette.border, bg = backgrounds.main },
  WinBar = { fg = palette.fg, bg = backgrounds.alt },
  WinBarNC = { fg = palette.fg_dim, bg = backgrounds.alt },
  SignColumn = { bg = backgrounds.gutter },
  FoldColumn = { bg = backgrounds.gutter, fg = palette.fg_dim },
  LineNr = { fg = palette.fg_dim },
  CursorLineNr = { fg = palette.orange, bold = true },
  CursorLine = { bg = palette.selection },
  CursorColumn = { bg = palette.selection },
  Cursor = { reverse = true },
  Visual = { bg = palette.aubergine_dark },
  Search = { fg = palette.bg, bg = palette.orange, bold = true },
  IncSearch = { fg = palette.bg, bg = palette.gold, bold = true },
  MatchParen = { fg = palette.orange, bold = true },
  Folded = { fg = palette.fg_dim, bg = backgrounds.alt, italic = true },
  Pmenu = { fg = palette.fg, bg = backgrounds.alt },
  PmenuSel = { fg = palette.bg, bg = palette.orange, bold = true },
  PmenuSbar = { bg = backgrounds.alt },
  PmenuThumb = { bg = palette.aubergine },
  QuickFixLine = { fg = palette.bg, bg = palette.teal, bold = true },
  StatusLine = { fg = palette.fg, bg = palette.aubergine_dark, bold = true },
  StatusLineNC = { fg = palette.fg_dim, bg = backgrounds.alt },
  TabLine = { fg = palette.fg_dim, bg = backgrounds.alt },
  TabLineSel = { fg = palette.bg, bg = palette.orange, bold = true },
  TabLineFill = { bg = backgrounds.main },
  VertSplit = { fg = palette.border },
  Directory = { fg = palette.teal, bold = true },
  Title = { fg = palette.orange, bold = true },
  Comment = { fg = palette.comment, italic = true },
  Constant = { fg = palette.gold },
  String = { fg = palette.green },
  Number = { fg = palette.gold },
  Boolean = { fg = palette.gold },
  Identifier = { fg = palette.teal },
  Function = { fg = palette.orange, bold = true },
  Statement = { fg = palette.aubergine, bold = true },
  Keyword = { fg = palette.aubergine, bold = true },
  Conditional = { fg = palette.aubergine },
  Operator = { fg = palette.orange },
  Type = { fg = palette.fg, bold = true },
  Special = { fg = palette.gold },
  PreProc = { fg = palette.teal },
  Error = { fg = palette.red, bold = true },
  Todo = { fg = palette.orange, bold = true },
  NonText = { fg = palette.border },
  Whitespace = { fg = palette.border },
  Conceal = { fg = palette.border },
  ColorColumn = { bg = palette.bg_alt },

  DiffAdd = { fg = palette.green },
  DiffChange = { fg = palette.gold },
  DiffDelete = { fg = palette.red },
  DiffText = { fg = palette.teal },

  DiagnosticError = { fg = palette.red },
  DiagnosticWarn = { fg = palette.gold },
  DiagnosticInfo = { fg = palette.teal },
  DiagnosticHint = { fg = palette.green },
  DiagnosticOk = { fg = palette.green },
  DiagnosticUnderlineError = { sp = palette.red, undercurl = true },
  DiagnosticUnderlineWarn = { sp = palette.gold, undercurl = true },
  DiagnosticUnderlineInfo = { sp = palette.teal, undercurl = true },
  DiagnosticUnderlineHint = { sp = palette.green, undercurl = true },
  DiagnosticVirtualTextError = { fg = palette.red, bg = backgrounds.alt },
  DiagnosticVirtualTextWarn = { fg = palette.gold, bg = backgrounds.alt },
  DiagnosticVirtualTextInfo = { fg = palette.teal, bg = backgrounds.alt },
  DiagnosticVirtualTextHint = { fg = palette.green, bg = backgrounds.alt },
  DiagnosticVirtualTextOk = { fg = palette.green, bg = backgrounds.alt },

  GitSignsAdd = { fg = palette.green },
  GitSignsChange = { fg = palette.gold },
  GitSignsDelete = { fg = palette.red },

  TelescopeNormal = { fg = palette.fg, bg = backgrounds.float },
  TelescopeBorder = { fg = palette.aubergine, bg = backgrounds.float },
  TelescopeSelection = { fg = palette.bg, bg = palette.orange },

  LspReferenceText = { bg = palette.selection },
  LspReferenceRead = { bg = palette.selection },
  LspReferenceWrite = { bg = palette.selection },
  LspSignatureActiveParameter = { fg = palette.bg, bg = palette.orange, bold = true },
  LspInlayHint = { fg = palette.fg_dim, bg = backgrounds.alt, italic = true },

  ["@comment"] = { link = "Comment" },
  ["@punctuation"] = { fg = palette.fg_dim },
  ["@punctuation.delimiter"] = { fg = palette.fg_dim },
  ["@punctuation.bracket"] = { fg = palette.fg_dim },
  ["@punctuation.special"] = { fg = palette.gold },
  ["@string"] = { link = "String" },
  ["@string.regex"] = { fg = palette.orange },
  ["@constant"] = { link = "Constant" },
  ["@constant.builtin"] = { fg = palette.orange },
  ["@variable"] = { fg = palette.fg },
  ["@variable.builtin"] = { fg = palette.orange },
  ["@parameter"] = { fg = palette.teal },
  ["@function"] = { link = "Function" },
  ["@function.builtin"] = { fg = palette.orange, bold = true },
  ["@keyword"] = { link = "Keyword" },
  ["@keyword.return"] = { fg = palette.aubergine, bold = true },
  ["@keyword.function"] = { fg = palette.aubergine, bold = true },
  ["@conditional"] = { link = "Conditional" },
  ["@type"] = { link = "Type" },
  ["@type.builtin"] = { fg = palette.teal, bold = true },
  ["@field"] = { fg = palette.teal },
  ["@property"] = { fg = palette.teal },
  ["@namespace"] = { fg = palette.orange },
  ["@operator"] = { link = "Operator" },

  IndentBlanklineChar = { fg = palette.border },
  IndentBlanklineContextChar = { fg = palette.aubergine },
  IndentBlanklineContextStart = { sp = palette.aubergine, underline = true },
}

for name, spec in pairs(highlights) do
  vim.api.nvim_set_hl(0, name, with_style(spec))
end

vim.g.terminal_color_0 = palette.bg
vim.g.terminal_color_1 = palette.red
vim.g.terminal_color_2 = palette.green
vim.g.terminal_color_3 = palette.gold
vim.g.terminal_color_4 = palette.teal
vim.g.terminal_color_5 = palette.aubergine
vim.g.terminal_color_6 = palette.orange
vim.g.terminal_color_7 = palette.fg
vim.g.terminal_color_8 = palette.border
vim.g.terminal_color_9 = palette.red
vim.g.terminal_color_10 = palette.green
vim.g.terminal_color_11 = palette.gold
vim.g.terminal_color_12 = palette.teal
vim.g.terminal_color_13 = palette.aubergine
vim.g.terminal_color_14 = palette.orange
vim.g.terminal_color_15 = palette.fg
