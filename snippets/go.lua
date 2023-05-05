local ls = require("luasnip")

local s = ls.s -- s(<trigger>, <nodes>)
local i = ls.insert_node -- insert node
local fmt = require("luasnip.extras.fmt").fmt -- format node

local snippets, autosnippets = {}, {}

local main_function = s(
	{ trig = "mainf" },
	fmt(
		[[
		package main

		func main() {{
			{}
		}}
		]],
		{ i(1, "") }
	)
)

local check_err = s(
	{ trig = "cerr" },
	fmt(
		[[
		if err != nil {{
			log.Println({})
		}}
		]],
		{ i(1, "err") }
	)
)

table.insert(autosnippets, main_function)
table.insert(autosnippets, check_err)

return snippets, autosnippets
