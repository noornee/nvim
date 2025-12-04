local M = {
	"nvim-neorg/neorg",
	lazy = false,
	keys = {
		{ "<leader>Nw", "<cmd>Neorg workspace notes<CR>" },
	},
	ft = "norg",
}

M.config = function()
	require("neorg").setup({
		load = {
			["core.defaults"] = {}, -- Loads default behaviour
			["core.concealer"] = {
				config = {
					icons = {
						-- todo = { undone = { icon = "x" } },
					},
				},
			},
			-- ["core.esupports.metagen"] = {
			-- 	config = {
			-- 		type = "auto",
			-- 	},
			-- },
			["core.dirman"] = { -- Manages Neorg workspaces
				config = {
					workspaces = {
						notes = "/media/documents/neorg/notes",
					},
					default_workspace = "notes",
				},
			},
		},
	})
end

return M
