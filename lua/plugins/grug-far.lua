local M = {
	"MagicDuck/grug-far.nvim",
}

M.config = function()
	require("grug-far").setup({
		-- options, see Configuration section below
		-- there are no required options atm
		engine = "ripgrep", -- default engine, 'astgrep' can be specified
	})
end

return M
