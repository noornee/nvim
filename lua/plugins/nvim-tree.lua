local M = {
	"nvim-tree/nvim-tree.lua",
	keys = {
		{ "<C-t>", "<cmd>NvimTreeToggle<CR>", desc = "toggle NvimTree" },
		{ "<F3>", "<cmd>NvimTreeToggle<CR>", desc = "toggle NvimTree" },
	},
}

M.config = function()
	local nvim_tree = require("nvim-tree")

	nvim_tree.setup({
		view = {
			-- auto
			mappings = {
				list = {
					{ key = "<C-t>", action = "" }, -- removes the default mapping; already have <C-t> mapped to toggle nvim-tree
				},
			},
		},
	})
end

return M
