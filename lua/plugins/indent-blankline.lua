local M = {
	"lukas-reineke/indent-blankline.nvim",
	event = "BufReadPost",
}

M.config = function()
	local blankline = require("indent_blankline")

	blankline.setup({
		show_current_context = true,
		-- show_current_context_start = true,
	})
end

return M
