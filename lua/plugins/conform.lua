local M = {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = "ConformInfo",
}

M.config = function()
	local format_on_save_ft = {
		lua = true,
		go = true,
		html = true,
		rust = true,
		nix = true,
		-- sql = true,
	}

	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "goimports", "gofumpt" },
			python = { "black" },
			nix = { "nixfmt" },
			sql = { "sql_formatter" },
			html = { "prettier" },
			css = { "prettier" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
		},
		format_on_save = function(bufnr)
			if not format_on_save_ft[vim.bo[bufnr].filetype] then
				return
			end
			-- Use the formatters above; only fall back to the LSP when none are set.
			return { timeout_ms = 1000, lsp_format = "fallback" }
		end,
	})
end

return M
