vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.errorbells = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.cmdheight = 2
vim.opt.incsearch = true
vim.opt.showmode = false
vim.opt.smartcase = true
vim.opt.shortmess:append("c")
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo"
vim.opt.undofile = true
vim.opt.signcolumn = "yes"

vim.o.hidden = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 300

vim.notify = require("notify")

vim.g.mapleader = " "
