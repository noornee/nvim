local M = {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp" },
	},
}

M.config = function()
	local lspconfig = require("lspconfig")
	local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	local on_attach = function(client, bufnr)
		local bufopts = { noremap = true, silent = true, buffer = 0 }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, bufopts)
		vim.keymap.set("n", "<space>df", vim.diagnostic.goto_next, bufopts)

		-- if client.supports_method("textDocument/inlayHint") then
		-- 	print("supports inlay hint")
		-- 	vim.lsp.inlay_hint.enable(bufnr, true)
		-- end
	end

	local servers = {
		"gopls",
		"lua_ls",
		"pyright",
		"html",
		"tsserver",
		"rust_analyzer",
		"nil_ls",
	}

	-- custom settings
	local gopls_settings = {
		analyses = {
			unusedparams = true,
		},
		hints = {
			assignVariableTypes = true,
			compositeLiteralFields = true,
			compositeLiteralTypes = true,
			constantValues = true,
			functionTypeParameters = true,
			parameterNames = true,
			rangeVariableTypes = true,
		},
	}

	-- setup servers
	for _, lsp in pairs(servers) do
		lspconfig[lsp].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim", "LUASNIP_ENV" },
						-- LUASNIP_ENV is a custom variable declared in `lua/plugins/luasnip.lua`
					},
					hint = {
						enable = true,
					},
				},
				gopls = gopls_settings,
			},
		})
	end

	--https://github.com/aca/emmet-ls
	lspconfig.emmet_ls.setup({
		filetypes = { "html", "css", "template" },
	})
end

M.toggle_inlay_hints = function()
	local bufnr = vim.api.nvim_get_current_buf()
	vim.lsp.inlay_hint.enable(bufnr, not vim.lsp.inlay_hint.is_enabled(bufnr))
end

return M
