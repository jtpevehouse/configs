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
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			for _, lsp in ipairs(languageServers) do
				if lsp == "pylsp" then
					lspconfig[lsp].setup({
						capabilities = capabilities,
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
				elseif lsp == "ansiblels" then
					lspconfig[lsp].setup({
						capabilities = capabilities,
						settings = {
							ansible = {
								validation = {
									enabled = true,
									lint = {
										enabled = true,
										arguments =
										"-x no-changed-when,command-instead-of-module,risky-shell-pipe,name[missing],fqcn[action-core],key-order[task]",
									},
								},
							},
						},
					})
				else
					lspconfig[lsp].setup({
						capabilities = capabilities,
					})
				end
			end
		end,
	},
}
