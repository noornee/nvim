local M = {
	"nvim-treesitter/nvim-treesitter",
	cmd = "TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	branch = "master",
}

M.config = function()
	require("nvim-treesitter.configs").setup({
		-- A list of parser names, or "all"
		ensure_installed = {
			"c",
			"lua",
			"go",
			"bash",
			"python",
			"html",
			"javascript",
			"json",
			"jsonc",
			"nix",
			"rust",
			"norg",
			"vim",
			"vimdoc",
			"http",
			"sql",
		},
		sync_install = false,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		--indent = { enable = true }
	})
end

return M
