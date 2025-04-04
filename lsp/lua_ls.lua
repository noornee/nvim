return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".git", ".luarc.json" },
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
	},
}
