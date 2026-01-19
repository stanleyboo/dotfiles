-- Pinkwave colorscheme - matching Alacritty pink/purple theme
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "pinkwave"

local colors = {
  bg = "#2a1025",
  bg_light = "#3a1835",
  bg_lighter = "#5a3060",
  fg = "#f8eef8",
  fg_dim = "#d0c0d0",
  pink = "#e8a0d0",
  pink_light = "#f0c0e0",
  pink_bright = "#f090c0",
  purple = "#c8a0d8",
  purple_light = "#d8c0e8",
  lavender = "#d8b0e0",
  magenta = "#e0b8e8",
  rose = "#e8a0b8",
  coral = "#f0b8d0",
  white = "#ffffff",
  gray = "#6a5070",
  red = "#ff90b0",
  green = "#d8b0e0",
  yellow = "#f0c0d0",
  blue = "#c8a0d8",
  cyan = "#d0a0c8",
  none = "NONE",
}

local hl = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Editor
hl("Normal", { fg = colors.fg, bg = colors.bg })
hl("NormalFloat", { fg = colors.fg, bg = colors.bg_light })
hl("FloatBorder", { fg = colors.pink, bg = colors.bg_light })
hl("Cursor", { fg = colors.bg, bg = colors.pink })
hl("CursorLine", { bg = colors.bg_light })
hl("CursorColumn", { bg = colors.bg_light })
hl("ColorColumn", { bg = colors.bg_light })
hl("LineNr", { fg = colors.gray })
hl("CursorLineNr", { fg = colors.pink, bold = true })
hl("VertSplit", { fg = colors.bg_lighter })
hl("WinSeparator", { fg = colors.bg_lighter })
hl("SignColumn", { bg = colors.bg })
hl("Folded", { fg = colors.fg_dim, bg = colors.bg_light })
hl("FoldColumn", { fg = colors.gray, bg = colors.bg })
hl("NonText", { fg = colors.gray })
hl("SpecialKey", { fg = colors.gray })
hl("Whitespace", { fg = colors.bg_lighter })
hl("EndOfBuffer", { fg = colors.bg })

-- Search
hl("Search", { fg = colors.bg, bg = colors.pink })
hl("IncSearch", { fg = colors.bg, bg = colors.pink_bright })
hl("CurSearch", { fg = colors.bg, bg = colors.pink_bright })

-- Selection
hl("Visual", { bg = colors.bg_lighter })
hl("VisualNOS", { bg = colors.bg_lighter })

-- Pmenu
hl("Pmenu", { fg = colors.fg, bg = colors.bg_light })
hl("PmenuSel", { fg = colors.bg, bg = colors.pink })
hl("PmenuSbar", { bg = colors.bg_lighter })
hl("PmenuThumb", { bg = colors.pink })

-- Statusline
hl("StatusLine", { fg = colors.fg, bg = colors.bg_light })
hl("StatusLineNC", { fg = colors.fg_dim, bg = colors.bg_light })
hl("WildMenu", { fg = colors.bg, bg = colors.pink })

-- Tabline
hl("TabLine", { fg = colors.fg_dim, bg = colors.bg_light })
hl("TabLineFill", { bg = colors.bg })
hl("TabLineSel", { fg = colors.fg, bg = colors.bg, bold = true })

-- Diff
hl("DiffAdd", { fg = colors.green, bg = colors.bg_light })
hl("DiffChange", { fg = colors.yellow, bg = colors.bg_light })
hl("DiffDelete", { fg = colors.red, bg = colors.bg_light })
hl("DiffText", { fg = colors.pink_bright, bg = colors.bg_lighter })

-- Messages
hl("ErrorMsg", { fg = colors.red })
hl("WarningMsg", { fg = colors.yellow })
hl("MoreMsg", { fg = colors.pink })
hl("ModeMsg", { fg = colors.pink, bold = true })
hl("Question", { fg = colors.pink })

-- Spelling
hl("SpellBad", { undercurl = true, sp = colors.red })
hl("SpellCap", { undercurl = true, sp = colors.yellow })
hl("SpellLocal", { undercurl = true, sp = colors.pink })
hl("SpellRare", { undercurl = true, sp = colors.purple })

-- Syntax
hl("Comment", { fg = colors.gray, italic = true })
hl("Constant", { fg = colors.pink_light })
hl("String", { fg = colors.lavender })
hl("Character", { fg = colors.lavender })
hl("Number", { fg = colors.pink_light })
hl("Boolean", { fg = colors.pink_light })
hl("Float", { fg = colors.pink_light })
hl("Identifier", { fg = colors.fg })
hl("Function", { fg = colors.pink })
hl("Statement", { fg = colors.purple })
hl("Conditional", { fg = colors.purple })
hl("Repeat", { fg = colors.purple })
hl("Label", { fg = colors.purple })
hl("Operator", { fg = colors.rose })
hl("Keyword", { fg = colors.purple })
hl("Exception", { fg = colors.purple })
hl("PreProc", { fg = colors.pink })
hl("Include", { fg = colors.purple })
hl("Define", { fg = colors.pink })
hl("Macro", { fg = colors.pink })
hl("PreCondit", { fg = colors.pink })
hl("Type", { fg = colors.magenta })
hl("StorageClass", { fg = colors.purple })
hl("Structure", { fg = colors.magenta })
hl("Typedef", { fg = colors.magenta })
hl("Special", { fg = colors.rose })
hl("SpecialChar", { fg = colors.rose })
hl("Tag", { fg = colors.pink })
hl("Delimiter", { fg = colors.fg_dim })
hl("SpecialComment", { fg = colors.gray, italic = true })
hl("Debug", { fg = colors.red })
hl("Underlined", { underline = true })
hl("Ignore", { fg = colors.gray })
hl("Error", { fg = colors.red })
hl("Todo", { fg = colors.bg, bg = colors.pink, bold = true })
hl("Title", { fg = colors.pink, bold = true })
hl("Directory", { fg = colors.purple })
hl("MatchParen", { fg = colors.pink_bright, bold = true })

-- Treesitter
hl("@variable", { fg = colors.fg })
hl("@variable.builtin", { fg = colors.rose })
hl("@variable.parameter", { fg = colors.coral })
hl("@constant", { fg = colors.pink_light })
hl("@constant.builtin", { fg = colors.pink_light })
hl("@module", { fg = colors.purple_light })
hl("@string", { fg = colors.lavender })
hl("@string.escape", { fg = colors.rose })
hl("@character", { fg = colors.lavender })
hl("@number", { fg = colors.pink_light })
hl("@boolean", { fg = colors.pink_light })
hl("@function", { fg = colors.pink })
hl("@function.builtin", { fg = colors.pink })
hl("@function.method", { fg = colors.pink })
hl("@constructor", { fg = colors.magenta })
hl("@keyword", { fg = colors.purple })
hl("@keyword.function", { fg = colors.purple })
hl("@keyword.return", { fg = colors.purple })
hl("@keyword.operator", { fg = colors.rose })
hl("@operator", { fg = colors.rose })
hl("@type", { fg = colors.magenta })
hl("@type.builtin", { fg = colors.magenta })
hl("@property", { fg = colors.coral })
hl("@attribute", { fg = colors.purple })
hl("@tag", { fg = colors.pink })
hl("@tag.attribute", { fg = colors.coral })
hl("@tag.delimiter", { fg = colors.fg_dim })
hl("@punctuation", { fg = colors.fg_dim })
hl("@punctuation.bracket", { fg = colors.fg_dim })
hl("@punctuation.delimiter", { fg = colors.fg_dim })
hl("@comment", { fg = colors.gray, italic = true })

-- LSP
hl("DiagnosticError", { fg = colors.red })
hl("DiagnosticWarn", { fg = colors.yellow })
hl("DiagnosticInfo", { fg = colors.purple })
hl("DiagnosticHint", { fg = colors.pink })
hl("DiagnosticUnderlineError", { undercurl = true, sp = colors.red })
hl("DiagnosticUnderlineWarn", { undercurl = true, sp = colors.yellow })
hl("DiagnosticUnderlineInfo", { undercurl = true, sp = colors.purple })
hl("DiagnosticUnderlineHint", { undercurl = true, sp = colors.pink })
hl("LspReferenceText", { bg = colors.bg_lighter })
hl("LspReferenceRead", { bg = colors.bg_lighter })
hl("LspReferenceWrite", { bg = colors.bg_lighter })

-- Git
hl("GitSignsAdd", { fg = colors.green })
hl("GitSignsChange", { fg = colors.purple })
hl("GitSignsDelete", { fg = colors.red })

-- Telescope
hl("TelescopeBorder", { fg = colors.pink })
hl("TelescopePromptBorder", { fg = colors.pink })
hl("TelescopeResultsBorder", { fg = colors.purple })
hl("TelescopePreviewBorder", { fg = colors.purple })
hl("TelescopeSelection", { bg = colors.bg_lighter })
hl("TelescopeMatching", { fg = colors.pink_bright, bold = true })

-- NeoTree
hl("NeoTreeNormal", { fg = colors.fg, bg = colors.bg })
hl("NeoTreeNormalNC", { fg = colors.fg, bg = colors.bg })
hl("NeoTreeDirectoryIcon", { fg = colors.purple })
hl("NeoTreeDirectoryName", { fg = colors.purple })
hl("NeoTreeRootName", { fg = colors.pink, bold = true })
hl("NeoTreeGitAdded", { fg = colors.green })
hl("NeoTreeGitModified", { fg = colors.purple })
hl("NeoTreeGitDeleted", { fg = colors.red })

-- Indent Blankline
hl("IblIndent", { fg = colors.bg_lighter })
hl("IblScope", { fg = colors.pink })

-- Which-key
hl("WhichKey", { fg = colors.pink })
hl("WhichKeyGroup", { fg = colors.purple })
hl("WhichKeyDesc", { fg = colors.fg })
hl("WhichKeySeparator", { fg = colors.gray })

-- Notify
hl("NotifyBackground", { bg = colors.bg })
hl("NotifyERRORBorder", { fg = colors.red })
hl("NotifyWARNBorder", { fg = colors.yellow })
hl("NotifyINFOBorder", { fg = colors.pink })
hl("NotifyDEBUGBorder", { fg = colors.gray })
hl("NotifyTRACEBorder", { fg = colors.purple })
hl("NotifyERRORIcon", { fg = colors.red })
hl("NotifyWARNIcon", { fg = colors.yellow })
hl("NotifyINFOIcon", { fg = colors.pink })
hl("NotifyDEBUGIcon", { fg = colors.gray })
hl("NotifyTRACEIcon", { fg = colors.purple })
hl("NotifyERRORTitle", { fg = colors.red })
hl("NotifyWARNTitle", { fg = colors.yellow })
hl("NotifyINFOTitle", { fg = colors.pink })
hl("NotifyDEBUGTitle", { fg = colors.gray })
hl("NotifyTRACETitle", { fg = colors.purple })

-- Mini
hl("MiniStatuslineFilename", { fg = colors.fg, bg = colors.bg_light })
hl("MiniStatuslineFileinfo", { fg = colors.fg, bg = colors.bg_light })
hl("MiniStatuslineDevinfo", { fg = colors.fg, bg = colors.bg_lighter })
hl("MiniStatuslineModeNormal", { fg = colors.bg, bg = colors.pink, bold = true })
hl("MiniStatuslineModeInsert", { fg = colors.bg, bg = colors.purple, bold = true })
hl("MiniStatuslineModeVisual", { fg = colors.bg, bg = colors.magenta, bold = true })
hl("MiniStatuslineModeReplace", { fg = colors.bg, bg = colors.red, bold = true })
hl("MiniStatuslineModeCommand", { fg = colors.bg, bg = colors.rose, bold = true })
