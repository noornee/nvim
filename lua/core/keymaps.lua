local map = vim.keymap.set
local opts = { silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = ";"
map("n", " ", "<Nop>", opts)

-- move the selected lines
-- "x" (visual only, not select mode) so these don't hijack typing in snippet placeholders
map("x", "K", ":m '<-2<CR>gv=gv", opts)
map("x", "J", ":m '>+1<CR>gv=gv", opts)

-- make the current file executable
map("n", "<A-x>", "<cmd>!chmod +x %<CR>", opts)

-- ' acts as <C-w> (window commands)
map("n", "'", "<C-w>", opts)

-- keep selection when indenting
map("x", "<", "<gv", opts)
map("x", ">", ">gv", opts)

-- paste over a selection without yanking it: use the built-in visual `P`

-- toggle diagnostics (signs, virtual text/lines, underline) for all buffers
map("n", "<leader>td", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostics" })
