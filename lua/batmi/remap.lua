local nnoremap = require("batmi.keymap").nnoremap
local inoremap = require("batmi.keymap").inoremap
local vnoremap = require("batmi.keymap").vnoremap

-- NORMAL MODE REMAP --

-- VIM COMMANDS
nnoremap("<leader>w", "<cmd>:w<CR>")
nnoremap("<leader>c", "<cmd>:q<CR>")
-- TELESCOPE COMMANDS
nnoremap("<leader>ff", "<cmd>:Telescope find_files<CR>")
nnoremap("<leader>fb", "<cmd>:Telescope buffers<CR>")
-- NEO TREE COMMANDS
nnoremap("<leader>nv", "<cmd>:Neotree float<CR>")
nnoremap("<leader>nc", "<cmd>:Neotree close<CR>")

-- INSERT MODE REMAP -- 

-- VIM COMMANDS
inoremap("jj", "<escape>")


-- VISUAL MODE REMAP --
-- VIM COMMANDS
vnoremap("jj", "<escape")

-- COC VIM REMAP
vim.api.nvim_set_keymap("n", "<leader>.", "<Plug>(coc-codeaction)", {})
vim.api.nvim_set_keymap("n", "<leader>l", ":CocCommand eslint.executeAutofix<CR>", {})
vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", {silent = true})
vim.api.nvim_set_keymap("n", "K", ":call CocActionAsync('doHover')<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>rn", "<Plug>(coc-rename)", {})
vim.api.nvim_set_keymap("n", "<leader>f", ":CocCommand prettier.formatFile<CR>", {noremap = true})
vim.api.nvim_set_keymap("i", "<C-Space>", "coc#refresh()", { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<TAB>", "pumvisible() ? '<C-n>' : '<TAB>'", {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap("i", "<S-TAB>", "pumvisible() ? '<C-p>' : '<C-h>'", {noremap = true, expr = true})
vim.api.nvim_set_keymap("i", "<CR>", "pumvisible() ? coc#_select_confirm() : '<C-G>u<CR><C-R>=coc#on_enter()<CR>'", {silent = true, expr = true, noremap = true})
