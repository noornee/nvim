local M = {
	"jose-elias-alvarez/null-ls.nvim",
	event = "BufReadPre",
}

M.config = function()
	local null_ls = require("null-ls")
	local formatting = null_ls.builtins.formatting

	null_ls.setup({
		debug = false,
		sources = {
			formatting.stylua,
			formatting.goimports,
			formatting.gofumpt,
			formatting.black,
			formatting.prettier,
		},
	})
end

return M
