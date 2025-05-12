require("core.options")
require("core.keymaps")
require("core.autocmd")
require("core.lazy")
require("core.diagnostics")

vim.lsp.enable({
	"gopls",
	"lua_ls",
	"nil_ls",
})

vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = { current_line = true },
	underline = true,
	update_in_insert = true,
})
