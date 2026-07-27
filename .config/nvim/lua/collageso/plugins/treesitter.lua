return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,

    build = ":TSUpdate",

    config = function()
        local treesitter = require("nvim-treesitter")

        treesitter.setup()

        local parsers = {
            "bash",
            "c",
            "cpp",
            "css",
            "c_sharp",
            "haskell",
            "html",
            "java",
            "javascript",
            "json",
            "lua",
            "markdown",
            "markdown_inline",
            "rust",
            "svelte",
            "toml",
            "tsx",
            "typescript",
            "vim",
            "vimdoc",
            "yaml",
            "zig",
        }

        treesitter.install(parsers)

        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                pcall(vim.treesitter.start)
            end,
        })
    end,
}
