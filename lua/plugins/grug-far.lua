local M = {
	"MagicDuck/grug-far.nvim",
	cmd = "GrugFar",
}

M.config = function()
	require("grug-far").setup({})
end

return M
