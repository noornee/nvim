local M = {
	"mistweaverco/kulala.nvim",
	ft = { "http", "rest" },
	keys = {
		{
			"<leader>kr",
			function()
				require("kulala").run()
			end,
			desc = "Kulala: run request",
		},
		{
			"<leader>ka",
			function()
				require("kulala").run_all()
			end,
			desc = "Kulala: run all",
		},
	},
}

M.config = function()
	require("kulala").setup({
		global_keymaps = false,
	})
end

return M
