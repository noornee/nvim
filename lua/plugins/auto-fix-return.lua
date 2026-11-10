local M = {
	"Jay-Madden/auto-fix-return.nvim",
	ft = "go",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
}

M.config = function()
	require("auto-fix-return").setup({})
end

return M
