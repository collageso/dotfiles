return {
    "stevearc/oil.nvim",

    lazy = false,

    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    keys = {
        {
            "-",
            "<cmd>Oil<CR>",
            desc = "Open parent directory",
        },

        {
            "<leader>ee",
            function()
                if vim.bo.filetype == "oil" then
                    vim.cmd("bdelete")
                else
                    vim.cmd("Oil")
                end
            end,
            desc = "Toggle Oil",
        },

        {
            "<leader>ef",
            function()
                require("oil").open(vim.fn.getcwd())
            end,
            desc = "Open project root",
        },
    },

    opts = {
        default_file_explorer = true,

        columns = {
            "icon",
        },

        skip_confirm_for_simple_edits = true,

        view_options = {
            show_hidden = true,
            natural_order = true,
        },

        win_options = {
            wrap = false,
            signcolumn = "no",
        },

        keymaps = {
            ["g?"] = {
                "actions.show_help",
                mode = "n",
            },

            ["<CR>"] = "actions.select",

            ["<C-v>"] = {
                "actions.select",
                opts = {
                    vertical = true,
                },
            },

            ["<C-x>"] = {
                "actions.select",
                opts = {
                    horizontal = true,
                },
            },

            ["<C-t>"] = {
                "actions.select",
                opts = {
                    tab = true,
                },
            },

            ["<C-p>"] = "actions.preview",
            ["<C-c>"] = "actions.close",
            ["<C-r>"] = "actions.refresh",

            ["-"] = "actions.parent",
            ["_"] = "actions.open_cwd",

            ["`"] = "actions.cd",

            ["~"] = {
                "actions.cd",
                opts = {
                    scope = "tab",
                },
            },

            ["gs"] = "actions.change_sort",
            ["gx"] = "actions.open_external",
            ["g."] = "actions.toggle_hidden",
        },
    },
}
