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

-- INSERT MODE REMAP --

-- VIM COMMANDS
inoremap("kj", "<escape>")

-- VISUAL MODE REMAP --

require("leap").set_default_keymaps()
