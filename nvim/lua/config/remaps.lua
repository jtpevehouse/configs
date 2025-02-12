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

-- LSP KEYMAPS
vim.api.nvim_create_autocmd("LspAttach", { -- ONLY CREATE KEYMAPS ON LSP ATTACH TO BUFFER
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, opts)
		vim.keymap.set("n", "<leader>ne", vim.diagnostic.goto_next, opts)
		vim.keymap.set("n", "<leader>pe", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "<leader>fe", vim.diagnostic.open_float, opts)
	end,
})
