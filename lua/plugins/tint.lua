local M = {
	"levouh/tint.nvim",
	event = "VeryLazy",
}

M.config = function()
	-- Override some defaults
	require("tint").setup({
		tint = -10, -- Darken colors, use a positive value to brighten
		saturation = 0.9, -- Saturation to preserve

		tint_background_colors = true,
		highlight_ignore_patterns = { "WinSeparator", "Status.*" }, -- Highlight group patterns to ignore, see `string.find`
		window_ignore_function = function(winid)
			local bufid = vim.api.nvim_win_get_buf(winid)
			local buftype = vim.api.nvim_buf_get_option(bufid, "buftype")
			local floating = vim.api.nvim_win_get_config(winid).relative ~= ""

			-- Do not tint `terminal` or floating windows, tint everything else
			return buftype == "terminal" or floating
		end,
	})
end

-- M = {}

return M
