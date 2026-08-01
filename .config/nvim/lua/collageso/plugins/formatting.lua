return {
    "stevearc/conform.nvim",

    event = {
        "BufReadPre",
        "BufNewFile",
    },

    cmd = "ConformInfo",

    keys = {
        {
            "<leader>lf",

            function()
                require("conform").format({
                    async = false,
                    lsp_format = "fallback",
                    timeout_ms = 5000,
                })
            end,

            desc = "Format buffer",
        },
    },

    opts = {
        notify_on_error = true,
        notify_no_formatters = true,

        formatters = {
            clang_format = {
                append_args = {
                    "--style={BasedOnStyle: LLVM, AllowShortFunctionsOnASingleLine: None}",
                },
            },
        },

        format_on_save = function(bufnr)
            if vim.bo[bufnr].buftype ~= "" then
                return
            end

            if not vim.bo[bufnr].modifiable then
                return
            end

            return {
                async = false,
                lsp_format = "fallback",
                timeout_ms = 5000,
            }
        end,

        formatters_by_ft = {
            lua = {
                "stylua",
            },

            c = {
                "clang_format",
            },

            cpp = {
                "clang_format",
            },

            rust = {
                "rustfmt",
            },

            zig = {
                "zigfmt",
            },

            haskell = {
                "ormolu",
            },

            javascript = {
                "prettier",
            },

            javascriptreact = {
                "prettier",
            },

            typescript = {
                "prettier",
            },

            typescriptreact = {
                "prettier",
            },

            svelte = {
                "prettier",
            },

            html = {
                "prettier",
            },

            css = {
                "prettier",
            },

            scss = {
                "prettier",
            },

            json = {
                "prettier",
            },

            yaml = {
                "prettier",
            },

            markdown = {
                "prettier",
            },

            java = {
                "google_java_format",
            },

            -- C# uses the Roslyn LSP fallback.
        },
    },
}
