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

			for _, lsp in ipairs(LanguageServers) do
				vim.lsp.enable(lsp)
			end
		end,
	},
}
