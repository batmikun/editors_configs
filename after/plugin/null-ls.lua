local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({bufnr = bufnr})
                end,
            })
        end
    end,

    sources = {
        -- cargo install stylua
        null_ls.builtins.formatting.stylua,
        -- npm install -g eslint_d
        null_ls.builtins.code_actions.eslint_d,
        -- pip install flake8
        null_ls.builtins.diagnostics.flake8,
        null_ls.builtins.formatting.clang_format,
        -- go install mvdan.cc/gofumpt@latest
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.mix,
        -- rustup component add rustfmt
        null_ls.builtins.formatting.rustfmt
    },
})
