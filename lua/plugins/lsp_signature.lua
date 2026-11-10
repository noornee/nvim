local M = {
	"ray-x/lsp_signature.nvim",
	event = "VeryLazy",
}

M.config = function()
	require("lsp_signature").setup({
		hint_enable = false,
		handler_opts = {
			border = "none",
		},
	})
end

return M
