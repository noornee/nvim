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
			"gomodifytags", -- ftplugin/go.lua
			"json-to-struct",
			-- formatters used by conform.nvim (the rest come from Nix)
			"goimports",
			"prettier",
			"sql-formatter",
		},
	})
end

return M
