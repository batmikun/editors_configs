-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------
local vim_v = vim
local fn = vim_v.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path
    })
    vim_v.o.runtimepath = vim_v.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim_v.o.runtimepath
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

-- Install plugins
return packer.startup(function(use)
    -- Packer can manage itselft
    use 'wbthomason/packer.nvim'

    -- Language server protocol
    use {
        "neovim/nvim-lspconfig",
    }

    -- Autocomplete
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'saadparwaiz1/cmp_luasnip',
        },
    }

    -- Rust Tools
    use 'simrat39/rust-tools.nvim'

    -- Snippet source
    use "rafamadriz/friendly-snippets"

    -- Syntax Highlighting
    use {
        "nvim-treesitter/nvim-treesitter",
        requires = {
            'p00f/nvim-ts-rainbow'
        },
        run = ":TSUpdate",
    }

    -- Indent line
    use 'lukas-reineke/indent-blankline.nvim'

    -- Better UI
    -- Packer
    use({
        "folke/noice.nvim",
        config = function()
            require("noice").setup({
                cmdline = {
                    format = {
                        cmdline = { icon = ">" },
                        search_down = { icon = "🔍⌄" },
                        search_up = { icon = "🔍⌃" },
                        filter = { icon = "$" },
                        lua = { icon = "☾" },
                        help = { icon = "?" },
                    },
                },
                lsp = {
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                },
                presets = {
                    bottom_search = true, -- use a classic bottom cmdline for search
                    command_palette = true, -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false, -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = true, -- add a border to hover docs and signature help
                },
            })
        end,
        requires = {
            "MunifTanjim/nui.nvim",
        }
    })

    -- Themes - UI
    use "EdenEast/nightfox.nvim"
    use 'nvim-tree/nvim-web-devicons'
    use({
        'crispgm/nvim-tabline',
        config = function()
            require('tabline').setup({})
        end,
    })
    use 'itchyny/lightline.vim'
    -- Fuzzy Finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } },
    }

    -- Autopair
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- Json Schemas
    use "b0o/schemastore.nvim"

    -- Toggle Term
    use {
        "akinsho/toggleterm.nvim",
        tag = '*',
        config = function() require("toggleterm").setup() end
    }

    -- Better Startup Time
    use 'lewis6991/impatient.nvim'

    -- Odin highlight
    use 'Tetralux/odin.vim'

    -- Start Screen
    use {
        "goolord/alpha-nvim",
        config = function()
            local alpha = require 'alpha'
            local dashboard = require 'alpha.themes.dashboard'
            dashboard.section.header.val = {
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣶⣶⣿⣿⣿⣿⣶⣶⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀ ",
                "⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⡿⠿⠛⠻⠿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠛⠿⢿⣿⣿⣿⡇⠀⠀⠀⠀⠀ ",
                "⠀⠀⠀⠀⠀⠀⢸⣿⣿⠏⣠⣤⡄⣠⣤⡌⢿⣿⣿⣿⣿⡿⢁⣤⣄⢀⣤⣄⠹⣿⣿⡇⠀⠀⠀⠀⠀ ",
                "⠀⠀⠀⠀⠀⠀⠸⣿⣿⠀⢿⣿⣿⣿⣿⡟⢸⣿⣿⣿⣿⡇⠸⣿⣿⣿⣿⡿⠀⣿⣿⠇⠀⠀⠀⠀⠀ ",
                "⠀⠀⠀⠀⠀⠀⠀⢻⣿⣆⠀⠙⠿⠟⠋⢀⣾⣿⣿⣿⣿⣷⡀⠈⠻⡿⠋⠁⣰⣿⡟⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣶⣶⣶⣾⣿⣿⡿⠋⠙⢿⣿⣿⣷⣶⣶⣶⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⢁⣴⣧⡀⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠛⠙⠛⠙⠛⠛⠋⠛⠋⠛⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            }
            dashboard.section.buttons.val = {
                dashboard.button("t", "  Open Tree", ":Ex <CR>"),
                dashboard.button("e", "  New  File", ":ene <BAR> startinsert <CR>"),
                dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
            }
            dashboard.section.footer.val = {
                "        Si tu lo deseas puedes volar solo tienes que confiar",
                "                      Mucho en ti y seguir"
            }
            dashboard.config.opts.noautocmd = true
            alpha.setup(dashboard.config)
        end
    }
end)
