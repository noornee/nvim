local M = {
	"saghen/blink.cmp",
	version = "1.*",
	opts = {
		keymap = { preset = "enter" },
		snippets = { preset = "luasnip" },
		fuzzy = {
			implementation = "prefer_rust_with_warning",
			sorts = {
				function(a, b)
					local ok, utils = pcall(require, "core.utils")
					if ok and utils.is_cursor_in_struct() then
						-- :lua vim.print(vim.lsp.protocol.CompletionItemKind)
						local is_field_a = a.kind == vim.lsp.protocol.CompletionItemKind.Field
						local is_field_b = b.kind == vim.lsp.protocol.CompletionItemKind.Field

						-- If one is a field and the other isn't, prioritize the field
						if is_field_a ~= is_field_b then
							return is_field_a -- If `a` is a field, it comes first, else `b` will come first
						end
					end
				end,
				"score",
				"sort_text",
			},
		},
		completion = {
			documentation = { auto_show = true },
			menu = {
				draw = {
					columns = { { "label" }, { "kind_icon", "kind" }, { "source_name" } },
					components = {
						source_name = {
							text = function(ctx)
								return "[" .. ctx.source_name .. "]" -- e.g. [LSP]
							end,
						},
					},
				},
			},
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
			keymap = {
				-- ["<Up>"] = { "select_prev", "fallback" },
				-- ["<Down>"] = { "select_next", "fallback" },
			},
			completion = { menu = { auto_show = true } },
			sources = function()
				local type = vim.fn.getcmdtype()
				if type == "/" or type == "?" then
					return { "buffer" }
				end
				if type == ":" or type == "@" then
					return { "path", "cmdline" }
				end
				return {}
			end,
		},
		appearance = {
			nerd_font_variant = "normal",
			kind_icons = {
				Text = "󰉿",
				Method = "󰊕",
				Function = "ƒ",
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
				Constant = "󰏿",

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
