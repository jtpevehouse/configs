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
	{ "Mofiqul/dracula.nvim", priority = 1000 }, -- COLOR SCHEME
	{ "m4xshen/autoclose.nvim", lazy = true }, -- AUTO CLOSE SYMBOLS
	{ "lewis6991/gitsigns.nvim", lazy = true }, -- MARK CHANGES IN GIT REPOS
	{ "lukas-reineke/indent-blankline.nvim", lazy = true }, -- COLORED INDENTATION MARKERS
	{ "folke/which-key.nvim", lazy = true }, -- MENU TO HELP WITH KEYMAPS
	{ "terrortylor/nvim-comment", lazy = true },
	{ "hrsh7th/nvim-cmp" }, -- Autocompletion plugin
	{ "hrsh7th/cmp-nvim-lsp" }, -- LSP source for nvim-cmp
	{ "saadparwaiz1/cmp_luasnip" }, -- Snippets source for nvim-cmp
	{ "L3MON4D3/LuaSnip" }, -- Define snippets
	{ -- LSP CONFIGURATION
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
	},
	{ -- MASON NULL-LS INTEGRATION
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
	},
	{ -- CODE FORMATTING
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
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
