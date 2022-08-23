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

    -- COC VIM PLUGIN [ LSP ]
    use { 'neoclide/coc.nvim', branch = 'release' } 

    -- NEO TREE FILES

    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = { 
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }

end)
