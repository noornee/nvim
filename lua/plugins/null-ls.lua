local M = {
	"nvimtools/none-ls.nvim",
	event = "BufReadPre",
}

-- files that format on save are listed in `lua/core/autocmd.lua`
M.config = function()
	local null_ls = require("null-ls")
	local formatting = null_ls.builtins.formatting

	null_ls.setup({
		sources = {
			formatting.stylua,
			formatting.goimports,
			formatting.gofumpt,
			formatting.black,
			formatting.prettier,
			formatting.nixfmt,
			formatting.sql_formatter,
		},
	})
end

return M
