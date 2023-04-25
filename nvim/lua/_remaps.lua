-- REMAPS
local map = vim.api.nvim_set_keymap
map("n", "<f1>", ":noh<cr>", { noremap = true })
map("n", "<f5>", ":NvimTreeToggle<cr>", { noremap = true })
map("n", "<f11>", ":vertical resize -5<cr>", { noremap = true })
map("n", "<f12>", ":vertical resize +5<cr>", { noremap = true })
