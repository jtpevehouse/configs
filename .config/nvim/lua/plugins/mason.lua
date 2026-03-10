return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			local mason_tool_installer = require("mason-tool-installer")
			mason_tool_installer.setup({
				ensure_installed = {
					"stylua", -- lua formatter
					"shfmt", -- bash formatter
					"yamlfmt", -- yaml formatter
					"ruff", -- python linter & formatter
					"pylint", -- python linter & formatter
					"yamllint", -- yaml linter
					"hadolint", -- dockerfile linter
					"markdownlint", -- markdown linter
					"prettierd", -- general formatter
					"rstcheck", -- rst linter
					"luacheck", -- lua linter
				},
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			local mason = require("mason")

			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
}
