local M = {
	"lewis6991/gitsigns.nvim",
}

M.config = function()
	local gitsigns = require("gitsigns")
	gitsigns.setup({
		current_line_blame = true, -- :Gitsigns toggle_current_line_blame
	})
end

return M
