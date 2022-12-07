require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "rust", "python", "go" },
    sync_install = false,
    auto_install = false,
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
