local M = {}
M.lsp = {}

--- Whether the cursor is inside a Go struct: a field declaration list or a
--- struct literal. Used by blink.cmp to rank fields first.
---@return boolean
M.is_cursor_in_struct = function()
	if vim.bo.filetype ~= "go" then
		return false
	end

	local ok, node = pcall(vim.treesitter.get_node)
	if not ok then
		return false
	end

	while node do
		local type = node:type()
		if type == "field_declaration_list" then
			return true
		end
		if type == "composite_literal" then
			local parent = node:parent()
			if parent and parent:type() == "expression_list" then
				return true
			end
		end
		node = node:parent()
	end

	return false
end

-- K (hover), grn, grr, gri, gra etc. are Neovim defaults; these are extra
M.lsp.custom_mappings = function(bufnr)
	local function map(lhs, rhs, desc)
		vim.keymap.set("n", lhs, rhs, { desc = desc, silent = true, buffer = bufnr })
	end

	map("<leader>gd", vim.lsp.buf.definition, "Go to definition")
	map("<leader>gi", vim.lsp.buf.implementation, "Go to implementation")
	map("<leader>gr", vim.lsp.buf.references, "Show references")
	map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
	map("<leader>f", function()
		vim.lsp.buf.format({ async = true })
	end, "Format file")
	map("<leader>ih", function()
		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
	end, "Toggle inlay hints")
end

return M
