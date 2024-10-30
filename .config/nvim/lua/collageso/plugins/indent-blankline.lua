return {
	"lukas-reineke/indent-blankline.nvim",
	tag = "v3.8.2",
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl",
	--@module "ibl"
	--@type ibl.config
	opts = {
		scope = { enabled = false },
		indent = { char = "┊" },
	},
}
