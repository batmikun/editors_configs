local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "nimls",
  "ols",
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
  if lsp == "nimls" then
    lspconfig[lsp].setup {
      cmd = { "nimlsp" },
      filetypes = { "nim" },
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end

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
