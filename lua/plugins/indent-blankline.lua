local M = {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = "BufReadPost",
}

M.config = function()
	require("ibl").setup({
		indent = {
			char = "│",
			-- char = "╏",
		},
	})
end

return M
