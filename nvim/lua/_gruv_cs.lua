-- BASE COLOR SCHEME
require("gruvbox").setup({
	undercurl = true,
	underline = true,
	bold = true,
	italic = {
		strings = true,
		comments = true,
		operators = false,
		folds = true,
	},
	strikethrough = true,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	inverse = true, -- invert background for search, diffs, statuslines and errors
	contrast = "", -- can be "hard", "soft" or empty string
	palette_overrides = {},
	overrides = {},
	dim_inactive = false,
	transparent_mode = false,
})
vim.o.background = "dark"
vim.cmd("colorscheme gruvbox")

-- LUALINE
require("lualine").setup({ options = { theme = "gruvbox-material" } })

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
	vim.api.nvim_set_hl(0, "Red", { fg = "#9d0006" })
	vim.api.nvim_set_hl(0, "Yellow", { fg = "#b57614" })
	vim.api.nvim_set_hl(0, "Blue", { fg = "#076678" })
	vim.api.nvim_set_hl(0, "Orange", { fg = "#af3a03" })
	vim.api.nvim_set_hl(0, "Green", { fg = "#79740e" })
	vim.api.nvim_set_hl(0, "Purple", { fg = "#8f3f71" })
	vim.api.nvim_set_hl(0, "Aqua", { fg = "#427b58" })
end)

require("ibl").setup({
	indent = { highlight = highlight },
})
