--vim.cmd[[autocmd BufNewFile *.py execute 'silent! 1s:.*:#!/usr/bin/python3']]

vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = "*.sh",
	command = "silent! 1s:.*:#!/usr/bin/bash"
})
