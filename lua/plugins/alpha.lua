local M = {
	"goolord/alpha-nvim",
}

M.config = function()
	require("alpha").setup(require("alpha.themes.startify").config)
end

return M
