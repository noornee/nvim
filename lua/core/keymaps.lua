local opts = { noremap = true, silent = true }

vim.keymap.set("n", " ", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = ";"

-- moves the selected text when in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)

-- create an executable
vim.keymap.set("n", "<A-x>", ":!chmod +x %<CR>", opts)

-- remaps <C-w> with ' (move cursor to Nth window)
vim.keymap.set("n", "'", "<C-w>", opts)

-- better indenting
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- paste over currently selected text without yanking it
vim.keymap.set("v", "p", '"_dp')
vim.keymap.set("v", "P", '"_dP')
