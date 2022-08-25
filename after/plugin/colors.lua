local function set_color_theme()

    vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

    require("catppuccin").setup({
        integrations = {
            telescope = true
        },
    })

    vim.cmd [[colorscheme catppuccin]]
end

set_color_theme()
