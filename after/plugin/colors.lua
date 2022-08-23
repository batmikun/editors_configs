local function set_color_theme()

    vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

    require("catppuccin").setup({
        integrations = {
            telescope = true
        },
        neotree = {
			enabled = true,
			show_root = true,
			transparent_panel = false,
		},
        coc_nvim = true,
    })

    vim.cmd [[colorscheme catppuccin]]
end

set_color_theme()
