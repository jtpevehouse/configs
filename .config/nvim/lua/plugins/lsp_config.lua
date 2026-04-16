return {
	{
		"neovim/nvim-lspconfig",
		config = function()
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
							interpreterPath = "/usr/bin/python3",
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

			vim.lsp.config("gopls", {
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
						gofumpt = true,
					},
				},
			})

			vim.lsp.config("pylsp", {
				settings = {
					pylsp = {
						plugins = {
							autopep8 = { enabled = false },
							flake8 = { enabled = true },
							mccabe = { enabled = false },
							pycodestyle = { enabled = false },
							pyflakes = { enabled = false },
							pylsp_black = { enabled = false },
							pylsp_isort = { enabled = false },
							pylsp_mypy = { enabled = false },
							yapf = { enabled = false },
						},
					},
				},
			})

			for _, lsp in ipairs(LanguageServers) do
				vim.lsp.enable(lsp)
			end
		end,
	},
}
