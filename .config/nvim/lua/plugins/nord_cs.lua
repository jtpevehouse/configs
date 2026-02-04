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
		Palette = require("nord.named_colors")

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
			vim.api.nvim_set_hl(0, "Red", { fg = Palette.red })
			vim.api.nvim_set_hl(0, "Yellow", { fg = Palette.yellow })
			vim.api.nvim_set_hl(0, "Orange", { fg = Palette.orange })
			vim.api.nvim_set_hl(0, "Green", { fg = Palette.green })
			vim.api.nvim_set_hl(0, "Purple", { fg = Palette.purple })
		end)

		require("ibl").setup({
			indent = { highlight = highlight },
		})
	end,
}
