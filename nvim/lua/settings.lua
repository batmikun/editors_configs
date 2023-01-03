-----------------------------------------------------------
-- Options for neovim 
-----------------------------------------------------------

local vim = vim

local opt_settings = {

    -- global options
    swapfile = false,
    backup = false,
    undofile = true,
    dir = "/tmp",
    smartcase = true,
    hlsearch = false,
    incsearch = true,
    ignorecase = true,
    scrolloff = 12,
    laststatus = 2,
    showtabline = 2,
    termguicolors =true,
    updatetime = 50,
    completeopt = "menuone,noselect,noinsert",
    showmode = false,

    -- window-local options
    number = true,
    relativenumber = true,
    wrap = false,

    -- buffer-local options
    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,
    smartindent = true,
}

for option, value in pairs(opt_settings) do
    vim.opt[option] = value
end

local wo_options = {
    signcolumn = "yes",
    foldmethod = 'expr',
    foldexpr = 'nvim_treesitter#foldexpr()'
}

for option, value in pairs(wo_options) do
    vim.wo[option] = value
end


-----------------------------------------------------------
-- Changing Default Terminal
-----------------------------------------------------------

local powershell_options = {
  shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
  shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
  shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
  shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
  shellquote = "",
  shellxquote = "",
}

for option, value in pairs(powershell_options) do
  vim.opt[option] = value
end

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------

vim.opt.shortmess:append "sI"

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
