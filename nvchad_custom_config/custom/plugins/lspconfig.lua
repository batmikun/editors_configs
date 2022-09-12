local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local util = require "lspconfig.util"
local lspconfig = require "lspconfig"
local servers =
  { "html", "cssls", "emmet_ls", "clangd", "jsonls", "tsserver", "ols", "pyright", "hls", "rust_analyzer", "eslint" }

for _, lsp in ipairs(servers) do
  if "ols" == lsp then
    lspconfig[lsp].setup {
      cmd = { "ols" },
      filetypes = { "odin" },
      root_dir = util.root_pattern "ols.json",
      settings = {},
    }
  end

  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
