local M = {
	"ibhagwan/fzf-lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{
			"<space>ff",
			"<cmd>lua require('fzf-lua').files({previewer = false, winopts={height=0.50,width=0.80,row=0.50,col=0.50,backdrop=60}})<CR>",
		},
		{
			"<space>fg",
			"<cmd>lua require('fzf-lua').live_grep()<CR>",
		},
		{
			"<space>fb",
			"<cmd>lua require('fzf-lua').buffers()<CR>",
		},
		{
			"<space>b",
			"<cmd>lua require('fzf-lua').buffers({previewer = false, winopts={height=0.40,width=0.50,row=0.50,col=0.50,backdrop=60}})<CR>",
		},
	},
}

return M
