local env = LUASNIP_ENV -- global variable declared in `lua/plugins/luasnip.lua`
if env == nil then
	return
end

return {
	env.s(
		"dt",
		env.fmt(
			[[
	Date: {date}
	Time: {time}
	]],
			{
				date = env.p(os.date, "%Y-%m-%d"),
				time = env.p(os.date, "%H:%M"),
			}
		)
	),
}
