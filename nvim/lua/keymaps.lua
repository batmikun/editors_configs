local vim = vim

-- leader key
vim.g.mapleader = " "

-- global keybidings
vim.keymap.set("i", "jk", "<esc>", {})
vim.keymap.set("n", "<leader>pv", ":Ex<CR>", {})
vim.keymap.set("n", "<C-c>", ":noh", {})

-- move highlighted text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv'")

-- move text to the same line
vim.keymap.set("n", "J", "mzJ`z")

-- keep cursor in the middle when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- copy to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- replace current word appareance
vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


