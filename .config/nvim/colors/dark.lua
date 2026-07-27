vim.cmd.highlight("clear")

if vim.fn.exists("syntax_on") == 1 then
    vim.cmd.syntax("reset")
end

vim.g.colors_name = "blue-dusk"

local palette = {
    none = "NONE",

    -- Backgrounds
    bg = "#0f1318",
    bg_dark = "#0b0e12",
    bg_float = "#161c23",
    bg_visual = "#242d37",
    bg_cursor = "#12171d",

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
    border = "#2d3944",
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

set("SignColumn", {
    bg = palette.none,
})

set("Visual", {
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

set("Pmenu", {
    fg = palette.fg,
    bg = palette.bg_float,
})

set("PmenuSel", {
    fg = palette.bg_dark,
    bg = palette.blue,
})

set("WinSeparator", {
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

set("Boolean", {
    fg = palette.yellow,
})

set("Type", {
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

set("Special", {
    fg = palette.cyan,
})

set("Delimiter", {
    fg = palette.fg_dim,
})

------------------------------------------------------------
-- Treesitter
------------------------------------------------------------

set("@comment", {
    link = "Comment",
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

set("@function.builtin", {
    fg = palette.cyan,
})

set("@constructor", {
    fg = palette.cyan,
})

set("@string", {
    link = "String",
})

set("@character", {
    link = "Character",
})

set("@number", {
    link = "Number",
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

set("@variable", {
    fg = palette.fg,
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

set("@tag", {
    fg = palette.blue,
})

set("@tag.attribute", {
    fg = palette.cyan,
})

set("@tag.delimiter", {
    fg = palette.fg_dim,
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
-- Git
------------------------------------------------------------

set("DiffAdd", {
    fg = palette.green,
    bg = "#192520",
})

set("DiffChange", {
    fg = palette.blue,
    bg = "#1b252f",
})

set("DiffDelete", {
    fg = palette.red,
    bg = "#281c21",
})

set("DiffText", {
    fg = palette.fg,
    bg = "#263647",
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
