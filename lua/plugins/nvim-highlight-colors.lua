-- only highlight colors in these filetypes (the plugin otherwise attaches to every buffer)
local filetypes = { html = true, css = true, yaml = true, lua = true, go = true }

return {
	"brenoprata10/nvim-highlight-colors",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		render = "background",
		exclude_buffer = function(bufnr)
			return not filetypes[vim.bo[bufnr].filetype]
		end,
	},
}
