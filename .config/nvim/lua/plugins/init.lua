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

  -- -- Theme --
  use 'folke/tokyonight.nvim'

  use 'kyazdani42/nvim-web-devicons'

  use 'famiu/feline.nvim'

  use 'karb94/neoscroll.nvim'
  use {
   'akinsho/bufferline.nvim', 
   requires = 'kyazdani42/nvim-web-devicons'
  }
  
  -- use {
  --  'kyazdani42/nvim-tree.lua',
  --  requires = 'kyazdani42/nvim-web-devicons'
  -- }

  use 'beauwilliams/focus.nvim'
   

  -- BEGIN Color syntax --
  use {
   'nvim-treesitter/nvim-treesitter',
   run = ':TSUpdate'
  }
   use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'romgrk/nvim-treesitter-context'
  use 'lukas-reineke/indent-blankline.nvim'

  use 'windwp/nvim-autopairs'
  
   -- BEGIN Git --
   use {
     'TimUntersberger/neogit',
     requires = {
       {'nvim-lua/plenary.nvim'},
       {'sindrets/diffview.nvim'},
     },
     config = function()
       -- Extremely temporary hack to get nvim to not crash on startup.
       -- Will debug this problem and report upstream. Seems to be related to
       -- plenary loading its luv or async module incorrectly on startup.
       vim.defer_fn(
         function()
           require("neogit").setup {}
         end,
         10
       )
     end
   }
   use 'lewis6991/gitsigns.nvim'
	 use 'kdheepak/lazygit.nvim'
	 -- END --


   use {
     'folke/todo-comments.nvim',
     requires = 'nvim-lua/plenary.nvim',
     config = function()
       require('todo-comments').setup {}
     end
   }
  
  use 'nvim-lua/popup.nvim'

  use 'nvim-telescope/telescope.nvim'

	 use {
     'nvim-telescope/telescope-fzf-native.nvim', 
     run = 'make'
   }

   use 'nvim-telescope/telescope-dap.nvim'

  ----------------------
  -- BEGIN Completion --
  ----------------------
  use 'nvim-lua/lsp_extensions.nvim'
  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp' --completion
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use {
    'tzachar/cmp-tabnine', 
    run='./install.sh', 
    requires = 'hrsh7th/nvim-cmp'
  }
  use 'numToStr/Comment.nvim'

  use {
    'ray-x/lsp_signature.nvim',
  }
  use {
    'ray-x/navigator.lua',
    requires = {
      'ray-x/guihua.lua',
      run = 'cd lua/fzy && make'
    }
  }
  use 'simrat39/symbols-outline.nvim'
  ----------
  -- END  --
  ----------

  -- RUST --
  use 'simrat39/rust-tools.nvim'
  use {
    'Saecki/crates.nvim',
    event = { "BufRead Cargo.toml" },
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
        require('crates').setup()
    end,
}
  -- JSON --
  use 'gennaro-tedesco/nvim-jqx'

  -- JUPYTER --
  use {
    'dccsillag/magma-nvim',
    run = ':UpdateRemotePlugins'
  }
  
   -- REST CLIENT --
   use {
     'NTBBloodbath/rest.nvim',
     config = function()
       require('rest-nvim').setup({
         result_split_horizontal = false,
         skip_ssl_verification = false,
         highlight = {
             enabled = true,
             timeout = 150,
         },
         jump_to_request = false,
       })
     end
   }

  ----------------------
  -- BEGIN FORMATTING --
  ----------------------
  use { 
    "danymat/neogen", 
    config = function()
        require('neogen').setup {
            enabled = true
        }
    end,
    requires = "nvim-treesitter/nvim-treesitter"
  }
  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup {}
    end
  }
  use 'sbdchd/neoformat'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use 'p00f/nvim-ts-rainbow'
  use 'onsails/lspkind-nvim'
  use 'stevearc/aerial.nvim'

  use {
      'ThePrimeagen/refactoring.nvim',
      requires = {
          {'nvim-lua/plenary.nvim'},
          {'nvim-treesitter/nvim-treesitter'}
      }
  }
  ----------
  -- END  --
  ----------

  ----------------------
  -- BEGIN RUN --
  ----------------------
   use 'CRAG666/code_runner.nvim'

   use {
     'michaelb/sniprun',
     run = 'bash install.sh'
   }
  ----------
  -- END  --
  ----------


  --------------------
  -- BEGIN Markdown --
  --------------------
  use {
    'ellisonleao/glow.nvim',
    run = function ()
      require('glow').download_glow()
    end
  }
  use 'jakewvincent/mkdnflow.nvim'
  -- END  --

  use {
    'rcarriga/vim-ultest',
    requires = {'vim-test/vim-test'},
    run = ':UpdateRemotePlugins'
  }

  --------------------
  -- BEGIN DEBUGING --
  --------------------
  use 'mfussenegger/nvim-dap'
  use {
   'rcarriga/nvim-dap-ui',
   requires = {'mfussenegger/nvim-dap'},
  }
  use {
   'Pocco81/DAPInstall.nvim',
  }
  use 'mfussenegger/nvim-dap-python'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'David-Kunz/jester'
  -- ----------
  -- -- END  --
  -- ----------
  
  use { 
     'nvim-neorg/neorg',
     config = function()
         require('neorg').setup {
             load = {
                 ['core.defaults'] = {},
                 ['core.norg.concealer'] = {},
                 ['core.norg.dirman'] = {
                     config = {
                         workspaces = {
                             my_workspace = '~/.neorg'
                         }
                     }
                 }
             },
         }
     end,
     requires = 'nvim-lua/plenary.nvim'
   }

  use {
    'ahmedkhalf/project.nvim',
    config = function()
      require('project_nvim').setup {}
    end
  }
  use 'ggandor/lightspeed.nvim'

  use 'akinsho/toggleterm.nvim'
  use 'yamatsum/nvim-cursorline'
  use 'chentau/marks.nvim'
  use {
	  'luukvbaal/stabilize.nvim',
	  config = function() require('stabilize').setup() end
  }
end)
