local function set_color_theme()
    vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

    local colors = require("catppuccin.palettes").get_palette()
    colors.none = "NONE"

    require("catppuccin").setup({
	    custom_highlights = {
		    Comment = { fg = colors.overlay1 },
		    LineNr = { fg = colors.overlay1 },
		    CursorLine = { bg = colors.none },
		    CursorLineNr = { fg = colors.lavender },
		    DiagnosticVirtualTextError = { bg = colors.none },
		    DiagnosticVirtualTextWarn = { bg = colors.none },
		    DiagnosticVirtualTextInfo = { bg = colors.none },
		    DiagnosticVirtualTextHint = { bg = colors.none },
	    },
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

require("catppuccin").setup {
}

set_color_theme()
