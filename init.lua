require("core.options")
require("core.keymaps")
require("core.autocmd")
require("core.lazy")

vim.lsp.enable({
	"gopls",
	"lua_ls",
	"nil_ls",
})

vim.diagnostic.config({
	virtual_text = true,
	underline = true,
})
