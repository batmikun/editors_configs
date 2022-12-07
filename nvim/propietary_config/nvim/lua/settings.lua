local options = vim.opt

-- options options
options.swapfile = true
options.dir = "/tmp"
options.smartcase = true
options.laststatus = 2
options.hlsearch = true
options.incsearch = true
options.ignorecase = true
options.scrolloff = 12
options.termguicolors = true

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
