local env = LUASNIP_ENV -- global variable declared in `lua/plugins/luasnip.lua`
if env == nil then
	return
end

return {
	env.s(
		{ trig = "mainf", snippetType = "autosnippet" },
		env.fmt(
			[[
		package main

		func main() {{
			{}
		}}
		]],
			{ env.i(1, "") }
		)
	),

	env.s(
		{ trig = "cerr" },
		env.fmt(
			[[
		if err != nil {{
			log.Println({})
		}}
		]],
			{ env.i(1, "err") }
		)
	),
}
