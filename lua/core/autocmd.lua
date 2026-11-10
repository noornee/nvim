local autocmd = vim.api.nvim_create_autocmd
local augroup = function(name)
	return vim.api.nvim_create_augroup(name, { clear = true })
end

-- highlight on yank
autocmd("TextYankPost", {
	group = augroup("HighlightYank"),
	callback = function()
		if vim.hl.hl_op then
			vim.hl.hl_op() -- 0.13+
		else
			vim.hl.on_yank() -- 0.12
		end
	end,
})

-- format on save
autocmd("BufWritePre", {
	group = augroup("FormatOnSave"),
	pattern = { "*.lua", "*.go", "*.html", "*.rs", "*.nix", "*.sql" },
	callback = function(args)
		vim.lsp.buf.format({ bufnr = args.buf, async = false })
	end,
})

-- buffer-local LSP keymaps
autocmd("LspAttach", {
	group = augroup("LspMappings"),
	callback = function(args)
		require("core.utils").lsp.custom_mappings(args.buf)
	end,
})

-- shebang for new shell scripts
autocmd("BufNewFile", {
	group = augroup("ShellShebang"),
	pattern = "*.sh",
	callback = function()
		vim.api.nvim_buf_set_lines(0, 0, 1, false, { "#!/usr/bin/env bash" })
	end,
})

-- create missing directories before saving .norg files
autocmd("BufWritePre", {
	group = augroup("NorgMkdir"),
	pattern = "*.norg",
	callback = function(args)
		local dir = vim.fs.dirname(args.match)
		if vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, "p")
		end
	end,
})
