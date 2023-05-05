local M = {
	"norcalli/nvim-colorizer.lua",
}

M.config = function()
	local color = require("colorizer")
	color.setup()
end

return M
