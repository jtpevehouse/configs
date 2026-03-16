return {
	{
		"mfussenegger/nvim-lint",
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				["yaml.ansible"] = { "ansible_lint" },
				yaml = { "yamllint" },
				bash = { "bash" },
				python = { "ruff", "pylint" },
				lua = { "luacheck" },
				dockerfile = { "hadolint" },
				markdown = { "markdownlint" },
				rst = { "rstcheck" },
			}

			vim.api.nvim_create_autocmd({ "TextChanged", "BufWritePost", "BufReadPost" }, {
				callback = function()
					lint.try_lint()
					local lint_status, lint = pcall(require, "lint")
					if lint_status then
						lint.try_lint()
					end
				end,
			})
		end,
	},
}
