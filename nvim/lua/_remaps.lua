-- FUNCTIONS
-- SET FILETYPE AS ANSIBLE AND RESTART LSP
vim.api.nvim_create_user_command("Setansible", function()
	vim.cmd("setfiletype yaml.ansible")
	vim.cmd("LspRestart")
end, {})

-- REMAPS
local map = vim.api.nvim_set_keymap
map("n", "<f1>", ":noh<cr>", { noremap = true })
map("n", "<f2>", ":lua vim.lsp.buf.format()<cr>", { noremap = true })
map("n", "<f5>", ":NvimTreeToggle<cr>", { noremap = true })
map("n", "<f6>", ":Setansible<cr>", { noremap = true })
map("n", "<f9>", ":horizontal resize -5<cr>", { noremap = true })
map("n", "<f10>", ":horizontal resize +5<cr>", { noremap = true })
map("n", "<f11>", ":vertical resize -5<cr>", { noremap = true })
map("n", "<f12>", ":vertical resize +5<cr>", { noremap = true })
