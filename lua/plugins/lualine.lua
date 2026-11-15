local M = {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
}

M.config = function()
	-- Gruvbox theme, darkened: middle of the bar (section c) in dark0, the
	-- branch/percentage blocks (section b) in dark1
	local theme = vim.deepcopy(require("lualine.themes.gruvbox"))
	for _, mode in pairs(theme) do
		if mode.c then
			mode.c.bg = "#282828"
		end
		if mode.b then
			mode.b.bg = "#3c3836"
		end
	end
	-- Terminal mode gets its own color (gruvbox aqua), so the Claude pane is easy to spot
	theme.terminal = vim.deepcopy(theme.normal)
	theme.terminal.a = { bg = "#8ec07c", fg = "#282828", gui = "bold" }

	require("lualine").setup({
		options = {
			theme = theme,
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
					-- Own colors, so the current tab doesn't blend into the mode block
					tabs_color = {
						active = { fg = "#fabd2f", bg = "#504945", gui = "bold" }, -- yellow on dark grey
						inactive = { fg = "#a89984", bg = "#3c3836" }, -- muted grey
					},
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