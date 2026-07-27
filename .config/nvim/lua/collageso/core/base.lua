local group = vim.api.nvim_create_augroup(
    "CollagesoBase",
    { clear = true }
)

------------------------------------------------------------
-- Comments
------------------------------------------------------------

vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = "*",

    callback = function()
        vim.opt_local.formatoptions:remove({
            "c",
            "r",
            "o",
        })
    end,
})

------------------------------------------------------------
-- Yank highlight
------------------------------------------------------------

vim.api.nvim_create_autocmd("TextYankPost", {
    group = group,

    callback = function()
        vim.hl.on_yank({
            higroup = "Visual",
            timeout = 150,
        })
    end,
})

------------------------------------------------------------
-- Restore cursor position
------------------------------------------------------------

vim.api.nvim_create_autocmd("BufReadPost", {
    group = group,

    callback = function(event)
        local mark =
            vim.api.nvim_buf_get_mark(event.buf, '"')

        local line_count =
            vim.api.nvim_buf_line_count(event.buf)

        if mark[1] > 0 and mark[1] <= line_count then
            pcall(
                vim.api.nvim_win_set_cursor,
                0,
                mark
            )
        end
    end,
})

------------------------------------------------------------
-- Utility buffers
------------------------------------------------------------

vim.api.nvim_create_autocmd("FileType", {
    group = group,

    pattern = {
        "help",
        "checkhealth",
        "qf",
        "man",
        "lspinfo",
    },

    callback = function(event)
        vim.bo[event.buf].buflisted = false

        vim.keymap.set(
            "n",
            "q",
            "<cmd>close<CR>",
            {
                buffer = event.buf,
                silent = true,
            }
        )
    end,
})
