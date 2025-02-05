local lint = require("lint")

lint.linters_by_ft = {
	javascript = { "eslint_d" },
	typescript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	svelte = { "eslint_d" },
	python = { "pylint" },
	json = { "jsonlint" },
	lua = { "luac" },
	yaml = { "yamllint" },
	terraform = { "tflint" },
	dockerfile = { "hadolint" },
	markdown = { "markdownlint" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		lint.try_lint()
	end,
})

vim.keymap.set("n", "<F8>", function()
	lint.try_lint()
end, { desc = "Trigger linting for current file" })
