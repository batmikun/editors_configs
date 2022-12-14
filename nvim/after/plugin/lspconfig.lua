local vim = vim

local lsp_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lsp_status_ok then
    return
end

local cmp_status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_status_ok then
    return
end

local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = ''})
sign({name = 'DiagnosticSignWarn', text = ''})
sign({name = 'DiagnosticSignHint', text = ''})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})


vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        'documentation',
        'detail',
        'additionalTextEdits',
    },
}


local on_attach = function(_, bufnr)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

    vim.keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<leader>ls', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end, bufopts)

    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
end

--[[

Language servers setup:

For language servers list see:
https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

--]]

local root_dir = function()
    return vim.fn.getcwd()
end

local servers = {
    'jsonls',
    'pyright',
    'html',
    'cssls',
    'tsserver',
    'gopls',
    'taplo',
    'ols',
    'marksman',
    'sumneko_lua',
    'clangd'
}


-- Call setup
for _, lsp in ipairs(servers) do
    if lsp == "ols" then
        lspconfig[lsp].setup {
            cmd = { "ols" },
            filetypes = { "odin" },
            on_attach = on_attach,
            capabilities = capabilities,
            root_dir = root_dir,
            flags = {
                debounce_text_changes = 150,
            }
        }
    end

    if lsp == 'jsonls' then
        lspconfig[lsp].setup {
            on_attach = on_attach,
            capabilities = capabilities,
            root_dir = root_dir,
            flags = {
                debounce_text_changes = 150,
            },
            settings = {
                json = {
                    schemas = require('schemastore').json.schemas {
                        replace = {
                            ['package.json'] = {
                                description = 'package.json overriden',
                                fileMatch = { 'package.json' },
                                name = 'package.json',
                                url = 'https://example.com/package.json',
                            },
                        },
                    },
                    validate = { enable = true },
                },
            },
        }
    end

    if lsp == 'sumneko_lua' then
        lspconfig[lsp].setup {
            settings = {
                Lua = {
                    runtime = {
                        version = '5.1.5',
                    },
                    diagnostics = {
                        globals = { 'vim' },
                    },
                    telemetry = {
                        enable = false
                    }
                }

            },
            on_attach = on_attach,
            capabilities = capabilities,
            root_dir = root_dir,
            flags = {
                debounce_text_changes = 150,
            },
        }
    end

    lspconfig[lsp].setup {
        on_attach = on_attach,
        root_dir = root_dir,
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 150,
        }
    }

end
