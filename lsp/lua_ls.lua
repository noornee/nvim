return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" }, -- the Lua that Neovim embeds
			workspace = {
				checkThirdParty = false,
				-- Neovim's runtime: real types/docs for the vim.* API
				library = { vim.env.VIMRUNTIME },
			},
			diagnostics = {
				globals = { "LUASNIP_ENV" }, -- custom global declared in `lua/plugins/luasnip.lua`
			},
			hint = {
				enable = true,
			},
		},
	},
}
