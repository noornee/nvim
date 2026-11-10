local function fzf(picker, opts)
	return function()
		require("fzf-lua")[picker](opts)
	end
end

local small = { height = 0.50, width = 0.80, row = 0.50, col = 0.50, backdrop = 60 }
local tiny = { height = 0.40, width = 0.50, row = 0.50, col = 0.50, backdrop = 60 }

local M = {
	"ibhagwan/fzf-lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>ff", fzf("files", { previewer = false, winopts = small }), desc = "Find files" },
		{ "<leader>fg", fzf("live_grep"), desc = "Live grep" },
		{ "<leader>fb", fzf("buffers"), desc = "Buffers" },
		{ "<leader>b", fzf("buffers", { previewer = false, winopts = tiny }), desc = "Buffers (compact)" },
	},
}

return M
