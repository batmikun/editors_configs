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
nnoremap("<leader>fg", "<cmd>:Telescope live_grep<CR>")
-- EX COMMANDS
nnoremap("<leader>nv", "<cmd>:Ex<CR>")
-- COC COMMANDS
nnoremap("gd", "<Plug>(coc-definition)")
nnoremap("K", ":call CocActionAsync('doHover')<CR>", {silent = true, noremap = true})
nnoremap("<leader>.", "<Plug>(coc-codeaction)")
-- INSERT MODE REMAP -- 

-- VIM COMMANDS
inoremap("jk", "<escape>")
inoremap("kj", "<escape>")

-- COC COMMANDS
inoremap("<CR>", "coc#pum#visible() ? coc#pum#confirm() : '<CR>'", {silent = true, expr = true})
inoremap("<c-space>", "coc#refresh()", {expr = true, silent = true})

-- VISUAL MODE REMAP --

-- VIM COMMANDS
vnoremap("jj", "<escape")

