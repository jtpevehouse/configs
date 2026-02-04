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
			insert_at_end = true,
			auto_hide = 1,
			sidebar_filetypes = {
				NvimTree = true,
			},
			exclude_ft = { "fish" },
		})
	end,
}
