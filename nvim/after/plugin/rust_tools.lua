local rt = require("rust-tools")
local keymap = vim.keymap.set

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      keymap("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
      keymap("n", "<Leader>la", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})
