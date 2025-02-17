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
local telescope_builtin = require("telescope.builtin")
vim.keymap.set("n", "ff", telescope_builtin.find_files, {})
vim.keymap.set("n", "fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", {})
vim.keymap.set("n", "fh", telescope_builtin.help_tags, {})
map("n", "fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true })

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

-- BARBAR REMAPS
local opts = { noremap = true, silent = true }

-- Move to previous/next
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)

-- Re-order to previous/next
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)

-- Goto buffer in position...
map("n", "<leader>1", "<Cmd>BufferGoto 1<CR>", opts)
map("n", "<leader>2", "<Cmd>BufferGoto 2<CR>", opts)
map("n", "<leader>3", "<Cmd>BufferGoto 3<CR>", opts)
map("n", "<leader>4", "<Cmd>BufferGoto 4<CR>", opts)
map("n", "<leader>5", "<Cmd>BufferGoto 5<CR>", opts)
map("n", "<leader>6", "<Cmd>BufferGoto 6<CR>", opts)
map("n", "<leader>7", "<Cmd>BufferGoto 7<CR>", opts)
map("n", "<leader>8", "<Cmd>BufferGoto 8<CR>", opts)
map("n", "<leader>9", "<Cmd>BufferGoto 9<CR>", opts)
map("n", "<leader>0", "<Cmd>BufferLast<CR>", opts)

-- Pin/unpin buffer
map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)

-- Close buffer
map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
