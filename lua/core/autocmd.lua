-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- format on save
local fmtGroup = vim.api.nvim_create_augroup("FormatOnSave", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	group = fmtGroup,
	pattern = { "*.lua", "*.go", "*.html", "*.rs", "*.json", "*.py", "*.nix", "*.sql" },
	command = "lua vim.lsp.buf.format({ async = false, })",
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(arg)
		-- local client = vim.lsp.get_client_by_id(arg.data.client_id)
		local utils = require("core.utils")
		-- if client:supports_method("textDocument/completion") then
		-- 	vim.lsp.completion.enable(true, client.id, arg.buf, { autotrigger = true })
		-- end
		utils.lsp.custom_mappings(arg.buf)
	end,
})
