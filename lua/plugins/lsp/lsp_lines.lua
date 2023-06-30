local M = {
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	ft = "rust",
}

M.config = function()
	require("lsp_lines").setup({
		vim.keymap.set("n", "<leader>l", ":lua require('lsp_lines').toggle()<CR>", { noremap = true, silent = true }), -- Toggle lsp lines
		vim.diagnostic.config({
			virtual_text = false, -- Disable virtual_text since it's redundant due to lsp_lines.
		}),
	})
end

return M
