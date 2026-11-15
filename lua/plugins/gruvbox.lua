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
			DiffAdd = { bg = "#202a1e" }, -- line only in the new file
			DiffChange = { bg = "#1e231c" }, -- changed line, new side (faint)
			DiffText = { fg = "NONE", bg = "#2f4227" }, -- the changed words, new side (fg NONE: gruvbox sets it near-black)
			DiffDelete = { fg = "#3c3836", bg = "NONE" }, -- filler lines (the ╱ padding)
			DiffOldLine = { bg = "#2e2022" }, -- line only in the old file
			DiffOldChange = { bg = "#261e1f" }, -- changed line, old side (faint)
			DiffOldText = { bg = "#4a2a2c" }, -- the changed words, old side
		},
	})

	vim.cmd.colorscheme("gruvbox")
end

return M
