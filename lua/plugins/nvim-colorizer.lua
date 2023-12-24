local M = {
	"norcalli/nvim-colorizer.lua",
}

M.config = function()
	local color = require("colorizer")

	color.setup({
		"html",
		"css",
		"yaml",
		"lua",
		go = { mode = "foreground" },
	})
end

return M
