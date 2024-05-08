-- FUNCTIONS
-- SET FILETYPE AS ANSIBLE AND RESTART LSP
vim.api.nvim_create_user_command("Setansible", function()
	vim.cmd("setfiletype yaml.ansible")
	vim.cmd("LspRestart")
end, {})

-- FN KEYS
local map = vim.api.nvim_set_keymap
map("n", "<f1>", ":noh<cr>", { noremap = true })
map("n", "<f2>", ":CommentToggle<cr>", { noremap = true })
map("n", "<f4>", ":NvimTreeFindFile!<cr>", { noremap = true })
map("n", "<f5>", ":NvimTreeToggle<cr>", { noremap = true })
map("n", "<f6>", ":Setansible<cr>", { noremap = true })
map("n", "<f9>", ":horizontal resize -5<cr>", { noremap = true })
map("n", "<f10>", ":horizontal resize +5<cr>", { noremap = true })
map("n", "<f11>", ":vertical resize -5<cr>", { noremap = true })
map("n", "<f12>", ":vertical resize +5<cr>", { noremap = true })

-- TELESCOPE
local builtin = require("telescope.builtin")
vim.keymap.set("n", "ff", builtin.find_files, {})
vim.keymap.set("n", "fg", builtin.live_grep, {})
vim.keymap.set("n", "fh", builtin.help_tags, {})
vim.api.nvim_set_keymap("n", "fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true })
