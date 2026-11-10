local M = {
	"lukas-reineke/indent-blankline.nvim",
	event = "BufReadPost",
}

M.config = function()
	require("ibl").setup({
		indent = {
			char = "│",
		},
	})
end

return M
