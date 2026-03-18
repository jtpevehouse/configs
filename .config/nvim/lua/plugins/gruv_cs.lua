return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	lazy = false,
	dependencies = { "lukas-reineke/indent-blankline.nvim" },
	config = function()
		require("gruvbox").setup({
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = false,
				comments = false,
				operators = false,
				folds = true,
			},
			strikethrough = true,
			invert_selection = true,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = "soft", -- can be "hard", "soft" or empty string
			palette_overrides = {},
			overrides = {},
			dim_inactive = false,
			transparent_mode = false,
		})
		vim.o.background = "dark"
		vim.cmd("colorscheme gruvbox")
		Colors = require("gruvbox")

		-- LUALINE
		require("lualine").setup({ options = { theme = "gruvbox-material" } })

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
			vim.api.nvim_set_hl(0, "Red", { fg = Colors.palette.bright_red })
			vim.api.nvim_set_hl(0, "Yellow", { fg = Colors.palette.bright_yellow })
			vim.api.nvim_set_hl(0, "Orange", { fg = Colors.palette.bright_orange })
			vim.api.nvim_set_hl(0, "Green", { fg = Colors.palette.bright_green })
			vim.api.nvim_set_hl(0, "Purple", { fg = Colors.palette.bright_purple })
		end)

		require("ibl").setup({
			indent = { highlight = highlight },
		})
	end,
}
