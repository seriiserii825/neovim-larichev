-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

-- use jk to exit insert mode
vim.keymap.set("i", "jj", "<ESC>")

-- nnoremap <expr> <leader>fw ':Files <cr>' . "'" . expand('<cword>')

-- vim.keymap.set("<leader>fw", "':Files <cr>' . "'" . expand('<cword>')", "<ESC>")


-- Reset highlight
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")

-- Use alt + hjkl to resize windows
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- navigate throw windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
