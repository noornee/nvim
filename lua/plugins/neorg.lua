local M = {
	"nvim-neorg/neorg",
	build = ":Neorg sync-parsers",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>Nw", "<cmd>Neorg workspace notes<CR>" },
	},
	ft = "norg",
}

M.config = function()
	require("neorg").setup({
		load = {
			["core.defaults"] = {}, -- Loads default behaviour
			["core.concealer"] = {}, -- Adds pretty icons to your documents
			["core.journal"] = {}, -- Dear diary...
			["core.dirman"] = { -- Manages Neorg workspaces
				config = {
					workspaces = {
						notes = "~/media/documents/neorg/notes",
						school = "~/media/documents/neorg/school",
					},
					default_workspace = "notes",
				},
			},
		},
	})
end

return M
