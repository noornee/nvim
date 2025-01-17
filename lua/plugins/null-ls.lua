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

			--lua
			formatting.stylua,

			-- go
			formatting.goimports,
			formatting.gofumpt,
			-- null_ls.register({
			-- 	name = "gci",
			-- 	method = null_ls.methods.FORMATTING,
			-- 	filetypes = { "go" },
			-- 	generator = null_ls.generator({
			-- 		command = "gci",
			-- 		args = function(params)
			-- 			return { "print", params.bufname }
			-- 		end,
			-- 		to_stdin = false,
			-- 		on_output = function(_, done)
			-- 			done()
			-- 			return nil
			-- 		end,
			-- 	}),
			-- }),

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
