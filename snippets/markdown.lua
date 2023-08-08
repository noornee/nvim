local env = LUASNIP_ENV -- global variable declared in `lua/plugins/luasnip.lua`
if env == nil then
	return
end

return {
	env.s(
		{ trig = "link" },
		env.fmt(
			[[
      [{}]({}){}
      ]],
			{
				env.i(1, "name"),
				env.i(2, "url"),
				env.i(0),
			}
		)
	),
}
