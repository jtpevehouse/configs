local mason = require("mason")
local mason_tool_installer = require("mason-tool-installer")

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

mason_tool_installer.setup({
	ensure_installed = {
		"prettier", -- prettier formatter
		"stylua", -- lua formatter
		"black", -- python formatter
		"pylint", -- python linter
		"beautysh",
		"luacheck",
		"yamllint",
		"terraform-ls",
		"tflint",
		"hadolint",
		"markdownlint",
	},
})
