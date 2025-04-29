local M = {
	"saghen/blink.cmp",
	version = "1.*",
	opts = {
		keymap = { preset = "enter" },
		snippets = { preset = "luasnip" },
		fuzzy = {
			implementation = "prefer_rust_with_warning",
			sorts = { "sort_text", "score" },
		},
		sources = {
			default = {
				"lsp",
				"path",
				"snippets",
				"buffer",
			},
		},
		cmdline = {
			completion = { menu = { auto_show = true } },
			sources = function()
				local type = vim.fn.getcmdtype()
				if type == "/" or type == "?" then
					return { "buffer" }
				end
				if type == ":" or type == "@" then
					return { "cmdline" }
				end
				return {}
			end,
		},
		appearance = {
			nerd_font_variant = "normal",
			kind_icons = {
				Text = "󰉿",
				Method = "󰊕",
				Function = "ƒ ",
				Constructor = "󰒓",

				Field = "󰜢",
				Variable = " ",
				Property = "󰖷",

				Class = "",
				Interface = "󰜰",
				Struct = "󱡠 ",
				Module = "󰅩",

				Unit = "󰪚",
				Value = "󰦨",
				Enum = "了",
				EnumMember = "",

				Keyword = "󰻾",
				Constant = "",

				Snippet = "󱄽",
				Color = "󰏘",
				File = "󰈔",
				Reference = "󰬲",
				Folder = "󰉋",
				Event = "󱐋",
				Operator = "󰪚",
				TypeParameter = "󰬛",
			},
		},
	},
	opts_extend = { "sources.default" },
}
return M
