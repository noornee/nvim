local M = {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<CR>" },
		{ "<leader>u", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>" },
		{ "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>" },
		{ "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>" },
		{ "<leader>n", "<cmd>lua require('harpoon.ui').nav_next()<CR>" },
	},
}

return M
