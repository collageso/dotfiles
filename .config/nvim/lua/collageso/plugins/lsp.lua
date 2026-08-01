local servers = {
    lua_ls = {
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT",
                },

                workspace = {
                    checkThirdParty = false,
                },

                telemetry = {
                    enable = false,
                },
            },
        },
    },

    clangd = {
        cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=never",
        },

        root_markers = {
            {
                "Makefile",
                "CMakeLists.txt",
            },

            ".git",
        },

        before_init = function(params, config)
            local root_dir = config.root_dir

            if not root_dir then
                return
            end

            params.initializationOptions =
                vim.tbl_deep_extend(
                    "force",
                    params.initializationOptions or {},
                    {
                        fallbackFlags = {
                            "-I" .. root_dir .. "/include",
                        },
                    }
                )
        end,
    },

    rust_analyzer = {
        settings = {
            ["rust-analyzer"] = {
                cargo = {
                    features = "all",
                },

                check = {
                    command = "clippy",
                },
            },
        },
    },

    zls = {
        settings = {
            zls = {
                enable_snippets = false,
                enable_inlay_hints = false,
                warn_style = true,
            },
        },
    },

    hls = {
        settings = {
            haskell = {
                formattingProvider = "ormolu",
            },
        },
    },

    ts_ls = {
        settings = {
            typescript = {
                preferences = {
                    includeCompletionsForModuleExports = true,
                    includeCompletionsForImportStatements = true,
                },
            },

            javascript = {
                preferences = {
                    includeCompletionsForModuleExports = true,
                    includeCompletionsForImportStatements = true,
                },
            },
        },
    },

    eslint = {
        settings = {
            workingDirectory = {
                mode = "auto",
            },

            format = false,

            codeActionOnSave = {
                enable = false,
            },
        },
    },

    html = {},

    cssls = {},

    tailwindcss = {
        filetypes = {
            "html",
            "css",
            "scss",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "svelte",
        },
    },

    svelte = {},

    angularls = {
        root_markers = {
            "angular.json",
            "project.json",
        },
    },

    jdtls = {
        settings = {
            java = {
                completion = {
                    enabled = true,
                },

                saveActions = {
                    organizeImports = false,
                },

                format = {
                    enabled = true,
                },
            },
        },
    },
}

local server_names =
    vim.tbl_keys(servers)

return {
    {
        "neovim/nvim-lspconfig",

        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {},
            },
        },

        config = function()
            ----------------------------------------------------
            -- Diagnostics
            ----------------------------------------------------

            vim.diagnostic.config({
                severity_sort = true,
                update_in_insert = false,
                underline = true,

                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = " ",
                        [vim.diagnostic.severity.WARN] = " ",
                        [vim.diagnostic.severity.INFO] = " ",
                        [vim.diagnostic.severity.HINT] = "󰠠 ",
                    },
                },

                virtual_text = {
                    spacing = 2,
                    source = "if_many",
                },

                float = {
                    border = "rounded",
                    source = true,
                },
            })

            ----------------------------------------------------
            -- Configure servers
            ----------------------------------------------------

            for name, config in pairs(servers) do
                vim.lsp.config(name, config)
            end

            vim.lsp.enable(server_names)

            ----------------------------------------------------
            -- Attach behavior
            ----------------------------------------------------

            local group =
                vim.api.nvim_create_augroup(
                    "CollagesoLsp",
                    { clear = true }
                )

            vim.api.nvim_create_autocmd("LspAttach", {
                group = group,

                callback = function(event)
                    local bufnr = event.buf

                    local client =
                        vim.lsp.get_client_by_id(
                            event.data.client_id
                        )

                    if not client then
                        return
                    end

                    --------------------------------------------
                    -- LSP mappings
                    --------------------------------------------

                    local function map(
                        mode,
                        lhs,
                        rhs,
                        description
                    )
                        vim.keymap.set(
                            mode,
                            lhs,
                            rhs,
                            {
                                buffer = bufnr,
                                silent = true,
                                desc = description,
                            }
                        )
                    end

                    map(
                        "n",
                        "gD",
                        vim.lsp.buf.declaration,
                        "Go to declaration"
                    )

                    map(
                        "n",
                        "gd",
                        function()
                            require(
                                "telescope.builtin"
                            ).lsp_definitions()
                        end,
                        "Go to definition"
                    )

                    map(
                        "n",
                        "gR",
                        function()
                            require(
                                "telescope.builtin"
                            ).lsp_references()
                        end,
                        "Show references"
                    )

                    map(
                        "n",
                        "gi",
                        function()
                            require(
                                "telescope.builtin"
                            ).lsp_implementations()
                        end,
                        "Go to implementation"
                    )

                    map(
                        "n",
                        "gt",
                        function()
                            require(
                                "telescope.builtin"
                            ).lsp_type_definitions()
                        end,
                        "Go to type definition"
                    )

                    map(
                        "n",
                        "K",
                        vim.lsp.buf.hover,
                        "Hover documentation"
                    )

                    map(
                        "n",
                        "<leader>ls",
                        vim.lsp.buf.signature_help,
                        "Signature help"
                    )

                    map(
                        { "n", "v" },
                        "<leader>ca",
                        vim.lsp.buf.code_action,
                        "Code action"
                    )

                    map(
                        "n",
                        "<leader>rn",
                        vim.lsp.buf.rename,
                        "Rename symbol"
                    )

                    map(
                        "n",
                        "<leader>lr",
                        function()
                            local clients = vim.lsp.get_clients({ bufnr = bufnr })

                            for _, client in ipairs(clients) do
                                client:stop(true)
                                vim.defer_fn(function()
                                    vim.lsp.enable(client.name)
                                end, 100)
                            end
                        end,
                        "Restart LSP"
                    )

                    if client:supports_method(
                            "textDocument/inlayHint"
                        ) then
                        map(
                            "n",
                            "<leader>ih",
                            function()
                                local enabled =
                                    vim.lsp.inlay_hint
                                    .is_enabled({
                                        bufnr = bufnr,
                                    })

                                vim.lsp.inlay_hint
                                    .enable(
                                        not enabled,
                                        {
                                            bufnr = bufnr,
                                        }
                                    )
                            end,
                            "Toggle inlay hints"
                        )
                    end
                end,
            })
        end,
    },

    {
        "mason-org/mason.nvim",

        cmd = {
            "Mason",
            "MasonInstall",
            "MasonUpdate",
        },

        opts = {
            ui = {
                border = "rounded",
            },
        },
    },

    {
        "mason-org/mason-lspconfig.nvim",

        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },

        opts = {
            ensure_installed = server_names,
            automatic_enable = false,
        },
    },

    {
        "seblyng/roslyn.nvim",

        ft = {
            "cs",
            "razor",
        },

        opts = {
            filewatching = "auto",
            broad_search = true,
            lock_target = false,
        },

        config = function(_, opts)
            require("roslyn").setup(opts)

            vim.lsp.config("roslyn", {
                settings = {
                    ["csharp|completion"] = {
                        dotnet_provide_regex_completions =
                            true,

                        dotnet_show_completion_items_from_unimported_namespaces =
                            true,

                        dotnet_show_name_completion_suggestions =
                            true,
                    },

                    ["csharp|background_analysis"] = {
                        dotnet_analyzer_diagnostics_scope =
                        "fullSolution",

                        dotnet_compiler_diagnostics_scope =
                        "fullSolution",
                    },
                },
            })
        end,
    },
}
