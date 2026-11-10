local M = {
	"ellisonleao/gruvbox.nvim",
	lazy = false,
	priority = 1000, -- load before other plugins so highlights are set first
}

M.config = function()
	require("gruvbox").setup({
		contrast = "hard",
		italic = {
			strings = false,
			operators = false,
			comments = true,
			folds = true,
		},
		overrides = {
			BufferCurrent = { bg = "#1A1A1D", fg = "#b8bb26" },
			BufferCurrentSign = { fg = "#b8bb26" },
		},
	})

	vim.cmd.colorscheme("gruvbox")
end

return M
