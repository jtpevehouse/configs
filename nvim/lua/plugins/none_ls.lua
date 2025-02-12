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
					"pylint", -- python linter & formatter
					"yamllint", -- yaml linter
					"ansible-lint", -- ansible linter
					"hadolint", -- dockerfile linter
					"markdownlint", -- markdown linter
				},
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
		config = function()
			local null_ls = require("null-ls")
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.shfmt,
					null_ls.builtins.formatting.terraform_fmt,
					null_ls.builtins.formatting.yamlfmt,
					null_ls.builtins.diagnostics.yamllint,
					null_ls.builtins.diagnostics.ansiblelint,
					null_ls.builtins.diagnostics.pylint,
					null_ls.builtins.diagnostics.hadolint,
					null_ls.builtins.diagnostics.markdownlint,
					null_ls.builtins.diagnostics.terraform_validate,
				},

				-- FORMAT ON SAVE
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ async = false })
							end,
						})
					end
				end,
			})
		end,
	},
}
