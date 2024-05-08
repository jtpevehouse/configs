require("everforest").setup({
	-- Your config here
})

require("lualine").setup({
	options = {
		theme = "everforest", -- Can also be "auto" to detect automatically.
	},
})

vim.cmd([[colorscheme everforest]])
