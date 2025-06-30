local M = {
	"nvim-neorg/neorg",
	lazy = false,
	version = "9.*",
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
				-- config = {
				-- 	icons = {
				-- 		todo = {
				-- 			uncertain = {
				-- 				icon = "",
				-- 			},
				-- 		},
				-- 	},
				-- },
			}, -- Adds pretty icons to your documents
			-- ["core.journal"] = {}, -- Dear diary...
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
