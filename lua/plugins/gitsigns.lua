local M = {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{
			"<leader>dd",
			function()
				-- Toggle: close the git-side window if a gitsigns diff is open, otherwise open one
				for _, w in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
					local name = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
					if name:match("^gitsigns://") then
						vim.api.nvim_win_close(w, false)
						return
					end
				end
				require("gitsigns").diffthis()
			end,
			desc = "Toggle git diff of current file",
		},
	},
}

M.config = function()
	require("gitsigns").setup({
		current_line_blame = true, -- :Gitsigns toggle_current_line_blame
		current_line_blame_opts = {
			delay = 300, -- show sooner (default 1000ms)
		},
		-- e.g. "<commit icon> noornee • 4 days ago • chore: cleanups"
		current_line_blame_formatter = "   \u{f417} <author> • <author_time:%R> • <summary>",
	})
end

return M
