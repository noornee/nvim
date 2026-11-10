local M = {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false, -- the `main` branch does not support lazy-loading
	build = ":TSUpdate",
}

M.config = function()
	require("nvim-treesitter").install({
		"c",
		"lua",
		"go",
		"bash",
		"python",
		"html",
		"javascript",
		"json",
		"nix",
		"rust",
		"vim",
		"vimdoc",
		"http",
		"sql",
	})

	vim.api.nvim_create_autocmd("FileType", {
		group = vim.api.nvim_create_augroup("treesitter.setup", { clear = true }),
		callback = function(args)
			local lang = vim.treesitter.language.get_lang(args.match) or args.match
			-- skip buffers that have no parser (plugin UIs, plain text, …)
			if vim.treesitter.language.add(lang) then
				vim.treesitter.start(args.buf, lang)
			end
		end,
	})
end

return M
