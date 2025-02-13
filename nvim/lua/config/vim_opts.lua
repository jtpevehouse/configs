vim.api.nvim_set_option("clipboard", "unnamed")
local set = vim.opt
set.number = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.mouse = ""
set.textwidth = 120
set.colorcolumn = "+1"
set.ignorecase = true
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.highlight.priorities.semantic_tokens = 95

-- CONFIGURE DIAGNOSTIC APPEARANCE
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = false,
})
