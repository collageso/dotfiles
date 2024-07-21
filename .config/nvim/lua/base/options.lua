-- Leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Encoding settings
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- UI settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

-- Indentation settings
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Wrapping and mouse settings
vim.opt.wrap = false
vim.opt.mouse = 'a'

-- Display settings
vim.opt.showmode = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true
vim.opt.background = 'dark'
vim.opt.signcolumn = 'yes'
vim.opt.scrolloff = 10

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- File and buffer settings
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Split settings
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Command settings
vim.opt.inccommand = 'split'

-- Backspace behaviro
vim.opt.backspace = { 'start', 'eol', 'indent' }

-- Path and ignore settings
vim.opt.path:append { '**' }
vim.opt.wildignore:append { '*/node_modules/*' }
