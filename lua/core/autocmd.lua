local autocmd = vim.api.nvim_create_autocmd
local augroup = function(name)
	return vim.api.nvim_create_augroup(name, { clear = true })
end

-- highlight on yank
autocmd("TextYankPost", {
	group = augroup("HighlightYank"),
	callback = function()
		if vim.hl.hl_op then
			vim.hl.hl_op() -- 0.13+
		else
			vim.hl.on_yank() -- 0.12
		end
	end,
})

-- buffer-local LSP keymaps
autocmd("LspAttach", {
	group = augroup("LspMappings"),
	callback = function(args)
		require("core.utils").lsp.custom_mappings(args.buf)
	end,
})

-- shebang for new shell scripts
autocmd("BufNewFile", {
	group = augroup("ShellShebang"),
	pattern = "*.sh",
	callback = function()
		vim.api.nvim_buf_set_lines(0, 0, 1, false, { "#!/usr/bin/env bash" })
	end,
})

-- create missing directories before saving .norg files
autocmd("BufWritePre", {
	group = augroup("NorgMkdir"),
	pattern = "*.norg",
	callback = function(args)
		local dir = vim.fs.dirname(args.match)
		if vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, "p")
		end
	end,
})

-- Diff windows: color the left (old) side red and the right (new) side green,
-- and use plain line numbers so both sides are easy to compare.
-- The old side gets its own highlight namespace where the diff groups use the red
-- DiffOld* colors. ('winhighlight' would be simpler, but Neovim doesn't apply it
-- to diff highlights.)
local diff_old_ns = vim.api.nvim_create_namespace("diff_old_side")
local function set_old_side_colors()
	local get = function(name)
		return vim.api.nvim_get_hl(0, { name = name, link = false })
	end
	vim.api.nvim_set_hl(diff_old_ns, "DiffAdd", get("DiffOldLine"))
	vim.api.nvim_set_hl(diff_old_ns, "DiffChange", get("DiffOldChange"))
	vim.api.nvim_set_hl(diff_old_ns, "DiffText", get("DiffOldText"))
	vim.api.nvim_set_hl(diff_old_ns, "DiffDelete", get("DiffDelete"))
end

local function style_diff_windows()
	set_old_side_colors() -- refresh, in case the colorscheme changed
	local wins = vim.tbl_filter(function(w)
		return vim.wo[w].diff
	end, vim.api.nvim_tabpage_list_wins(0))
	table.sort(wins, function(a, b)
		return vim.api.nvim_win_get_position(a)[2] < vim.api.nvim_win_get_position(b)[2]
	end)
	for i, w in ipairs(wins) do
		vim.api.nvim_win_set_hl_ns(w, (i == 1 and #wins > 1) and diff_old_ns or 0)
		vim.wo[w].relativenumber = false
		vim.w[w].styled_diff = true
	end
	-- restore windows that have left diff mode
	for _, w in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
		if vim.w[w].styled_diff and not vim.wo[w].diff then
			vim.api.nvim_win_set_hl_ns(w, 0)
			vim.wo[w].relativenumber = true
			vim.w[w].styled_diff = nil
		end
	end
end
-- DiffUpdated is the reliable trigger: `:diffthis` (used by claudecode.nvim) does not fire OptionSet.
autocmd({ "DiffUpdated", "OptionSet", "WinEnter", "BufWinEnter", "TabEnter" }, {
	group = augroup("DiffSides"),
	callback = function(ev)
		if ev.event == "OptionSet" and ev.match ~= "diff" then
			return
		end
		vim.schedule(style_diff_windows)
	end,
})
