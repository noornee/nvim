local M = {}
M.lsp = {}

M.lsp.custom_mappings = function(bufnr)
	vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {
		desc = "Go to symbol definition",
		noremap = true,
		silent = true,
		buffer = bufnr,
	})

	vim.keymap.set("n", "K", vim.lsp.buf.hover, {
		desc = "Trigger hover window from the language server",
		noremap = true,
		silent = true,
		buffer = bufnr,
	})

	vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {
		desc = "Go to Implementation",
		noremap = true,
		silent = true,
		buffer = bufnr,
	})

	vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {
		desc = "Show references",
		noremap = true,
		silent = true,
		buffer = bufnr,
	})

	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {
		desc = "Rename current symbol",
		noremap = true,
		silent = true,
		buffer = bufnr,
	})

	vim.keymap.set("n", "<leader>f", function()
		vim.lsp.buf.format({ async = true })
	end, {
		desc = "format file",
		noremap = true,
		silent = true,
		buffer = bufnr,
	})

	vim.keymap.set("n", "<leader>ih", function()
		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
	end, {
		desc = "Toggle Inlay Hints",
		noremap = true,
		silent = true,
		buffer = bufnr,
	})
end

return M
