-- BASE COLOR SCHEME
vim.cmd([[colorscheme nord]])

vim.g.nord_contrast = true
vim.g.nord_borders = false
vim.g.nord_disable_background = false
vim.g.nord_italic = false
vim.g.nord_uniform_diff_background = true
vim.g.nord_bold = false

require("nord").set()

-- LUALINE
require("lualine").setup({ options = { theme = "nord" } })

-- INDENT BLANKLINE
vim.opt.termguicolors = true
vim.cmd([[highlight IndentBlanklineIndent1 guifg=#bf616a gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guifg=#d08770 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent3 guifg=#ebcb8b gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent4 guifg=#a3be8c gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent5 guifg=#b48ead gui=nocombine]])
vim.cmd([[highlight IndentBlanklineContextChar guifg=#ECEFF4 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineContextSpaceChar guifg=#ECEFF4 gui=nocombine]])

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
	},
})
