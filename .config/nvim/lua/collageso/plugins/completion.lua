return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local cmp = require("cmp")

            vim.opt.completeopt = {
                "menu",
                "menuone",
                "noselect",
            }

            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end,
                },

                completion = {
                    autocomplete = {
                        cmp.TriggerEvent.TextChanged,
                    },

                    keyword_length = 1,

                    completeopt =
                    "menu,menuone,noselect",
                },

                preselect =
                    cmp.PreselectMode.None,

                mapping =
                    cmp.mapping.preset.insert({
                        ["<C-j>"] =
                            cmp.mapping.select_next_item({
                                behavior =
                                    cmp.SelectBehavior.Select,
                            }),

                        ["<C-k>"] =
                            cmp.mapping.select_prev_item({
                                behavior =
                                    cmp.SelectBehavior.Select,
                            }),

                        ["<CR>"] =
                            cmp.mapping.confirm({
                                select = false,
                            }),

                        ["<C-e>"] =
                            cmp.mapping.abort(),

                        ["<C-Space>"] =
                            cmp.mapping.complete(),

                        ["<C-u>"] =
                            cmp.mapping.scroll_docs(-4),

                        ["<C-d>"] =
                            cmp.mapping.scroll_docs(4),
                    }),

                sources = cmp.config.sources({
                    {
                        name = "nvim_lsp",
                    },
                }),

                window = {
                    completion =
                        cmp.config.window.bordered(),

                    documentation =
                        cmp.config.window.bordered(),
                },

                formatting = {
                    fields = {
                        "kind",
                        "abbr",
                        "menu",
                    },

                    format = function(entry, item)
                        local kinds = {
                            Text = "󰉿",
                            Method = "󰆧",
                            Function = "󰊕",
                            Constructor = "",
                            Field = "󰜢",
                            Variable = "󰀫",
                            Class = "󰠱",
                            Interface = "",
                            Module = "",
                            Property = "󰜢",
                            Unit = "󰑭",
                            Value = "󰎠",
                            Enum = "",
                            Keyword = "󰌋",
                            Snippet = "",
                            Color = "󰏘",
                            File = "󰈙",
                            Reference = "󰈇",
                            Folder = "󰉋",
                            EnumMember = "",
                            Constant = "󰏿",
                            Struct = "󰙅",
                            Event = "",
                            Operator = "󰆕",
                            TypeParameter = "󰬛",
                        }

                        item.kind =
                            string.format(
                                "%s %s",
                                kinds[item.kind] or "",
                                item.kind
                            )

                        if entry.source.name ==
                            "nvim_lsp"
                        then
                            item.menu = "[LSP]"
                        else
                            item.menu = ""
                        end

                        return item
                    end,
                },

                experimental = {
                    ghost_text = false,
                },
            })
        end,
    },
}
