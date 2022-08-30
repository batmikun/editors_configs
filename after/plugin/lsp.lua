local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require'cmp'

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)

cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<TAB>'] = cmp.mapping.select_next_item(),
      ['<S-TAB>'] = cmp.mapping.select_prev_item(),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
    }),
    sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.recently_used,
            require("clangd_extensions.cmp_scores"),
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
})

  -- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
})

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
})

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
        {
            { name = 'path' }
        },
        {
            { name = 'cmdline' }
        }
    )
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local cmp_capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

local lspconfig = require('lspconfig')

-- PYTHON  npm i -g pyright
lspconfig.pyright.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = cmp_capabilities,
}

-- RUST https://github.com/rust-lang/rust-analyzer/releases -> change extension -> add to path
local options = {
    tools = {
        autoSetHints = true,
        inlay_hints = {
            show_parameter_hints = true,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },
    server = {
        settings = {
            ["rust-analyzer"] = {
                assist = {
                    importEnforceGranularity = true,
                    importPrefix = "crate"
                },
                cargo = {
                    allFeatures = true
                },
                checkOnSave = {
                    command = "clippy"
                },
            },
            inlayHints = {
                lifetimeElisionHints = {
                    enable = true,
                    useParameterNames = true
                },
            },
        }
    },
}

-- RUST EXTENSION
require('rust-tools').setup(options)
-- CLANG EXTENSION
require('clangd_extensions').setup()

-- ELIXIR https://github.com/elixir-lsp/elixir-ls
lspconfig.elixirls.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = { "C:\\Users\\batmi\\.elixir-ls\\language-server.bat" },
    capabilities = cmp_capabilities,
}

-- ODIN https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ols
lspconfig.ols.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = cmp_capabilities,
}

-- TYPESCRIPT npm install -g typescript typescript-language-server
lspconfig.tsserver.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = cmp_capabilities,
}

-- GOLANG https://github.com/golang/tools/tree/master/gopls
lspconfig.gopls.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = cmp_capabilities,
}

-- LUA https://github.com/sumneko/lua-language-server 
lspconfig.sumneko_lua.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = cmp_capabilities,
    settings = {
        Lua = {
            runtime = {
                version = '5.1.5',
            },
            diagnostics = {
                globals = {'vim'},
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

-- HTML https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html
lspconfig.html.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = cmp_capabilities,
}
