-- PLUGINS
require("_packer")
require("_tree_sitter")
require("_telescope")
require("_nvim_tree")
require("_autoclose")
require("_neocolumn")
require("_gitsigns")
require("_lspconfig")
require("_null_ls")
require("_nord_cs")
require("_indent_blankline")

-- REMAPS
require("_remaps")

-- OPTIONS
local set = vim.opt
set.number = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.mouse = ""
vim.o.clipboard = "unnamedplus"
vim.o.updatetime = 250
vim.o.timeoutlen = 300
