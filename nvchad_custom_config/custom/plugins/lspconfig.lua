local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "nimls",
  "clangd",
  "gopls",
  "zls",
  "html",
  "cssls",
  "emmet_ls",
  "clangd",
  "jsonls",
  "tsserver",
  "pyright",
  "hls",
  "rust_analyzer",
  "eslint",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
