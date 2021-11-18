 local fn = vim.fn
 local fn = vim.fn

-- Auto install packer.nvim if not exists
local execute = vim.api.nvim_command
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

vim.cmd [[packadd packer.nvim]]
vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost plugins.lua PackerCompile
  augroup end
]], false)

require('packer').startup(function(use)
  use {'wbthomason/packer.nvim', opt = true}
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'

  use 'luukvbaal/nnn.nvim'

  -- Theme --
  use 'folke/tokyonight.nvim'
  use 'karb94/neoscroll.nvim'
  use 'SmiteshP/nvim-gps'
  -- Tabline --
  use {
    'akinsho/bufferline.nvim', 
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- Statusline --
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  
  -- Telescope --
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  
  -- Treesitter --
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim', 
    run = 'make'
   }

  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'lewis6991/spellsitter.nvim'

  -- LSP --
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use {
    'tzachar/cmp-tabnine', 
    run='./install.sh', 
    requires = 'hrsh7th/nvim-cmp'
  }
  use {'ray-x/navigator.lua', requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}}
  use 'onsails/lspkind-nvim'
  use 'simrat39/symbols-outline.nvim'
  use 'simrat39/rust-tools.nvim'
  use 'ray-x/go.nvim'
  use 'ray-x/lsp_signature.nvim'
  -- LSP Snip --
  use 'saadparwaiz1/cmp_luasnip'
  use { -- Snippet Engine for Neovim written in Lua.
    'L3MON4D3/LuaSnip',
    requires = {
      'rafamadriz/friendly-snippets',   -- Snippets collection for a set of different programming languages for faster development.
    },
  }
  
  -- Run --
  use { 
    'michaelb/sniprun', 
    run = 'bash ./install.sh'
  }

  -- Format --
  use 'windwp/nvim-autopairs'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'sbdchd/neoformat'
  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  }
  use {
      'ThePrimeagen/refactoring.nvim',
      requires = {
          {'nvim-lua/plenary.nvim'},
          {'nvim-treesitter/nvim-treesitter'}
      }
  }
  -- Comments --
  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
  }
  use 'numToStr/Comment.nvim'
  
  -- Tests --
  use { 
    'rcarriga/vim-ultest', 
    requires = {'vim-test/vim-test'}, 
    run = ':UpdateRemotePlugins'
  }

  -- Doc Generation --
  use { 
    'danymat/neogen', 
    requires = 'nvim-treesitter/nvim-treesitter'
  }

  -- Git --
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
  }
  use { 
    'sindrets/diffview.nvim', 
    requires = 'nvim-lua/plenary.nvim' 
  }
  use 'pwntester/octo.nvim'

  -- Rest --
  use {
    'NTBBloodbath/rest.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- Markdown --
  use {
    'ellisonleao/glow.nvim',
    run = function ()
      require('glow').download_glow()
    end
  }
  use 'jakewvincent/mkdnflow.nvim'

  -- Others --
  use 'ggandor/lightspeed.nvim'
  use 'beauwilliams/focus.nvim'
  use 'luukvbaal/stabilize.nvim'
  use 'chentau/marks.nvim'
  use 'akinsho/toggleterm.nvim'
  use 'yamatsum/nvim-cursorline'
  use 'windwp/nvim-spectre'
end)
