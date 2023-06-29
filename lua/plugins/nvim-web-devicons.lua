local M = {
	"nvim-tree/nvim-web-devicons",
}

M.config = function()
	require("nvim-web-devicons").setup({
		override_by_filename = {
			[".gitignore"] = {
				icon = "",
				color = "#f1502f",
				name = "Gitignore",
			},
			["go.mod"] = {
				icon = "󰟓",
				color = "#ADD8E6",
				name = "GoMod",
			},
			["go.sum"] = {
				icon = "󰟓",
				color = "#ADD8E6",
				name = "GoSum",
			},
		},
	})
end

return M
