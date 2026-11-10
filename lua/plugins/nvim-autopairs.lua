local M = {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
}

M.config = function()
	require("nvim-autopairs").setup({
		fast_wrap = {}, -- <M-e> to wrap the next item in a pair
	})
end

return M
