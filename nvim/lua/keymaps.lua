local vim = vim
local map = vim.api.nvim_set_keymap

-- leader key
vim.g.mapleader = " "

-- global keybidings
map("i", "jk", "<esc>", {})
map("n", "<leader>pv", ":Ex<CR>", {})
map("n", "<C-c>", ":noh", {})
