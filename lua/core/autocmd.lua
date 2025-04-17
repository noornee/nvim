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

-- https://www.reddit.com/r/neovim/comments/1jpbc7s/disable_virtual_text_if_there_is_diagnostic_in/
local og_virt_text
local og_virt_line
vim.api.nvim_create_autocmd({ "CursorMoved", "DiagnosticChanged" }, {
	group = vim.api.nvim_create_augroup("diagnostic_only_virtlines", {}),
	callback = function()
		if og_virt_line == nil then
			og_virt_line = vim.diagnostic.config().virtual_lines
		end

		-- ignore if virtual_lines.current_line is disabled
		if not (og_virt_line and og_virt_line.current_line) then
			if og_virt_text then
				vim.diagnostic.config({ virtual_text = og_virt_text })
				og_virt_text = nil
			end
			return
		end

		if og_virt_text == nil then
			og_virt_text = vim.diagnostic.config().virtual_text
		end

		local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1

		if vim.tbl_isempty(vim.diagnostic.get(0, { lnum = lnum })) then
			vim.diagnostic.config({ virtual_text = og_virt_text })
		else
			vim.diagnostic.config({ virtual_text = false })
		end
	end,
})

-- vim.api.nvim_create_autocmd("ModeChanged", {
-- 	group = vim.api.nvim_create_augroup("diagnostic_redraw", {}),
-- 	callback = function()
-- 		pcall(vim.diagnostic.show)
-- 	end,
-- })
