local languageServers = {
	"lua_ls",   -- LUA LS
	"pylsp",    -- PYTHON LS
	"terraformls", -- TERRAFORM LS
	"yamlls",   -- YAML LS
	"ansiblels", -- ANSIBLE LS
}

return {
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
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = languageServers,
				automatic_enable = false,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config("pylsp", {
				settings = {
					pylsp = {
						plugins = {
							pyflakes = { enabled = false },
							pycodestyle = { enabled = false },
							autopep8 = { enabled = false },
							yapf = { enabled = false },
							pylsp_mypy = { enabled = false },
							pylsp_black = { enabled = false },
							pylsp_isort = { enabled = false },
						},
					},
				},
			})

			vim.lsp.config("ansiblels", {
				settings = {
					ansible = {
						ansible = {
							path = "ansible",
						},
						executionEnvironment = {
							enabled = false,
						},
						python = {
							interpreterPath = "python",
						},
						validation = {
							enabled = true,
							lint = {
								enabled = true,
								path = "ansible-lint",
							},
						},
					},
				},
			})

			for _, lsp in ipairs(languageServers) do
				vim.lsp.enable(lsp)
			end
		end,
	},
}
