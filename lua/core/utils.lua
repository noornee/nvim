local M = {}
M.lsp = {}

--- Checks if the cursor is currently inside a struct context.
-- This includes being within a struct's field declaration list
-- or inside a struct instantiation (composite_literal).
-- @return boolean true if cursor is in a struct-related context, else false.
M.is_cursor_in_struct = function()
	local ts_utils = require("nvim-treesitter.ts_utils")
	local node = ts_utils.get_node_at_cursor()

	-- Walk up the syntax tree to find the relevant node
	while node do
		local type = node:type()

		-- Check if we're inside a composite_literal (struct instantiation)
		if type == "composite_literal" then
			-- Check if the parent node is an expression list, which indicates we're inside a struct initialization
			local parent = node:parent()
			if parent and parent:type() == "expression_list" then
				return true -- We are inside a struct instantiation block
			end
		end

		-- If we're inside the field_declaration_list node, it's part of a struct's fields
		if type == "field_declaration_list" then
			return true -- We're inside the field declaration list of a struct
		end

		-- Move up to the parent node to continue searching
		node = node:parent()
	end

	-- If we're not inside a struct or its field list, return false
	return false
end

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
