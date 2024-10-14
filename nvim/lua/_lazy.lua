local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "

require("lazy").setup({
	{ "ellisonleao/gruvbox.nvim", priority = 1000 }, -- COLOR SCHEME
	{ "shaunsingh/nord.nvim", priority = 1000 }, -- COLOR SCHEME
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 }, -- COLOR SCHEME
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000,
	}, -- COLOR SCHEME
	{ "m4xshen/autoclose.nvim", lazy = true }, -- AUTO CLOSE SYMBOLS
	{ "lewis6991/gitsigns.nvim", lazy = true }, -- MARK CHANGES IN GIT REPOS
	{ "lukas-reineke/indent-blankline.nvim", lazy = true }, -- COLORED INDENTATION MARKERS
	{ "terrortylor/nvim-comment", lazy = true }, -- BULK COMMENT
	{ "sindrets/diffview.nvim" }, -- GIT DIFF COMPARISON
	{ -- LINTER & FORMATTER MANAGER
		"williamboman/mason.nvim",
		dependencies = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
	},
	{ "stevearc/conform.nvim", opts = {}, event = { "BufReadPre", "BufNewFile" } }, -- FORMATTING
	{ "mfussenegger/nvim-lint", event = { "BufReadPre", "BufNewFile" } }, -- LINTING
	{ -- CODE HIGHLIGHTING
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		lazy = true,
		run = ":TSUpdate",
	},
	{ -- STATUS LINE
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
	},
	{ -- FILE SEARCHING
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ -- FILE SEARCHING PLUGIN
		"nvim-telescope/telescope-file-browser.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	{ -- FILE TREE
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
	},
})
