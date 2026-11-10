local M = {
	"L3MON4D3/LuaSnip",
}

M.config = function()
	local ls = require("luasnip")

	-- global used by the files in `snippets/`
	LUASNIP_ENV = {
		s = require("luasnip.nodes.snippet").S,
		i = require("luasnip.nodes.insertNode").I,
		fmt = require("luasnip.extras.fmt").fmt,
		parse = require("luasnip.util.parser").parse_snippet,
		p = require("luasnip.extras").partial,
	}

	ls.config.setup({
		history = true,
		update_events = "TextChanged,TextChangedI",
		enable_autosnippets = true,
	})

	require("luasnip.loaders.from_lua").lazy_load({
		paths = { vim.fn.stdpath("config") .. "/snippets" },
	})

	vim.keymap.set({ "i", "s" }, "<A-l>", function()
		if ls.jumpable(1) then
			ls.jump(1)
		end
	end, { desc = "Snippet: next node" })

	vim.keymap.set({ "i", "s" }, "<A-h>", function()
		if ls.jumpable(-1) then
			ls.jump(-1)
		end
	end, { desc = "Snippet: previous node" })
end

return M
