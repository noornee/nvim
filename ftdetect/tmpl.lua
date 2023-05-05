vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*.tmpl",
	command = "set filetype=html",
})
