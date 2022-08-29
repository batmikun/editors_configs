vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<C-x>d', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<C-x>p', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<C-x>n', vim.diagnostic.goto_next, opts)

vim.api.nvim_create_autocmd("CursorHold", {
  buffer = bufnr,
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end
})

