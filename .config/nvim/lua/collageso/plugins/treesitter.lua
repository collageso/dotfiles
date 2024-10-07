return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		-- configure treesitter
		treesitter.setup({ -- enable syntax highlighting
			highlight = {
				enable = true,
			},
			-- enable indentation
			indent = { enable = true },
			-- ensure these language parsers are installed
			ensure_installed = {
				"astro",
				"bash",
				"css",
				"scss",
				"sql",
				"dockerfile",
				"gitignore",
				"json",
				"go",
				"rust",
				"c",
				"cpp",
				"java",
				"http",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"xml",
				"html",
				"markdown",
				"markdown_inline",
				"regex",
				"svelte",
				"graphql",
				"lua",
				"sql",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
