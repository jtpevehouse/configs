return {
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

			for _, lsp in ipairs(LanguageServers) do
				vim.lsp.enable(lsp)
			end
		end,
	},
}
