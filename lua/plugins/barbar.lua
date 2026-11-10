local M = {
	"romgrk/barbar.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = "BufEnter",
	keys = {
		{ "<A-,>", "<cmd>BufferPrevious<CR>" },
		{ "<A-.>", "<cmd>BufferNext<CR>" },
		{ "<A-<>", "<cmd>BufferMovePrevious<CR>" },
		{ "<A->>", "<cmd>BufferMoveNext<CR>" },
		{ "<A-c>", "<cmd>BufferClose<CR>" },
		{ "<A-f>", "<cmd>BufferPick<CR>" },
	},
}

M.config = function()
	require("barbar").setup({
		icons = {
			button = false,
		},
	})
end

return M
