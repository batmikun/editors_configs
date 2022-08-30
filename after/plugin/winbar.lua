local current_signature = function(width)
  if not pcall(require, 'lsp_signature') then return end
  local sig = require("lsp_signature").status_line(width)
  return sig.label .. "🐼" .. sig.hint
end

vim.o.winbar = "File : %f .. Signature Help : " .. current_signature(150)
