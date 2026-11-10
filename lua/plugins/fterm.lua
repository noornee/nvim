local M = {
	"numToStr/FTerm.nvim",
	keys = {
		{
			"<F2>",
			function()
				require("FTerm").toggle()
			end,
			mode = { "n", "t" },
			desc = "Toggle terminal",
		},
	},
}

M.config = function()
	require("FTerm").setup({
		dimensions = {
			height = 0.98,
			width = 0.98,
		},
	})

	vim.api.nvim_set_hl(0, "FloatBorder", { fg = "grey", bg = "none" })
end

return M
