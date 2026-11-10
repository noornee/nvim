local M = {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
}

M.config = function()
	require("mason").setup()
	require("mason-tool-installer").setup({
		ensure_installed = {
			"gomodifytags",
			"json-to-struct",
			"revive",
			"staticcheck",
			"vint",
		},
	})
end

return M
