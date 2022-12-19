local options = vim.opt

-- global options
options.swapfile = false
options.backup = false
options.undofile = true
options.dir = "/tmp"
options.smartcase = true
options.hlsearch = false
options.incsearch = true
options.ignorecase = true
options.scrolloff = 12
options.laststatus = 2
options.showtabline = 2
options.termguicolors = true
options.updatetime = 50

-- window-local options
options.number = true
options.relativenumber = true
options.wrap = true

-- buffer-local options
options.expandtab = true
options.shiftwidth = 4
options.tabstop = 4
options.smartindent = true

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- Disable nvim intro
vim.opt.shortmess:append "sI"

-- -- Disable builtin plugins
local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
   "tutor",
   "rplugin",
   "synmenu",
   "optwin",
   "compiler",
   "bugreport",
   "ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
   vim.g["loaded_" .. plugin] = 1
end
