local M = {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = true,
}

M.config = function()
	require("mason").setup()
	require("mason-tool-installer").setup({
		"gomodifytags",
		"json-to-struct",
		"revive",
		"staticcheck",
		"vint",
	})
end

return M
