local function set_color_theme()

    vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

    require("catppuccin").setup({
        integrations = {
            telescope = true,
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = { "italic" },
                    hints = { "italic" },
                    warnings = { "italic" },
                    information = { "italic" },
                },
                underlines = {
				    errors = { "underline" },
				    hints = { "underline" },
				    warnings = { "underline" },
				    information = { "underline" },
			    },  
            },
            treesitter = true,
        },
    })

    vim.cmd [[colorscheme catppuccin]]
end

set_color_theme()
