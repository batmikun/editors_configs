local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "ols",
  "clangd",
  "gopls",
  "zls",
  "html",
  "cssls",
  "emmet_ls",
  "jsonls",
  "tsserver",
  "hls",
  "rust_analyzer",
  "eslint",
  "taplo",
  "pylsp",
}

for _, lsp in ipairs(servers) do
  if lsp == "ols" then
    lspconfig[lsp].setup {
      cmd = { "ols" },
      filetypes = { "odin" },
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end

  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
