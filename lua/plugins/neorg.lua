local M = {
	"nvim-neorg/neorg",
	version = "*",
	lazy = false,
	init = function()
		-- lazy.nvim builds neorg's tree-sitter parsers with luarocks (see rocks in
		-- core/lazy.lua) but doesn't put them where tree-sitter looks, so add them.
		local rocks = vim.fn.stdpath("data") .. "/lazy-rocks/"
		vim.opt.rtp:append(rocks .. "tree-sitter-norg/lib/lua/5.1")
		vim.opt.rtp:append(rocks .. "tree-sitter-norg-meta/lib/lua/5.1")
	end,
	keys = {
		{ "<leader>Nw", "<cmd>Neorg workspace notes<CR>", desc = "Neorg: open notes" },
	},
}

M.config = function()
	require("neorg").setup({
		load = {
			["core.defaults"] = {}, -- Loads default behaviour
			["core.concealer"] = {}, -- Pretty icons for headings, lists, todos
			-- Let Neovim find the norg parsers (site/parser first) instead of neorg loading them
			-- from lazy-rocks, whose prebuilt ones can't load on NixOS (missing libstdc++).
			["core.integrations.treesitter"] = { config = { configure_parsers = false } },
			["core.dirman"] = { -- Manages Neorg workspaces
				config = {
					workspaces = {
						notes = vim.fn.expand("~/notes"),
					},
					default_workspace = "notes",
				},
			},
		},
	})
end

return M
