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
			-- transparent editor background only (NormalNC links to Normal); floats, sign
			-- column, statusline etc. keep their colors. Unlike `transparent_mode`.
			Normal = { bg = "NONE" },
			-- no grey strip behind the sign column (gitsigns/diagnostic signs)
			SignColumn = { bg = "NONE" },
			FoldColumn = { bg = "NONE" },
			GruvboxRedSign = { bg = "NONE" },
			GruvboxGreenSign = { bg = "NONE" },
			GruvboxYellowSign = { bg = "NONE" },
			GruvboxBlueSign = { bg = "NONE" },
			GruvboxPurpleSign = { bg = "NONE" },
			GruvboxAquaSign = { bg = "NONE" },
			GruvboxOrangeSign = { bg = "NONE" },
			BufferCurrent = { bg = "#1A1A1D", fg = "#b8bb26" },
			BufferCurrentSign = { fg = "#b8bb26" },
			DiffAdd = { bg = "#202a1e" }, -- line only in the new file
			DiffChange = { bg = "#1e231c" }, -- changed line, new side (faint)
			DiffText = { fg = "NONE", bg = "#2f4227" }, -- the changed words, new side (fg NONE: gruvbox sets it near-black)
			DiffDelete = { fg = "#3c3836", bg = "NONE" }, -- filler lines (the ╱ padding)
			DiffOldLine = { bg = "#2e2022" }, -- line only in the old file
			DiffOldChange = { bg = "#261e1f" }, -- changed line, old side (faint)
			DiffOldText = { bg = "#4a2a2c" }, -- the changed words, old side
			-- Inline git blame: readable gruvbox grey instead of the near-invisible NonText
			GitSignsCurrentLineBlame = { fg = "#665c54", italic = true },
			-- Claude Code terminal (a snacks.nvim window): use the normal, transparent
			-- editor background instead of gruvbox's grey float background
			SnacksNormal = { link = "Normal" },
			SnacksNormalNC = { link = "NormalNC" },
		},
	})

	vim.cmd.colorscheme("gruvbox")
end

return M
