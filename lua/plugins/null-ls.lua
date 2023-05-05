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
			formatting.black,
			formatting.prettier,
			--formatting.black.with {extra_args = { "--fast" }},
		},
	})

	-- format on save
	local fmtGroup = vim.api.nvim_create_augroup("FormatOnSave", { clear = true })
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = fmtGroup,
		pattern = { "*.lua", "*.go", "*.html", "*.rs", "*.json" },
		command = "lua vim.lsp.buf.format({ async = false })",
	})
end

return M
