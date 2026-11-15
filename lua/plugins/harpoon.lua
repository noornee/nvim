local function list()
	return require("harpoon"):list()
end

-- Look of the quick menu
local menu_opts = {
	border = "rounded",
	title = " Harpoon ",
	title_pos = "center",
	ui_width_ratio = 0.5,
	height_in_lines = 5,
}

local M = {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()
		harpoon:extend({
			-- Transparent menu background, to match the transparent editor
			UI_CREATE = function(cx)
				local win = cx.win_id
				vim.wo[win].winhighlight = "NormalFloat:Normal"

				-- Size the menu from the current terminal width and center it.
				local function place()
					local width = math.floor(vim.o.columns * menu_opts.ui_width_ratio)
					local height = menu_opts.height_in_lines
					vim.api.nvim_win_set_config(win, {
						relative = "editor",
						width = width,
						height = height,
						row = math.floor((vim.o.lines - height) / 2),
						col = math.floor((vim.o.columns - width) / 2),
					})
				end

				-- Harpoon sizes the menu once, when it opens. Re-size and re-center it
				-- whenever the terminal is resized.
				local group = vim.api.nvim_create_augroup("HarpoonMenuResize", { clear = true })
				vim.api.nvim_create_autocmd("VimResized", {
					group = group,
					callback = function()
						if not vim.api.nvim_win_is_valid(win) then
							return true -- menu closed: remove this autocmd
						end
						place()
					end,
				})
			end,
		})
	end,
	keys = {
		{
			"<leader>ha",
			function()
				list():add()
			end,
			desc = "Harpoon: add file",
		},
		{
			"<leader>hu",
			function()
				require("harpoon").ui:toggle_quick_menu(list(), menu_opts)
			end,
			desc = "Harpoon: menu",
		},
		{
			"<leader>h1",
			function()
				list():select(1)
			end,
			desc = "Harpoon: file 1",
		},
		{
			"<leader>h2",
			function()
				list():select(2)
			end,
			desc = "Harpoon: file 2",
		},
		{
			"<leader>hn",
			function()
				list():next()
			end,
			desc = "Harpoon: next",
		},
	},
}

return M
