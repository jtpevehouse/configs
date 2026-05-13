-- return {
-- 	"github/copilot.vim",
-- 	lazy = true,
-- }

return { {
	"github/copilot.vim",
	lazy = false,
	init = function()
		vim.g.copilot_no_tab_map = false
	end,
} }
