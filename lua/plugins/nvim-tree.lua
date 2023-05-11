local M = {
	"nvim-tree/nvim-tree.lua",
	keys = {
		{ "<C-t>", "<cmd>NvimTreeToggle<CR>", desc = "toggle NvimTree" },
		{ "<F3>", "<cmd>NvimTreeToggle<CR>", desc = "toggle NvimTree" },
	},
}

M.config = function()
	local function my_on_attach(bufnr)
		local api = require("nvim-tree.api")

		local function opts(desc)
			return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		end

		-- use all default mappings
		api.config.mappings.default_on_attach(bufnr)

		-- removes the default mapping; already have <C-t> mapped to toggle nvim-tree
		vim.keymap.del("n", "<C-t>", { buffer = bufnr })

		-- add your mappings
		vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
	end

	local nvim_tree = require("nvim-tree")

	nvim_tree.setup({
		on_attach = my_on_attach,
	})
end

return M
