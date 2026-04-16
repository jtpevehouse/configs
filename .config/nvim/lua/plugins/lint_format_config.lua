return {
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
					-- LINTERS
					null_ls.builtins.diagnostics.hadolint,
					null_ls.builtins.diagnostics.markdownlint.with({
						extra_args = { "--disable", "MD013" },
					}),
					null_ls.builtins.diagnostics.rstcheck,
					null_ls.builtins.diagnostics.terraform_validate,
					null_ls.builtins.diagnostics.yamllint.with({
						disabled_filetypes = { "yaml.ansible" },
					}),
					-- FORMATTERS
					null_ls.builtins.formatting.clang_format,
					null_ls.builtins.formatting.gofumpt,
					null_ls.builtins.formatting.prettierd.with({
						filetypes = { "html", "json", "markdown" },
					}),
					require("none-ls.formatting.ruff"),
					require("none-ls.formatting.ruff_format"),
					null_ls.builtins.formatting.shfmt,
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.terraform_fmt,
					null_ls.builtins.formatting.yamlfmt,
				},

				-- FORMAT ON SAVE
				on_attach = function(client, bufnr)
					if client:supports_method("textDocument/formatting") and FormatOnSave then
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
