local M = {
	"ellisonleao/gruvbox.nvim",
}

M.config = function()
	local gruvbox = require("gruvbox")

	-- setup must be called before loading the colorscheme
	gruvbox.setup({
		undercurl = true,
		underline = true,
		bold = true,
		italic = {
			strings = false,
			operators = false,
			comments = true,
			folds = true,
		},
		strikethrough = true,
		invert_selection = false,
		invert_signs = false,
		invert_tabline = false,
		invert_intend_guides = false,
		inverse = true, -- invert background for search, diffs, statuslines and errors
		contrast = "hard", -- can be "hard", "soft" or empty string
		palette_overrides = {},
		overrides = {},
		dim_inactive = false,
		transparent_mode = false,
	})

	vim.cmd("colorscheme gruvbox")
end

return M
