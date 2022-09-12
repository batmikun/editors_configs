local function set_color_theme()
	vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

	local colors = require("catppuccin.palettes").get_palette()
	colors.none = "NONE"

	require("catppuccin").setup({
		integrations = {
			cmp = true,
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
			lsp_trouble = true,
			leap = true,
			notify = true,
			treesitter = true,
		},
	})

	vim.cmd([[colorscheme catppuccin]])
end

require("catppuccin").setup({})

set_color_theme()