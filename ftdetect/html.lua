vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*.html",
	command = "set syntax=html",
})
