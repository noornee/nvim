local function harpoon(mod, fn, ...)
	local args = { ... }
	return function()
		require("harpoon." .. mod)[fn](unpack(args))
	end
end

local M = {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>ha", harpoon("mark", "add_file"), desc = "Harpoon: add file" },
		{ "<leader>hu", harpoon("ui", "toggle_quick_menu"), desc = "Harpoon: menu" },
		{ "<leader>h1", harpoon("ui", "nav_file", 1), desc = "Harpoon: file 1" },
		{ "<leader>h2", harpoon("ui", "nav_file", 2), desc = "Harpoon: file 2" },
		{ "<leader>hn", harpoon("ui", "nav_next"), desc = "Harpoon: next" },
	},
}

return M
