vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set

------------------------------------------------------------
-- Editing
------------------------------------------------------------

map("i", "jk", "<Esc>", {
    desc = "Exit insert mode",
})

map("n", "<leader>nh", "<cmd>nohlsearch<CR>", {
    desc = "Clear search highlights",
})

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

------------------------------------------------------------
-- Visual mode
------------------------------------------------------------

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("v", "<", "<gv")
map("v", ">", ">gv")

------------------------------------------------------------
-- Window navigation
------------------------------------------------------------

map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

------------------------------------------------------------
-- Window resizing
------------------------------------------------------------

map("n", "<C-Up>", "<cmd>resize +2<CR>")
map("n", "<C-Down>", "<cmd>resize -2<CR>")
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>")
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>")

------------------------------------------------------------
-- Buffers
------------------------------------------------------------

map("n", "<leader>bn", "<cmd>bnext<CR>", {
    desc = "Next buffer",
})

map("n", "<leader>bp", "<cmd>bprevious<CR>", {
    desc = "Previous buffer",
})

map("n", "<leader>bd", "<cmd>bdelete<CR>", {
    desc = "Delete buffer",
})

------------------------------------------------------------
-- Diagnostics
------------------------------------------------------------

map("n", "]d", function()
    vim.diagnostic.jump({
        count = 1,
        float = true,
    })
end, {
    desc = "Next diagnostic",
})

map("n", "[d", function()
    vim.diagnostic.jump({
        count = -1,
        float = true,
    })
end, {
    desc = "Previous diagnostic",
})

map("n", "<leader>dl", vim.diagnostic.open_float, {
    desc = "Line diagnostics",
})

map("n", "<leader>dq", function()
    vim.diagnostic.setqflist({
        open = true,
    })
end, {
    desc = "Diagnostics to quickfix",
})
