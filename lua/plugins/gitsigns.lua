local M = {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
}

M.config = function()
	require("gitsigns").setup({
		current_line_blame = true, -- :Gitsigns toggle_current_line_blame
	})
end

return M
