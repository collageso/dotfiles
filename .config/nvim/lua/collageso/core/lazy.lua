local lazy_path =
    vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazy_path) then
    local output = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        "https://github.com/folke/lazy.nvim.git",
        lazy_path,
    })

    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            {
                "Failed to clone lazy.nvim:\n",
                "ErrorMsg",
            },
            {
                output,
                "WarningMsg",
            },
        }, true, {})

        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazy_path)

require("lazy").setup({
    {
        import = "collageso.plugins",
    },
}, {
    checker = {
        enabled = false,
    },

    change_detection = {
        notify = false,
    },

    ui = {
        border = "rounded",
    },

    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
