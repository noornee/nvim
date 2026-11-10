local M = {
	"levouh/tint.nvim",
	event = "VeryLazy",
}

M.config = function()
	require("tint").setup({
		tint = -10, -- darken inactive windows
		saturation = 0.9,
		tint_background_colors = true,
		highlight_ignore_patterns = { "WinSeparator", "Status.*" },
		-- don't tint terminals or floating windows
		window_ignore_function = function(winid)
			local buf = vim.api.nvim_win_get_buf(winid)
			local floating = vim.api.nvim_win_get_config(winid).relative ~= ""
			return vim.bo[buf].buftype == "terminal" or floating
		end,
	})
end

return M
