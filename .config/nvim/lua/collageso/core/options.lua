local opt = vim.opt

------------------------------------------------------------
-- Interface
------------------------------------------------------------

opt.number = true
opt.relativenumber = true

opt.termguicolors = true
opt.background = "dark"

opt.signcolumn = "yes"
opt.cursorline = true

opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8

------------------------------------------------------------
-- Indentation defaults
------------------------------------------------------------

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = -1
opt.expandtab = true
opt.smartindent = true

------------------------------------------------------------
-- Search
------------------------------------------------------------

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

------------------------------------------------------------
-- Windows
------------------------------------------------------------

opt.splitright = true
opt.splitbelow = true

------------------------------------------------------------
-- Editing
------------------------------------------------------------

opt.backspace = {
    "indent",
    "eol",
    "start",
}

opt.confirm = true
opt.undofile = true
opt.swapfile = false

------------------------------------------------------------
-- Timing
------------------------------------------------------------

opt.updatetime = 250
opt.timeoutlen = 400

------------------------------------------------------------
-- Clipboard
------------------------------------------------------------

opt.clipboard = "unnamedplus"

------------------------------------------------------------
-- Whitespace
------------------------------------------------------------

opt.list = true
vim.opt.list = false
opt.showmode = false
