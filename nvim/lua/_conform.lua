require("conform").setup({
	formatters_by_ft = {
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		markdown = { "prettier" },
		lua = { "stylua" },
		python = { "black" },
		bash = { "beautysh" },
	},
	format_on_save = {
		timeout_ms = 1000,
		lsp_format = "fallback",
	},
})
