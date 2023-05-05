local set = vim.opt

set.number = true
set.relativenumber = true
set.mouse = "a"
set.tabstop = 4
set.shiftwidth = 4
set.scrolloff = 8
set.clipboard = "unnamedplus"
set.swapfile = false
set.hlsearch = false
set.incsearch = true
set.cursorline = true
set.termguicolors = true

vim.cmd([[let g:netrw_fastbrowse = 0]]) -- this closes netrw after entering a buffer. [e.g. executing `nvim .` in the current dir and opening a file]

vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "
