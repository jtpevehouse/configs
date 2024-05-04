require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = false, -- disables setting the background color.
	show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
	term_colors = "xterm-kitty", -- sets terminal colors (e.g. `g:terminal_color_0`)
	dim_inactive = {
		enabled = false, -- dims the background color of inactive window
		shade = "dark",
		percentage = 0.15, -- percentage of the shade to apply to the inactive window
	},
	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	no_underline = false, -- Force no underline
	styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
		comments = { "italic" }, -- Change the style of comments
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	color_overrides = {},
	custom_highlights = {},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		notify = false,
		mini = false,
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")

-- LUALINE
require("lualine").setup({ options = { theme = "catppuccin" } })

-- INDENT BLANKLINE
vim.opt.termguicolors = true
vim.cmd([[highlight IndentBlanklineIndent1 guifg=#f5c2e7 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guifg=#cba6f7 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent3 guifg=#f38ba8 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent4 guifg=#eba0ac gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent5 guifg=#fab387 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent6 guifg=#f9e2af gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent7 guifg=#a6e3a1 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineContextChar guifg=#f5e0dc gui=nocombine]])
vim.cmd([[highlight IndentBlanklineContextSpaceChar guifg=#f5e0dc gui=nocombine]])

require("indent_blankline").setup({
	show_current_context = true,
	show_current_context_start = true,
	space_char_blankline = " ",
	char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
		"IndentBlanklineIndent7",
	},
})
