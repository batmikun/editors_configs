require'nvim-treesitter.configs'.setup {
    ensure_installed = { "javascript", "typescript", "c", "lua", "rust", "python", "go", "html", "css", "json"},
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    ident = { enable = true },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    }
}
