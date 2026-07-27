vim.cmd.highlight("clear")

if vim.fn.exists("syntax_on") == 1 then
    vim.cmd.syntax("reset")
end

vim.g.colors_name = "dark"

local palette = {
    none = "NONE",

    bg = "#181513",
    bg_dark = "#12100f",
    bg_float = "#201c19",
    bg_visual = "#372b23",

    fg = "#d4c5b4",
    fg_dim = "#8f8176",
    fg_dark = "#5b4a47",

    red = "#c46c62",
    orange = "#d08b5b",
    yellow = "#c8a96b",
    green = "#84966b",
    cyan = "#779b91",
    blue = "#728ca3",
    purple = "#9a7e9c",

    border = "#493d36",
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
    fg = palette.fg,
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
    bg = "#211d1a",
})

set("CursorLineNr", {
    fg = palette.orange,
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
    fg = palette.bg,
    bg = palette.yellow,
})

set("IncSearch", {
    fg = palette.bg,
    bg = palette.orange,
})

set("Pmenu", {
    fg = palette.fg,
    bg = palette.bg_float,
})

set("PmenuSel", {
    fg = palette.bg,
    bg = palette.orange,
})

set("WinSeparator", {
    fg = palette.border,
})

set("StatusLine", {
    fg = palette.fg,
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
    italic = true,
})

set("Conditional", {
    fg = palette.purple,
    italic = true,
})

set("Repeat", {
    fg = palette.purple,
    italic = true,
})

set("Function", {
    fg = palette.orange,
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
    fg = palette.yellow,
})

set("Operator", {
    fg = palette.fg_dim,
})

set("PreProc", {
    fg = palette.red,
})

set("Special", {
    fg = palette.blue,
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
    italic = true,
})

set("@function", {
    link = "Function",
})

set("@function.call", {
    fg = palette.orange,
})

set("@constructor", {
    fg = palette.cyan,
})

set("@string", {
    link = "String",
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
    fg = palette.red,
    italic = true,
})

set("@constant", {
    link = "Constant",
})

set("@property", {
    fg = palette.blue,
})

set("@tag", {
    fg = palette.red,
})

set("@tag.attribute", {
    fg = palette.yellow,
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
    bg = "#20271d",
})

set("DiffChange", {
    fg = palette.yellow,
    bg = "#29251c",
})

set("DiffDelete", {
    fg = palette.red,
    bg = "#2a1d1b",
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
    bold = true,
})

set("TelescopeMatching", {
    fg = palette.orange,
    bold = true,
})
