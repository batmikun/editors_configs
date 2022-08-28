local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<C-x>d', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<C-x>p', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<C-x>n', vim.diagnostic.goto_next, opts)

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
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
    })
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

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

local lspconfig = require('lspconfig')

-- PYTHON  npm i -g pyright
lspconfig.pyright.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
}

-- C LANG Download llvm
lspconfig.clangd.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
}
-- RUST https://github.com/rust-lang/rust-analyzer/releases -> change extension -> add to path
local opts = {
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

require('rust-tools').setup(opts)

-- ELIXIR https://github.com/elixir-lsp/elixir-ls
lspconfig.elixirls.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    cmd = { "C:\\Users\\batmi\\.elixir-ls\\language-server.bat" },
    capabilities = capabilities,
}

-- ODIN
lspconfig.ols.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
}

-- TYPESCRIPT
lspconfig.tsserver.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
}

-- GOLANG https://github.com/golang/tools/tree/master/gopls
lspconfig.gopls.setup{
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
}

-- LUA  
lspconfig.sumneko_lua.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
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
