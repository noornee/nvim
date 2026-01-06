local M = {
	"Jay-Madden/auto-fix-return.nvim",
	event = "VeryLazy",

	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
}

M.config = function()
	require("auto-fix-return").setup({})
end

return M
