local map = vim.api.nvim_set_keymap

-- leader key
vim.g.mapleader = " "

-- global keybidings
map("i", "jk", "<esc>", { noremap = true })

