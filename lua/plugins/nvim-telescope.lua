local M = {
	"nvim-telescope/telescope.nvim",
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{
			"<space>ff",
			"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>",
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
	})
end

return M
