-- This file can be loaded by calling `lua require('plugins')` from init.vim

-- Only required if  packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Load on an autocommand event
    use {'andymass/vim-matchup', event = 'VimEnter'}


    -- Plugins can have post-install/update hooks
    use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

    -- Post-install/update hook with neovim command
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Post-install/update hook with call of vimscript function with argument
    use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }


    -- Use dependency and run lua function after load
    use {
        'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
        config = function() require('gitsigns').setup() end
    }
    -- Monokai pro theme
    use {
        'https://gitlab.com/__tpb/monokai-pro.nvim',
        as = 'monokai-pro.nvim'
    }


    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- plugin for comment

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- plugin for bracket close 

    use {
        'm4xshen/autoclose.nvim', 
        config = function()
            require('autoclose').setup()
        end
    }

    -- For vsnip users.
    use {
        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip'
    }

    -- code completion plugin
    use { 
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp'
    }
    
    use {
        'https://github.com/lambdalisue/suda.vim'
    }


end)
