return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- THINGS THAT PLUGIN NEED
    use("nvim-lua/plenary.nvim")

    -- TELESCOPE FUZZY FINDER
    use("nvim-telescope/telescope.nvim")

    -- COLORSCHEME SECTION
    use { "catppuccin/nvim", as = "catppuccin" }

    -- STATUS BAR
    use 'feline-nvim/feline.nvim'
    use 'kyazdani42/nvim-web-devicons'

    -- GIT PLUGINS
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }
    
    -- LSP SERVER
    use 'neovim/nvim-lspconfig'
    -- AUTOCOMPLETION
    use 'hrsh7th/nvim-cmp'
    -- AUTOCOMPLETION SOURCES
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'

    -- Snippet Engine
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/cmp-vsnip'

    -- RUST
    use 'simrat39/rust-tools.nvim'
end)
