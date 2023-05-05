local M = {
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	ft = "rust",
	keys = {
		{
			"<leader>l",
			"<cmd>lua require('lsp_lines').toggle()<CR>",
			"Toggle lsp_lines",
		},
	},
}

M.config = function()
	require("lsp_lines").setup({
		vim.diagnostic.config({
			virtual_text = false, -- Disable virtual_text since it's redundant due to lsp_lines.
			-- virtual_lines = { only_current_line = true },
		}),
	})
end

return M
