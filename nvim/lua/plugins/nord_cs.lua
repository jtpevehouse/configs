return {
	"shaunsingh/nord.nvim",
	priority = 1000,
	lazy = false,
	dependencies = { "lukas-reineke/indent-blankline.nvim" },
	config = function()
		vim.g.nord_contrast = true
		vim.g.nord_borders = false
		vim.g.nord_disable_background = true
		vim.g.nord_italic = false
		vim.g.nord_uniform_diff_background = true
		vim.g.nord_bold = false

		-- Load the colorscheme
		require("nord").set()

		-- LUALINE
		require("lualine").setup({ options = { theme = "nord" } })

		-- INDENT BLANKLINE
		local highlight = {
			"Red",
			"Yellow",
			"Orange",
			"Green",
			"Purple",
		}

		local hooks = require("ibl.hooks")
		-- create the highlight groups in the highlight setup hook, so they are reset
		-- every time the colorscheme changes
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "Red", { fg = "#bf616a" })
			vim.api.nvim_set_hl(0, "Yellow", { fg = "#ebcb8b" })
			vim.api.nvim_set_hl(0, "Orange", { fg = "#d08770" })
			vim.api.nvim_set_hl(0, "Green", { fg = "#a3be8c" })
			vim.api.nvim_set_hl(0, "Purple", { fg = "#b48ead" })
		end)

		require("ibl").setup({
			indent = { highlight = highlight },
		})
	end,
}
