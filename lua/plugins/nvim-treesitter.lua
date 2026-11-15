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
			if not vim.treesitter.language.add(lang) then
				return
			end
			vim.treesitter.start(args.buf, lang)

			-- treesitter-based folds (all open by default, see foldlevel in options.lua)
			vim.wo[0][0].foldmethod = "expr"
			vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"

			-- treesitter-based indentation, only for languages that ship indent queries
			if vim.treesitter.query.get(lang, "indents") then
				vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end
		end,
	})
end

return M
