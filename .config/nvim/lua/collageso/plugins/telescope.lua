return {
    "nvim-telescope/telescope.nvim",

    cmd = "Telescope",

    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",

        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",

            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
    },

    keys = {
        {
            "<leader>ff",
            function()
                require("telescope.builtin").find_files({
                    hidden = true,
                })
            end,
            desc = "Find files",
        },

        {
            "<leader>fr",
            function()
                require("telescope.builtin").oldfiles()
            end,
            desc = "Recent files",
        },

        {
            "<leader>fs",
            function()
                require("telescope.builtin").live_grep()
            end,
            desc = "Search text",
        },

        {
            "<leader>fc",
            function()
                require("telescope.builtin").grep_string()
            end,
            desc = "Search word under cursor",
        },

        {
            "<leader>fb",
            function()
                require("telescope.builtin").buffers({
                    sort_mru = true,
                    ignore_current_buffer = true,
                })
            end,
            desc = "Find buffers",
        },

        {
            "<leader>fh",
            function()
                require("telescope.builtin").help_tags()
            end,
            desc = "Search help",
        },

        {
            "<leader>fd",
            function()
                require("telescope.builtin").diagnostics()
            end,
            desc = "Search diagnostics",
        },
    },

    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                prompt_prefix = "   ",
                selection_caret = "  ",
                path_display = {
                    "smart",
                },

                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-q>"] = actions.smart_send_to_qflist
                            + actions.open_qflist,
                        ["<Esc>"] = actions.close,
                    },

                    n = {
                        ["j"] = actions.move_selection_next,
                        ["k"] = actions.move_selection_previous,
                        ["q"] = actions.close,
                        ["<C-q>"] = actions.smart_send_to_qflist
                            + actions.open_qflist,
                    },
                },
            },

            pickers = {
                find_files = {
                    hidden = true,
                },

                buffers = {
                    sort_mru = true,
                    ignore_current_buffer = true,
                },
            },
        })

        pcall(telescope.load_extension, "fzf")
    end,
}
