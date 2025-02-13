return {
	{ -- FILE SEARCHING AND PROJECT GREPPING
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				extensions = {
					file_browser = {},
				},
			})
		end,
	},
	{ -- FILE BROWSER PLUGIN
		"nvim-telescope/telescope-file-browser.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").load_extension("file_browser")
		end,
	},
	{ -- UI FOR CODE ACTIONS PLUGINS
		"nvim-telescope/telescope-ui-select.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
	{ -- LIVE GREP WITH OPTIONS
		"nvim-telescope/telescope-live-grep-args.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").load_extension("live_grep_args")
		end,
	},
}
