local set = vim.opt

set.number = true
set.relativenumber = true
set.cursorline = true
set.colorcolumn = "96"
set.scrolloff = 8 -- keep x lines above/below the cursor
set.termguicolors = true

set.tabstop = 4
set.shiftwidth = 4

set.clipboard = "unnamedplus"
set.swapfile = false
set.undofile = true -- keep undo history across sessions
set.signcolumn = "yes" -- always show, so gitsigns/diagnostics don't shift the text
set.updatetime = 250 -- 0.13 applies diagnostic `current_line` on CursorHold

set.hlsearch = false
set.ignorecase = true -- needed for smartcase to have any effect
set.smartcase = true

set.splitright = true

-- folds come from treesitter (lua/plugins/nvim-treesitter.lua); start with everything open
set.foldlevel = 99
set.foldlevelstart = 99
set.fillchars:append({ diff = "╱" }) -- diagonal padding instead of ------ in diffs

-- Cleaner diffs: histogram aligns moved/restructured code better than the
-- default (myers), and inline:word highlights whole changed words instead of
-- scattered characters.
set.diffopt = {
	"internal",
	"filler",
	"closeoff",
	"indent-heuristic",
	"linematch:40",
	"algorithm:histogram",
	"inline:word",
}
