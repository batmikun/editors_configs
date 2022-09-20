return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- THINGS THAT PLUGIN NEED
    use("nvim-lua/plenary.nvim")

    -- BETTER NOTIFICATIONS
    use("rcarriga/nvim-notify")

    -- TELESCOPE FUZZY FINDER
    use("nvim-telescope/telescope.nvim")

    -- COLORSCHEME SECTION
    use({ "catppuccin/nvim", as = "catppuccin" })

    -- STATUS BAR
    use("feline-nvim/feline.nvim")
    use("kyazdani42/nvim-web-devicons")

    -- GIT PLUGINS
    use({
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    })

    -- PAIRS
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end,
    })

    -- HIGHLIGHT IMPROVED
    use("nvim-treesitter/nvim-treesitter")

    -- MOTIONS IMPROVED
    use("ggandor/leap.nvim")

    -- LSP SERVER
    use("neovim/nvim-lspconfig")

    -- BETTER DIAGNOSTICS
    use({
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup({})
        end,
    })
    use("jose-elias-alvarez/null-ls.nvim")

    -- AUTOCOMPLETION
    use("hrsh7th/nvim-cmp")

    -- AUTOCOMPLETION SOURCES
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/cmp-nvim-lsp-signature-help")

    -- Snippet Engine
    use("hrsh7th/vim-vsnip")
    use("hrsh7th/cmp-vsnip")

    -- RUST EXTENSION
    use("simrat39/rust-tools.nvim")
    -- C EXTENSION
    use("p00f/clangd_extensions.nvim")
    -- LOVE EXTENSION
    use("davisdude/vim-love-docs")

    -- EMMET
    use("mattn/emmet-vim")
end)
