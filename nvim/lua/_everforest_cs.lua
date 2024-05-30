require("everforest").setup({
	-- Your config here
})

require("lualine").setup({
	options = {
		theme = "everforest", -- Can also be "auto" to detect automatically.
	},
})

vim.cmd([[colorscheme everforest]])

-- INDENT BLANKLINE
local highlight = {
	"Red",
	"Yellow",
	"Blue",
	"Orange",
	"Green",
	"Purple",
	"Aqua",
}

local hooks = require("ibl.hooks")
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "Red", { fg = "#E67E80" })
	vim.api.nvim_set_hl(0, "Yellow", { fg = "#DBBC7F" })
	vim.api.nvim_set_hl(0, "Blue", { fg = "#7FBBB3" })
	vim.api.nvim_set_hl(0, "Orange", { fg = "#E69875" })
	vim.api.nvim_set_hl(0, "Green", { fg = "#A7C080" })
	vim.api.nvim_set_hl(0, "Purple", { fg = "#D699B6" })
	vim.api.nvim_set_hl(0, "Aqua", { fg = "#83C092" })
end)

require("ibl").setup({
	indent = { highlight = highlight },
	exclude = {
		filetypes = {
			"yaml",
			"markdown",
		},
	},
})
