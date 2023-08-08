local env = LUASNIP_ENV -- global variable declared in `lua/plugins/luasnip.lua`
if env == nil then
	return
end

return {
	env.s("date", env.p(os.date, "%Y-%m-%d")),
	env.s("time", env.p(os.date, "%H:%M")),
}
