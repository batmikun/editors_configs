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

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim_v.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

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
            'saadparwaiz1/cmp_luasnip',
		},
	}

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


    -- Themes
    use {
        "phha/zenburn.nvim",
        config = function() require("zenburn").setup() end
    }

    -- Fuzzy Finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} },
    }

    -- Status Line
    use {
        'tamton-aquib/staline.nvim',
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

end)
