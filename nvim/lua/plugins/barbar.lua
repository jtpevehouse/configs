return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	config = function()
		require("barbar").setup({
			animation = true,
			clickable = true,
			insert_at_end = true,
			sidebar_filetypes = {
				NvimTree = true,
			},
			exclude_ft = { "fish" },
		})
	end,
}
