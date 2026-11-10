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
set.updatetime = 250 -- 0.13 applies diagnostic `current_line` on CursorHold

set.hlsearch = false
set.ignorecase = true -- needed for smartcase to have any effect
set.smartcase = true

set.splitright = true
