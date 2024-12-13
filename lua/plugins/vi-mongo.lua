return {
	"kopecmaciej/vi-mongo.nvim",
	config = function()
		require("vi-mongo").setup({
			row = 10,
			col = 10,
			width = 10,
			height = 10,
		})
	end,
	cmd = { "ViMongo" },
	keys = {
		{ "<leader>vm", "<cmd>ViMongo<cr>", desc = "ViMongo" },
	},
}
