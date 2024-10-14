-- TREE SITTER
local configs = require("nvim-treesitter.configs")
configs.setup({
	ensure_installed = {
		"bash",
		"bitbake",
		"c",
		"cpp",
		"css",
		"csv",
		"dockerfile",
		"fish",
		"gitignore",
		"html",
		"javascript",
		"json",
		"lua",
		"make",
		"markdown",
		"python",
		"yaml",
		"terraform",
	},
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})
