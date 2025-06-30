local M = {
	"Jay-Madden/auto-fix-return.nvim",
	event = "VeryLazy",

	-- nvim-treesitter is optional, the plugin will work fine without it as long as
	-- you have a valid Go parser in $rtp/parsers.
	-- However due to the Go grammar not being on Treesitter ABI 15 without 'nvim-treesitter'
	-- we are unable to detect and warn if an invalid parser version is being used.
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
}

M.config = function()
	require("auto-fix-return").setup({})
end

return M
