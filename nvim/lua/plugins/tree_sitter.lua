return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	run = ":TSUpdate",
	config = function()
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
				"hyprlang",
			},
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		})

		vim.filetype.add({
			pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
		})

		vim.filetype.add({
			pattern = {
				[".*/roles/.*.yaml"] = "yaml.ansible",
				[".*/playbooks/.*.yaml"] = "yaml.ansible",
				[".*/zuul.d/.*.yaml"] = "yaml.ansible",
			},
		})
	end,
}
