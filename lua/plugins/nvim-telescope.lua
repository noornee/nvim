local M = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			config = function()
				require("telescope").load_extension("fzf")
			end,
		},
	},
	keys = {
		{
			"<space>ff",
			-- "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>",
			"<cmd>lua require'telescope.builtin'.find_files()<CR>",
		},
		{
			"<space>fg",
			"<cmd>lua require'telescope.builtin'.live_grep()<CR>",
		},
	},
}

M.config = function()
	local telescope = require("telescope")

	telescope.setup({
		defaults = {
			mappings = {
				i = {
					--["q"] = require("telescope.actions").close,
				},
			},
		},
		pickers = {
			find_files = {
				theme = "dropdown",
				previewer = false,
			},
		},
	})
end

return M
