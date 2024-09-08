local M = {
	"nvimtools/none-ls.nvim",
	event = "BufReadPre",
}

M.config = function()
	local null_ls = require("null-ls")
	local formatting = null_ls.builtins.formatting
	local diagnostics = null_ls.builtins.diagnostics

	-- check `lua/core/autocmd.lua` for files set to autoformat on save
	null_ls.setup({
		debug = false,
		sources = {
			-- formatting
			formatting.stylua,
			formatting.goimports,
			formatting.gofumpt,
			formatting.black,
			formatting.prettier,
			formatting.nixfmt,
			formatting.sql_formatter,

			-- diagnostics
			diagnostics.golangci_lint,
		},
	})
end

return M
