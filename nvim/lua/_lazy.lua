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
	-- APPEARANCE
	{ "ellisonleao/gruvbox.nvim", priority = 1000 },
	{ "shaunsingh/nord.nvim", priority = 1000 },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "neanias/everforest-nvim", priority = 1000 },
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
	{ -- FILE TREE
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
	},

	-- GIT TOOLS
	{ "sindrets/diffview.nvim" }, -- GIT DIFF COMPARISON
	{ "lewis6991/gitsigns.nvim", lazy = true }, -- MARK CHANGES IN GIT REPOS

	-- QUALITY OF LIFE
	{ "m4xshen/autoclose.nvim", lazy = true }, -- AUTO CLOSE SYMBOLS
	{ "lukas-reineke/indent-blankline.nvim", lazy = true }, -- COLORED INDENTATION MARKERS
	{ "terrortylor/nvim-comment", lazy = true }, -- BULK COMMENT
	{ -- FILE SEARCHING
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ -- FILE SEARCHING PLUGIN
		"nvim-telescope/telescope-file-browser.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},

	-- LSP SETUP
	{ -- LINTER & FORMATTER MANAGER
		"williamboman/mason.nvim",
		dependencies = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
	},
	{ "stevearc/conform.nvim", opts = {}, event = { "BufReadPre", "BufNewFile" } }, -- FORMATTING
	{ "mfussenegger/nvim-lint", event = { "BufReadPre", "BufNewFile" } }, -- LINTING

	-- CODE COMPLETIONS
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/nvim-cmp" },
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },
})
