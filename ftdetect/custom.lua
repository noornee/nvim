vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "bookmarks.txt,xresources",
	command = "set filetype=conf",
})
