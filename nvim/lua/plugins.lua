local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute('packadd packer.nvim')
end

execute('packadd packer.nvim')

return require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim', opt = true }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  -- Utilities
  use {
    'numToStr/Comment.nvim',
    config = function() require('Comment').setup() end
  }
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-repeat' }
  use { 'matze/vim-move' }
  use { 'tpope/vim-unimpaired' }
  use { "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup() end
  }
  use {
    'lewis6991/gitsigns.nvim',
    tag = 'release',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  use { 'windwp/nvim-spectre', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'hkupty/iron.nvim' } -- ???
  --- ???
  use {
    "akinsho/toggleterm.nvim",
    tag = '*',
    config = function()
      require("toggleterm").setup({ direction = "float" })
    end
  }

  use { 
    "rest-nvim/rest.nvim",
  requires = { "nvim-lua/plenary.nvim" },
  config = function()
    require("rest-nvim").setup({
      -- Open request results in a horizontal split
      result_split_horizontal = false,
      -- Keep the http file buffer above|left when split horizontal|vertical
      result_split_in_place = false,
      -- Skip SSL verification, useful for unknown certificates
      skip_ssl_verification = false,
      -- Encode URL before making request
      encode_url = true,
      -- Highlight request on run
      highlight = {
        enabled = true,
        timeout = 150,
      },
      result = {
        -- toggle showing URL, HTTP info, headers at top the of result window
        show_url = true,
        -- show the generated curl command in case you want to launch
        -- the same request via the terminal (can be verbose)
        show_curl_command = false,
        show_http_info = true,
        show_headers = true,
        -- executables or functions for formatting response body [optional]
        -- set them to false if you want to disable them
        formatters = {
          json = "jq",
          html = function(body)
            return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
          end
        },
      },
      -- Jump to request line on run
      jump_to_request = false,
      env_file = '.env',
      custom_dynamic_variables = {},
      yank_dry_run = true,
      })
    end
  }

    -- Treesitter --
  use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate" }
  use { 'nvim-treesitter/playground' }
  use {
    'andymass/vim-matchup',
    'nvim-treesitter/nvim-treesitter-textobjects',
    requires = { 'nvim-treesitter/nvim-treesitter' }
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'hrsh7th/nvim-cmp' }, -- Required
      { 'L3MON4D3/LuaSnip' }, -- Required
      { -- Optional
        'williamboman/mason.nvim',
        run = function() pcall(vim.cmd, 'MasonUpdate') end
      }, { 'williamboman/mason-lspconfig.nvim' }, { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' }, { 'hrsh7th/cmp-nvim-lua' },
      { 'saadparwaiz1/cmp_luasnip' }, { 'rafamadriz/friendly-snippets' }
    }
  }
  use { "jose-elias-alvarez/null-ls.nvim" }
  use { "lukas-reineke/lsp-format.nvim" }

  -- UI
  use { "ellisonleao/gruvbox.nvim" }
  use { 'hoob3rt/lualine.nvim' }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } }
  }
end)
