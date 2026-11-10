local map = vim.keymap.set
local opts = { silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = ";"
map("n", " ", "<Nop>", opts)

-- move the selected lines
map("v", "K", ":m '<-2<CR>gv=gv", opts)
map("v", "J", ":m '>+1<CR>gv=gv", opts)

-- make the current file executable
map("n", "<A-x>", "<cmd>!chmod +x %<CR>", opts)

-- ' acts as <C-w> (window commands)
map("n", "'", "<C-w>", opts)

-- keep selection when indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- paste over a selection without yanking it
map("v", "p", '"_dp')
map("v", "P", '"_dP')
