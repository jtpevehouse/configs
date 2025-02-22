return {
	"nvim-tree/nvim-tree.lua",
	requires = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		vim.opt.termguicolors = true

		-- AUTO OPEN
		local function open_nvim_tree(data)
			-- buffer is a real file on the disk
			local real_file = vim.fn.filereadable(data.file) == 1

			-- buffer is a [No Name]
			local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

			if not real_file and not no_name then
				return
			end

			-- open the tree, find the file but don't focus it
			require("nvim-tree.api").tree.toggle({ focus = false, find_file = true })
		end
		vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

		-- AUTO CLOSE
		vim.api.nvim_create_autocmd("QuitPre", {
			callback = function()
				local invalid_win = {}
				local wins = vim.api.nvim_list_wins()
				for _, w in ipairs(wins) do
					local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
					if bufname:match("NvimTree_") ~= nil then
						table.insert(invalid_win, w)
					end
				end
				if #invalid_win == #wins - 1 then
					-- Should quit, so we close all invalid windows.
					for _, w in ipairs(invalid_win) do
						vim.api.nvim_win_close(w, true)
					end
				end
			end,
		})

		local function my_on_attach(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			-- default mappings
			api.config.mappings.default_on_attach(bufnr)

			-- custom mappings
			vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
			vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
		end

		-- pass to setup along with your other options
		require("nvim-tree").setup({
			on_attach = my_on_attach,
			view = {
				width = 40,
			},
			diagnostics = {
				enable = true,
			},
		})
	end,
}
