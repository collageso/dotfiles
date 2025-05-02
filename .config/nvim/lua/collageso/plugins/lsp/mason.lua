return {
    "williamboman/mason-lspconfig.nvim",
	dependencies = {
	    "williamboman/mason.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"ts_ls",
				"astro",
				"angularls",
				"html",
				"cssls",
				"jdtls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"rust_analyzer",
				"gopls",
				"clangd",
				"hls",
			},
			automatic_installation = true,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"eslint_d",
				"codelldb",
				"js-debug-adapter",
				"goimports",
				"gofumpt",
				"java-debug-adapter",
				"java-test",
				"haskell-debug-adapter",
			},
		})
	end,
}
