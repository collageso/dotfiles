vim.cmd.highlight("clear")

if vim.fn.exists("syntax_on") == 1 then
    vim.cmd.syntax("reset")
end

vim.o.background = "dark"
vim.g.colors_name = "dark"

local palette = {
    none = "NONE",

    -- Backgrounds
    bg = "#0b0b0c",
    bg_dark = "#080809",
    bg_float = "#111214",
    bg_visual = "#1b1d20",
    bg_cursor = "#0f1012",

    -- Foregrounds
    fg = "#bac5cf",
    fg_soft = "#9ca9b4",
    fg_dim = "#697783",
    fg_dark = "#404c57",

    -- Syntax accents
    red = "#a9737c",
    orange = "#a88f7c",
    yellow = "#a99f7d",
    green = "#819b91",
    cyan = "#80a8ad",
    blue = "#7898b0",
    purple = "#918daa",

    -- UI
    border = "#292c30",
}

local function set(group, value)
    vim.api.nvim_set_hl(0, group, value)
end

------------------------------------------------------------
-- Editor
------------------------------------------------------------

set("Normal", {
    fg = palette.fg,
    bg = palette.none,
})

set("NormalNC", {
    fg = palette.fg_soft,
    bg = palette.none,
})

set("NormalFloat", {
    fg = palette.fg,
    bg = palette.bg_float,
})

set("FloatBorder", {
    fg = palette.border,
    bg = palette.bg_float,
})

set("FloatTitle", {
    fg = palette.blue,
    bg = palette.bg_float,
    bold = true,
})

set("CursorLine", {
    bg = palette.bg_cursor,
})

set("CursorLineNr", {
    fg = palette.blue,
    bold = true,
})

set("LineNr", {
    fg = palette.fg_dark,
})

set("LineNrAbove", {
    fg = palette.fg_dark,
})

set("LineNrBelow", {
    fg = palette.fg_dark,
})

set("SignColumn", {
    fg = palette.fg_dark,
    bg = palette.none,
})

set("FoldColumn", {
    fg = palette.fg_dark,
    bg = palette.none,
})

set("Folded", {
    fg = palette.fg_dim,
    bg = palette.bg_cursor,
})

set("Visual", {
    bg = palette.bg_visual,
})

set("VisualNOS", {
    bg = palette.bg_visual,
})

set("Search", {
    fg = palette.bg_dark,
    bg = palette.yellow,
})

set("IncSearch", {
    fg = palette.bg_dark,
    bg = palette.blue,
})

set("CurSearch", {
    fg = palette.bg_dark,
    bg = palette.cyan,
})

set("Substitute", {
    fg = palette.bg_dark,
    bg = palette.red,
})

set("Pmenu", {
    fg = palette.fg,
    bg = palette.bg_float,
})

set("PmenuSel", {
    fg = palette.bg_dark,
    bg = palette.blue,
})

set("PmenuSbar", {
    bg = palette.bg_visual,
})

set("PmenuThumb", {
    bg = palette.fg_dark,
})

set("PmenuKind", {
    fg = palette.cyan,
    bg = palette.bg_float,
})

set("PmenuExtra", {
    fg = palette.fg_dim,
    bg = palette.bg_float,
})

set("WinSeparator", {
    fg = palette.border,
})

set("VertSplit", {
    fg = palette.border,
})

set("StatusLine", {
    fg = palette.fg_soft,
    bg = palette.bg_dark,
})

set("StatusLineNC", {
    fg = palette.fg_dim,
    bg = palette.bg_dark,
})

set("WinBar", {
    fg = palette.fg_soft,
    bg = palette.bg_dark,
})

set("WinBarNC", {
    fg = palette.fg_dim,
    bg = palette.bg_dark,
})

set("TabLine", {
    fg = palette.fg_dim,
    bg = palette.bg_dark,
})

set("TabLineFill", {
    bg = palette.bg_dark,
})

set("TabLineSel", {
    fg = palette.cyan,
    bg = palette.bg_visual,
    bold = true,
})

set("MatchParen", {
    fg = palette.cyan,
    bold = true,
})

set("Whitespace", {
    fg = palette.fg_dark,
})

set("NonText", {
    fg = palette.fg_dark,
})

set("SpecialKey", {
    fg = palette.fg_dark,
})

set("EndOfBuffer", {
    fg = palette.bg,
})

set("Directory", {
    fg = palette.blue,
})

set("Title", {
    fg = palette.blue,
    bold = true,
})

set("Question", {
    fg = palette.cyan,
})

set("MoreMsg", {
    fg = palette.blue,
})

set("ModeMsg", {
    fg = palette.fg_soft,
    bold = true,
})

set("ErrorMsg", {
    fg = palette.red,
})

set("WarningMsg", {
    fg = palette.yellow,
})

set("QuickFixLine", {
    bg = palette.bg_visual,
    bold = true,
})

set("WildMenu", {
    fg = palette.bg_dark,
    bg = palette.blue,
})

------------------------------------------------------------
-- Syntax
------------------------------------------------------------

set("Comment", {
    fg = palette.fg_dim,
    italic = true,
})

set("Keyword", {
    fg = palette.purple,
})

set("Conditional", {
    fg = palette.purple,
})

set("Repeat", {
    fg = palette.purple,
})

set("Exception", {
    fg = palette.purple,
})

set("Statement", {
    fg = palette.purple,
})

set("Function", {
    fg = palette.blue,
})

set("String", {
    fg = palette.green,
})

set("Character", {
    fg = palette.green,
})

set("Number", {
    fg = palette.yellow,
})

set("Float", {
    fg = palette.yellow,
})

set("Boolean", {
    fg = palette.yellow,
})

set("Type", {
    fg = palette.cyan,
})

set("StorageClass", {
    fg = palette.cyan,
})

set("Structure", {
    fg = palette.cyan,
})

set("Typedef", {
    fg = palette.cyan,
})

set("Identifier", {
    fg = palette.fg,
})

set("Constant", {
    fg = palette.fg_soft,
})

set("Operator", {
    fg = palette.fg_dim,
})

set("PreProc", {
    fg = palette.purple,
})

set("Include", {
    fg = palette.purple,
})

set("Define", {
    fg = palette.purple,
})

set("Macro", {
    fg = palette.purple,
})

set("Special", {
    fg = palette.cyan,
})

set("SpecialChar", {
    fg = palette.cyan,
})

set("Delimiter", {
    fg = palette.fg_dim,
})

set("Underlined", {
    fg = palette.blue,
    underline = true,
})

set("Error", {
    fg = palette.red,
})

set("Todo", {
    fg = palette.yellow,
    bold = true,
})

------------------------------------------------------------
-- Treesitter
------------------------------------------------------------

set("@comment", {
    link = "Comment",
})

set("@comment.documentation", {
    fg = palette.fg_dim,
    italic = true,
})

set("@comment.error", {
    fg = palette.red,
})

set("@comment.warning", {
    fg = palette.yellow,
})

set("@comment.todo", {
    fg = palette.yellow,
    bold = true,
})

set("@comment.note", {
    fg = palette.cyan,
})

set("@keyword", {
    link = "Keyword",
})

set("@keyword.function", {
    fg = palette.purple,
})

set("@keyword.return", {
    fg = palette.purple,
    italic = true,
})

set("@keyword.conditional", {
    link = "Conditional",
})

set("@keyword.repeat", {
    link = "Repeat",
})

set("@keyword.exception", {
    link = "Exception",
})

set("@keyword.import", {
    fg = palette.purple,
})

set("@keyword.operator", {
    fg = palette.purple,
})

set("@conditional", {
    link = "Conditional",
})

set("@repeat", {
    link = "Repeat",
})

set("@function", {
    link = "Function",
})

set("@function.call", {
    fg = palette.blue,
})

set("@function.method", {
    fg = palette.blue,
})

set("@function.method.call", {
    fg = palette.blue,
})

set("@function.builtin", {
    fg = palette.cyan,
})

set("@function.macro", {
    fg = palette.purple,
})

set("@constructor", {
    fg = palette.cyan,
})

set("@string", {
    link = "String",
})

set("@string.documentation", {
    fg = palette.green,
})

set("@string.escape", {
    fg = palette.cyan,
})

set("@string.regexp", {
    fg = palette.cyan,
})

set("@character", {
    link = "Character",
})

set("@number", {
    link = "Number",
})

set("@number.float", {
    link = "Float",
})

set("@boolean", {
    link = "Boolean",
})

set("@type", {
    link = "Type",
})

set("@type.builtin", {
    fg = palette.cyan,
    italic = true,
})

set("@type.definition", {
    fg = palette.cyan,
})

set("@type.qualifier", {
    fg = palette.purple,
})

set("@variable", {
    fg = palette.fg,
})

set("@variable.parameter", {
    fg = palette.fg_soft,
})

set("@variable.member", {
    fg = palette.fg_soft,
})

set("@variable.builtin", {
    fg = palette.fg_soft,
    italic = true,
})

set("@constant", {
    link = "Constant",
})

set("@constant.builtin", {
    fg = palette.yellow,
})

set("@constant.macro", {
    fg = palette.yellow,
})

set("@property", {
    fg = palette.fg_soft,
})

set("@field", {
    fg = palette.fg_soft,
})

set("@operator", {
    link = "Operator",
})

set("@punctuation.delimiter", {
    fg = palette.fg_dim,
})

set("@punctuation.bracket", {
    fg = palette.fg_dim,
})

set("@punctuation.special", {
    fg = palette.cyan,
})

set("@module", {
    fg = palette.purple,
})

set("@module.builtin", {
    fg = palette.purple,
    italic = true,
})

set("@namespace", {
    fg = palette.purple,
})

set("@tag", {
    fg = palette.blue,
})

set("@tag.attribute", {
    fg = palette.cyan,
})

set("@tag.delimiter", {
    fg = palette.fg_dim,
})

set("@markup.heading", {
    fg = palette.blue,
    bold = true,
})

set("@markup.strong", {
    bold = true,
})

set("@markup.italic", {
    italic = true,
})

set("@markup.link", {
    fg = palette.cyan,
})

set("@markup.link.url", {
    fg = palette.blue,
    underline = true,
})

set("@markup.raw", {
    fg = palette.green,
})

set("@markup.list", {
    fg = palette.blue,
})

------------------------------------------------------------
-- LSP semantic tokens
------------------------------------------------------------

set("@lsp.type.class", {
    link = "@type",
})

set("@lsp.type.interface", {
    link = "@type",
})

set("@lsp.type.enum", {
    link = "@type",
})

set("@lsp.type.enumMember", {
    link = "@constant",
})

set("@lsp.type.function", {
    link = "@function",
})

set("@lsp.type.method", {
    link = "@function.method",
})

set("@lsp.type.namespace", {
    link = "@module",
})

set("@lsp.type.parameter", {
    link = "@variable.parameter",
})

set("@lsp.type.property", {
    link = "@property",
})

set("@lsp.type.variable", {
    link = "@variable",
})

set("@lsp.type.keyword", {
    link = "@keyword",
})

set("@lsp.type.type", {
    link = "@type",
})

set("@lsp.type.typeParameter", {
    link = "@type",
})

set("@lsp.type.macro", {
    link = "@function.macro",
})

set("@lsp.type.string", {
    link = "@string",
})

set("@lsp.type.number", {
    link = "@number",
})

set("@lsp.type.operator", {
    link = "@operator",
})

set("@lsp.mod.deprecated", {
    strikethrough = true,
})

------------------------------------------------------------
-- Diagnostics
------------------------------------------------------------

set("DiagnosticError", {
    fg = palette.red,
})

set("DiagnosticWarn", {
    fg = palette.yellow,
})

set("DiagnosticInfo", {
    fg = palette.blue,
})

set("DiagnosticHint", {
    fg = palette.cyan,
})

set("DiagnosticUnnecessary", {
    fg = palette.fg_dark,
})

set("DiagnosticVirtualTextError", {
    fg = palette.red,
})

set("DiagnosticVirtualTextWarn", {
    fg = palette.yellow,
})

set("DiagnosticVirtualTextInfo", {
    fg = palette.blue,
})

set("DiagnosticVirtualTextHint", {
    fg = palette.cyan,
})

set("DiagnosticUnderlineError", {
    undercurl = true,
    sp = palette.red,
})

set("DiagnosticUnderlineWarn", {
    undercurl = true,
    sp = palette.yellow,
})

set("DiagnosticUnderlineInfo", {
    undercurl = true,
    sp = palette.blue,
})

set("DiagnosticUnderlineHint", {
    undercurl = true,
    sp = palette.cyan,
})

------------------------------------------------------------
-- LSP references
------------------------------------------------------------

set("LspReferenceText", {
    bg = palette.bg_visual,
})

set("LspReferenceRead", {
    bg = palette.bg_visual,
})

set("LspReferenceWrite", {
    bg = palette.bg_visual,
    underline = true,
})

set("LspSignatureActiveParameter", {
    fg = palette.cyan,
    bold = true,
})

set("LspCodeLens", {
    fg = palette.fg_dim,
})

set("LspInlayHint", {
    fg = palette.fg_dim,
    bg = palette.none,
})

------------------------------------------------------------
-- Git and diff
------------------------------------------------------------

set("DiffAdd", {
    fg = palette.green,
    bg = "#151b17",
})

set("DiffChange", {
    fg = palette.blue,
    bg = "#15191e",
})

set("DiffDelete", {
    fg = palette.red,
    bg = "#1c1417",
})

set("DiffText", {
    fg = palette.fg,
    bg = "#20262d",
})

set("Added", {
    fg = palette.green,
})

set("Changed", {
    fg = palette.blue,
})

set("Removed", {
    fg = palette.red,
})

set("GitSignsAdd", {
    fg = palette.green,
})

set("GitSignsChange", {
    fg = palette.blue,
})

set("GitSignsDelete", {
    fg = palette.red,
})

set("GitSignsCurrentLineBlame", {
    fg = palette.fg_dim,
})

------------------------------------------------------------
-- Telescope
------------------------------------------------------------

set("TelescopeNormal", {
    fg = palette.fg,
    bg = palette.bg_float,
})

set("TelescopeBorder", {
    fg = palette.border,
    bg = palette.bg_float,
})

set("TelescopePromptNormal", {
    fg = palette.fg,
    bg = palette.bg_float,
})

set("TelescopePromptBorder", {
    fg = palette.border,
    bg = palette.bg_float,
})

set("TelescopeResultsNormal", {
    fg = palette.fg_soft,
    bg = palette.bg_float,
})

set("TelescopePreviewNormal", {
    fg = palette.fg,
    bg = palette.bg_float,
})

set("TelescopeSelection", {
    bg = palette.bg_visual,
})

set("TelescopeMatching", {
    fg = palette.cyan,
    bold = true,
})

set("TelescopePromptPrefix", {
    fg = palette.blue,
})

set("TelescopeSelectionCaret", {
    fg = palette.blue,
})

set("TelescopeMultiSelection", {
    fg = palette.purple,
})

------------------------------------------------------------
-- Oil
------------------------------------------------------------

set("OilDir", {
    fg = palette.blue,
})

set("OilDirIcon", {
    fg = palette.blue,
})

set("OilLink", {
    fg = palette.cyan,
})

set("OilLinkTarget", {
    fg = palette.fg_dim,
})

set("OilCreate", {
    fg = palette.green,
})

set("OilDelete", {
    fg = palette.red,
})

set("OilMove", {
    fg = palette.yellow,
})

set("OilCopy", {
    fg = palette.blue,
})

set("OilChange", {
    fg = palette.purple,
})

set("OilPermissionRead", {
    fg = palette.yellow,
})

set("OilPermissionWrite", {
    fg = palette.red,
})

set("OilPermissionExecute", {
    fg = palette.green,
})

------------------------------------------------------------
-- Lazy and Mason
------------------------------------------------------------

set("LazyNormal", {
    fg = palette.fg,
    bg = palette.bg_float,
})

set("LazyButton", {
    fg = palette.fg_soft,
    bg = palette.bg_visual,
})

set("LazyButtonActive", {
    fg = palette.bg_dark,
    bg = palette.blue,
})

set("LazyH1", {
    fg = palette.bg_dark,
    bg = palette.blue,
    bold = true,
})

set("LazyH2", {
    fg = palette.blue,
    bold = true,
})

set("MasonNormal", {
    fg = palette.fg,
    bg = palette.bg_float,
})

set("MasonHeader", {
    fg = palette.bg_dark,
    bg = palette.blue,
    bold = true,
})

set("MasonHeaderSecondary", {
    fg = palette.bg_dark,
    bg = palette.purple,
    bold = true,
})

set("MasonHighlight", {
    fg = palette.blue,
})

set("MasonMuted", {
    fg = palette.fg_dim,
})

------------------------------------------------------------
-- Terminal colors
------------------------------------------------------------

vim.g.terminal_color_0 = palette.bg_dark
vim.g.terminal_color_1 = palette.red
vim.g.terminal_color_2 = palette.green
vim.g.terminal_color_3 = palette.yellow
vim.g.terminal_color_4 = palette.blue
vim.g.terminal_color_5 = palette.purple
vim.g.terminal_color_6 = palette.cyan
vim.g.terminal_color_7 = palette.fg

vim.g.terminal_color_8 = palette.fg_dark
vim.g.terminal_color_9 = "#b98189"
vim.g.terminal_color_10 = "#93ada2"
vim.g.terminal_color_11 = "#bbb087"
vim.g.terminal_color_12 = "#8baabd"
vim.g.terminal_color_13 = "#a29dbb"
vim.g.terminal_color_14 = "#93b9bd"
vim.g.terminal_color_15 = "#d4dde4"
