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

  use 'karb94/neoscroll.nvim'

  -- Theme --
  use 'folke/tokyonight.nvim'

  use 'kyazdani42/nvim-web-devicons'

  use 'famiu/feline.nvim'

  use {
    'akinsho/bufferline.nvim', 
    requires = 'kyazdani42/nvim-web-devicons'
  }
  
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  use 'beauwilliams/focus.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'

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
  use 'nvim-lua/completion-nvim'
  use 'nvim-lua/lsp_extensions.nvim'
  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'
  use { 
    'ms-jpq/coq_nvim', 
    branch = 'coq'
  }
  use { 
    'ms-jpq/coq.artifacts', 
    branch= 'artifacts'
  }
  use {
    'ray-x/navigator.lua', 
    requires = {
      'ray-x/guihua.lua', 
      run = 'cd lua/fzy && make'
    }
  }
  ----------
  -- END  --
  ----------

  -- RUST --
  use 'simrat39/rust-tools.nvim'

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
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup {}
    end
  }
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use {
    'mhartington/formatter.nvim',
    opt = true,
  }
  use 'winston0410/commented.nvim'
  ----------
  -- END  --
  ----------

  ----------------------
  -- BEGIN FORMATTING --
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
  ----------
  -- END  --
  ----------
  
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

  use 'takac/vim-hardtime'
end)
