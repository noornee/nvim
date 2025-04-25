local M = {
	"mistweaverco/kulala.nvim",
	opts = {
		global_keymaps = false,
	},
	ft = { "http", "rest" },
	keys = {
		{
			"<leader>kr",
			"<cmd>lua require('kulala').run()<CR>",
		},
		{
			"<leader>ka",
			"<cmd>lua require('kulala').run_all()<CR>",
		},
	},
}

return M
