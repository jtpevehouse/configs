-- PLUGINS
require("_lazy")
require("_tree_sitter")
require("_telescope")
require("_nvim_tree")
require("_autoclose")
require("_gitsigns")
require("_lspconfig")
require("_null_ls")
require("_which_key")
require("_comment")
require("_lualine")

-- REMAPS
require("_remaps")

-- COLOR SCHEME
require("_everforest_cs")

-- OPTIONS
local set = vim.opt
set.number = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.mouse = ""
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.highlight.priorities.semantic_tokens = 95
set.textwidth = 120
set.colorcolumn = "+1"
vim.api.nvim_set_option("clipboard", "unnamed")
