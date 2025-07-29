local M = {
	"leath-dub/snipe.nvim",
	keys = {
		{
			"<leader>b",
			function()
				require("snipe").open_buffer_menu()
			end,
			desc = "Open Snipe buffer menu",
		},
	},
}

M.config = function()
	require("snipe").setup({
		ui = {
			max_width = -1,
			position = "topleft",
		},
		sort = "default", -- or last
	})
end

M = {}

return M
