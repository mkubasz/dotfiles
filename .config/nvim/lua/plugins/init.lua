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
  -- Theme
  use 'folke/tokyonight.nvim'
  use 'kyazdani42/nvim-web-devicons'

  use 'famiu/feline.nvim'

  use {
    'akinsho/bufferline.nvim', 
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use {
    'rcarriga/vim-ultest', 
    requires = {'vim-test/vim-test'}, 
    run = ':UpdateRemotePlugins'
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- BEGIN Git
  use {
    "TimUntersberger/neogit",
    requires = {
      {"nvim-lua/plenary.nvim"},
      {"sindrets/diffview.nvim"},
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

  use 'nvim-lua/popup.nvim'
  use 'nvim-telescope/telescope.nvim'
	use {
    'nvim-telescope/telescope-fzf-native.nvim', 
    run = 'make'
  }
  use 'lukas-reineke/indent-blankline.nvim'
  use 'windwp/nvim-autopairs'

  -- BEGIN Completion --
  use 'nvim-lua/completion-nvim'
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
  -- END  --

  use 'karb94/neoscroll.nvim'
  use 'Pocco81/TrueZen.nvim'

  -- BEGIN Markdown --
  use {
    'ellisonleao/glow.nvim',
    run = function ()
      require('glow').download_glow()
    end
  }
  use 'jakewvincent/mkdnflow.nvim'
  -- END  --

  use {
    'mhartington/formatter.nvim',
    opt = true,
  }
  use 'gennaro-tedesco/nvim-jqx'
  use {
    'NTBBloodbath/rest.nvim',
    config = function()
      require("rest-nvim").setup({
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
  use 'mfussenegger/nvim-dap'

end)
