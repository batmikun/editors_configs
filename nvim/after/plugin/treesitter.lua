require'nvim-treesitter.configs'.setup {
    ensure_installed = { "javascript", "typescript", "c", "lua", "rust", "python", "go", "html", "css", "json"},
    sync_install = false,
    auto_install = true,
    ignore_install = {},
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
    }
}
