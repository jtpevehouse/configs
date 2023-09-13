vim.opt.termguicolors = true
-- GRUVBOX
-- vim.cmd([[highlight IndentBlanklineIndent1 guifg=#9d0006 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent2 guifg=#79740e gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent3 guifg=#b57614 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent4 guifg=#076678 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent5 guifg=#8f3f71 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent6 guifg=#427b58 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineIndent7 guifg=#af3a03 gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineContextChar guifg=#f2e5bc gui=nocombine]])
-- vim.cmd([[highlight IndentBlanklineContextSpaceChar guifg=#f2e5bc gui=nocombine]])
--
-- require("indent_blankline").setup({
-- 	show_current_context = true,
-- 	show_current_context_start = true,
-- 	space_char_blankline = " ",
-- 	char_highlight_list = {
-- 		"IndentBlanklineIndent1",
-- 		"IndentBlanklineIndent2",
-- 		"IndentBlanklineIndent3",
-- 		"IndentBlanklineIndent4",
-- 		"IndentBlanklineIndent5",
-- 		"IndentBlanklineIndent6",
-- 		"IndentBlanklineIndent7",
-- 	},
-- })

-- NORD
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
