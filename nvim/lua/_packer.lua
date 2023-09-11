local vim = vim
local fn = vim.fn
local execute = vim.api.nvim_command

-- PACKER
-- ensure that packer is installed
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute("packadd packer.nvim")
end

vim.cmd("packadd packer.nvim")
local packer = require("packer")
local util = require("packer.util")
packer.init({
	package_root = util.join_paths(vim.fn.stdpath("data"), "site", "pack"),
})

--- startup and add configure plugins
packer.startup(function()
	local use = use

	use("ellisonleao/gruvbox.nvim")
	use("nvim-tree/nvim-web-devicons")
	use("m4xshen/autoclose.nvim")
	use("ecthelionvi/NeoColumn.nvim")
	use("lewis6991/gitsigns.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use("mhartington/formatter.nvim")

	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({
		"prettier/vim-prettier",
		run = "yarn install",
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({
		"nvim-telescope/telescope-file-browser.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	})
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
	})
end)
