return require('packer').startup(function()
  -- plugin manager!
  use 'wbthomason/packer.nvim'

  -- syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = [[require('config.treesitter')]]
  }

  use {
    'jose-elias-alvarez/null-ls.nvim',
    reqruies = 'neovim/nvim-lspconfig',
    config = [[require('config.null-ls')]]
  }

  -- LSP completions, hints, errors, lint and more.
  use {
    'neovim/nvim-lspconfig',
    config = [[require('config.lspconfig')]]
  }

  -- LSP actions, signatures, hover docs etc
  use {
    'glepnir/lspsaga.nvim',
    requires = 'neovim/nvim-lspconfig',
    config = [[require('config.lspsaga')]]
  }

  -- Combine all LSP hints/errors into a quickfix menu
  use {
    'folke/trouble.nvim',
    requires = 'neovim/nvim-lspconfig',
    configs = [[require('config.trouble')]]
  }

  -- LSP Completion Menu
  use {
    'hrsh7th/cmp-nvim-lsp',
    requires = {{'hrsh7th/nvim-cmp'}, {'neovim/nvim-lspconfig'}, {'onsails/lspkind-nvim'}},
    config = [[require('config.cmp')]]
  }
  use {
    'hrsh7th/cmp-nvim-lsp-signature-help',
    requires = {{'hrsh7th/nvim-cmp'}}
  }
  use {
    'ray-x/cmp-treesitter',
    requires = {{'hrsh7th/nvim-cmp'}}
  }
  use {
    'hrsh7th/cmp-cmdline',
    requires = {{'hrsh7th/nvim-cmp'}}
  }
  use {
    'hrsh7th/cmp-buffer',
    requires = {{'hrsh7th/nvim-cmp'}}
  }
  use {
    'hrsh7th/cmp-path',
    requires = {{'hrsh7th/nvim-cmp'}}
  }

  use {
    'zbirenbaum/copilot.lua',
    requires = {{"github/copilot.vim"}},
    event = {"VimEnter"},
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    end
  }
  use {
    'zbirenbaum/copilot-cmp',
    requires = {{'zbirenbaum/copilot.lua'}}
  }

  -- Snippets
  use {
    'saadparwaiz1/cmp_luasnip',
    requires = {{'L3MON4D3/LuaSnip'}, {'hrsh7th/nvim-cmp'}},
  }

  -- File Finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {'nvim-telescope/telescope-fzy-native.nvim'}},
    config = [[require('config.telescope')]]
  }

  -- top "tab" bar
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = [[require('config.bufferline')]]
  }

  -- git signs
  -- use {
  --   'lewis6991/gitsigns.nvim',
  --   requires = 'nvim-lua/plenary.nvim',
  --   config = [[require('config.gitsigns')]]
  -- }

  -- gcc to toggle comments
  use {
    'tpope/vim-commentary',
    requires = 'tpope/vim-repeat',
  }

  -- add/change quotes
  use {
    'tpope/vim-surround',
    requires = 'tpope/vim-repeat',
  }

  -- bunch of cool keyboard combos
  use {
    'tpope/vim-unimpaired',
    requires = 'tpope/vim-repeat',
  }

  -- cx{motion} store a value to exchange with the next cx
  use {
    'tommcdo/vim-exchange',
    requires = 'tpope/vim-repeat',
  }

  -- LSP based text objects
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    requires = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = [[require('config/treesitter-textobjects')]]
  }

  -- Color swatches for hex colours
  use {
    'norcalli/nvim-colorizer.lua',
    config = [[require('colorizer').setup()]]
  }

  -- theme
  use {
    'projekt0n/github-nvim-theme',
    config = [[require('config.github-theme')]]
  }

  -- openscad
  use {
    'salkin-mada/openscad.nvim',
    config = [[require('openscad')]]
  }

  -- focus mode
  use {
    'junegunn/goyo.vim',
    -- config = [[require('goyo')]]
  }

  -- markdown preview in browser
  use {
    'iamcco/markdown-preview.nvim',
     run = 'cd app && npm install',
     cmd = 'MarkdownPreview'
  }
end)
