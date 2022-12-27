local keymap = vim.keymap.set
local opts = { noremap = true, silent = true}

-- leader key
vim.g.mapleader = " "

-- NORMAL ----------------------------------
keymap("n", "<C-c>", ":noh", opts)

-- move text to the same line
keymap("n", "J", "mzJ`z", opts)

keymap("n", "<leader>pv", ":Ex<CR>", opts)

-- copy to system clipboard
keymap("n", "<leader>y", "\"+y", opts)
keymap("n", "<leader>Y", "\"+Y", opts)

-- replace current word appareance
keymap("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- keep cursor in the middle when scrolling
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-b>", "<C-b>zz", opts)

-- Better window navigation
keymap("n", "<m-h>", "<C-w>h", opts)
keymap("n", "<m-j>", "<C-w>j", opts)
keymap("n", "<m-k>", "<C-w>k", opts)
keymap("n", "<m-l>", "<C-w>l", opts)
keymap("n", "<m-tab>", "<c-6>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "n", "nzzzv", opts)
-- Recenter when jumping to next match
keymap("n", "N", "Nzzzv", opts)

-- beggining_of_line - end_of_line
keymap("n", "H", "^", opts)
keymap("n", "L", "$", opts)

-- move text up and down
keymap("n", "<A-K>", "<Esc>:m .-2<CR>==g", opts)
keymap("n", "<A-J>", "<Esc>:m .+1<CR>==g", opts)

-- INSERT -----------------------------------

-- global keybidings
keymap("i", "jk", "<esc>", opts)


-- VISUAL -----------------------------------

-- beggining_of_line - end_of_line
keymap("v", "H", "^", opts)
keymap("v", "L", "$", opts)

-- copy to system clipboard
keymap("v", "<leader>y", "\"+y")

-- keep highlighted after indentation
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- VISUAL BLOCK -----------------------------

-- beggining_of_line - end_of_line
keymap("x", "H", "^", opts)
keymap("x", "L", "$", opts)

-- move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
