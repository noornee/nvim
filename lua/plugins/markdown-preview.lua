local M = {
	"iamcco/markdown-preview.nvim",
	build = "cd app && yarn install",
	ft = "markdown",
	keys = {
		{ "<A-m>", "<cmd>MarkdownPreviewToggle<CR>", desc = "Toggle Markdown Preview" },
	},
}

return M
