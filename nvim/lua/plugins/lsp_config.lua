local languageServers = {
	"lua_ls", -- LUA LS
	"pylsp", -- PYTHON LS
	"terraformls", -- TERRAFORM LS
	"tflint", -- TERRAFORM LINTER/LS
	"yamlls", -- YAML LS
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
						on_attach = function()
							-- require("lsp_signature").on_attach({
							-- 	bind = false,
							-- 	use_lspsaga = true,
							-- 	floating_window = true,
							-- 	fix_pos = true,
							-- 	hint_enable = true,
							-- 	hi_parameter = "Search",
							-- 	handler_opts = {
							-- 		"shadow",
							-- 	},
							-- })
						end,
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
				else
					lspconfig[lsp].setup({
						capabilities = capabilities,
						on_attach = function()
							-- require("lsp_signature").on_attach({
							-- 	bind = false,
							-- 	use_lspsaga = true,
							-- 	floating_window = true,
							-- 	fix_pos = true,
							-- 	hint_enable = true,
							-- 	hi_parameter = "Search",
							-- 	handler_opts = {
							-- 		"shadow",
							-- 	},
							-- })
						end,
					})
				end
			end
		end,
	},
}
