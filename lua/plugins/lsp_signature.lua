local M = {
	"ray-x/lsp_signature.nvim",
}

M.config = function()
	local lsp_signature = require("lsp_signature")

	lsp_signature.setup({
		hint_enable = false, -- virtual hint enable
		hint_prefix = "💡", -- Bulb for parameter, NOTE: for the terminal not support emoji, might crash
		handler_opts = {
			border = "none", -- double, rounded, single, shadow, none, or a table of borders
		},
	})
end

return M
