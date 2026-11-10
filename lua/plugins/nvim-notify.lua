local M = {
	"rcarriga/nvim-notify",
}

M.config = function()
	local notify = require("notify")

	notify.setup({
		timeout = 5000,
		top_down = false,
		background_colour = "#000000",
	})

	vim.notify = notify

	vim.keymap.set("n", "<Esc>", function()
		notify.dismiss({ silent = true, pending = true })
	end, { desc = "Dismiss notifications" })
end

return M
