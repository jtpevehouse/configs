-- Telescope Remaps
local builtin = require("telescope.builtin")
vim.keymap.set("n", "ff", builtin.find_files, {})
vim.keymap.set("n", "fg", builtin.live_grep, {})
vim.keymap.set("n", "fh", builtin.help_tags, {})
vim.api.nvim_set_keymap("n", "fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true })

-- SETUP
require("telescope").setup({
	extensions = {
		file_browser = {},
	},
})

require("telescope").load_extension("file_browser")
