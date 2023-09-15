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
vim.opt.termguicolors = true
vim.cmd([[highlight IndentBlanklineIndent1 guifg=#9d0006 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guifg=#79740e gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent3 guifg=#b57614 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent4 guifg=#076678 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent5 guifg=#8f3f71 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent6 guifg=#427b58 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent7 guifg=#af3a03 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineContextChar guifg=#f2e5bc gui=nocombine]])
vim.cmd([[highlight IndentBlanklineContextSpaceChar guifg=#f2e5bc gui=nocombine]])

require("indent_blankline").setup({
	show_current_context = true,
	show_current_context_start = true,
	space_char_blankline = " ",
	char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
		"IndentBlanklineIndent7",
	},
})

-- NEOCOLUMN
local config = {
	fg_color = "#ebdbb2",
	bg_color = "#cc241d",
	NeoColumn = "120",
	always_on = true,
	custom_NeoColumn = {},
	excluded_ft = { "text", "markdown", "csv" },
}

require("NeoColumn").setup(config)
