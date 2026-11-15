local M = {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
}

M.config = function()
	require("lualine").setup({
		options = {
			globalstatus = true, -- one statusline across all splits
			component_separators = "",
			section_separators = "", -- flat blocks
		},
		sections = {
			lualine_a = {
				"mode",
				-- Tab list next to the mode, only when more than one tab is open.
				{
					"tabs",
					mode = 0, -- show tab numbers
					cond = function()
						return #vim.api.nvim_list_tabpages() > 1
					end,
				},
			},
			lualine_b = { "branch" },
			lualine_c = {
				"%=", -- push what follows to the center of the bar
				{ "filename", path = 1 },
			},
			lualine_x = { "diagnostics", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		-- Replace file info with something useful when these plugin windows are focused
		extensions = { "nvim-tree", "fzf", "lazy", "mason", "quickfix" },
	})
end

return M