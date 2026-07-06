return {
	"neanias/everforest-nvim",
	priority = 1000,
	lazy = false,
	dependencies = { "lukas-reineke/indent-blankline.nvim" },
	config = function()
		local everforest = require("everforest")
		local colors = require("everforest.colours")
		local palette = colors.generate_palette(everforest.config, vim.o.background)

		everforest.setup({
			disable_italic_comments = true,
			diagnostic_text_highlight = true,
		})
		everforest.load()

		-- INDENT BLANKLINE
		local hooks = require("ibl.hooks")

		-- create the highlight groups in the highlight setup hook, so they are reset
		-- every time the colorscheme changes
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "green", { fg = palette.green })
			vim.api.nvim_set_hl(0, "aqua", { fg = palette.aqua })
			vim.api.nvim_set_hl(0, "blue", { fg = palette.blue })
			vim.api.nvim_set_hl(0, "orange", { fg = palette.orange })
			vim.api.nvim_set_hl(0, "purple", { fg = palette.purple })
		end)

		local highlight = {
			"green",
			"aqua",
			"blue",
			"orange",
			"purple",
		}

		require("ibl").setup({
			indent = { highlight = highlight },
			whitespace = {
				highlight = highlight,
				remove_blankline_trail = false,
			},
			scope = { enabled = false },
		})
	end,
}
