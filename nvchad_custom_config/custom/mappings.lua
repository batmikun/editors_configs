local M = {}

M.general = {
  n = {
    [";"] = { ":", "command mode", opts = { nowait = true } },
    ["<leader>q"] = { ":q<CR>", "exit neovim" },
    ["<space>bn"] = { ":bn<CR>", "go to next buffer" },
    ["<space>w"] = { ":w<CR>", "Save" },
  },

  i = {
    ["jk"] = { "<ESC>", "escape vim" },
  },
}

M.truzen = {
  n = {
    ["<leader>ta"] = { "<cmd> TZAtaraxis <CR>", "truzen ataraxis" },
    ["<leader>tm"] = { "<cmd> TZMinimalist <CR>", "truzen minimal" },
    ["<leader>tf"] = { "<cmd> TZFocus <CR>", "truzen focus" },
  },
}

M.treesitter = {
  n = {
    ["<leader>cu"] = { "<cmd> TSCaptureUnderCursor <CR>", "find media" },
  },
}

M.navigation = {
  n = {
    ["H"] = { "^", "beginning of line" },
    ["L"] = { "$", "end of line" },
  },
}

return M
