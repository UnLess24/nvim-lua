vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim'

  use 'neovim/nvim-lspconfig'

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'

  use 'phpactor/phpactor'

  use 'morhetz/gruvbox'
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  require('plugins.dapui')

  -- use {
  --     'neoclide/coc.nvim',
  --     branch = 'release'
  -- }

  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = ':TSUpdate',
	  require('plugins.treesitter')
  }

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  requires = { {'nvim-lua/plenary.nvim'} },
 	  require('plugins.telescope'),
     require('telescope').setup{
       defaults = {
         file_ignore_patterns = { "*.js", "./*.js", "./**/*.js" }
       }
     }
  }
  use { 'nvim-telescope/telescope-dap.nvim' }
  use { 'nvim-telescope/telescope-packer.nvim' }
  require('telescope').load_extension('dap')
  require('telescope').load_extension('packer')

  require('plugins.dap')
  require('plugins.php_dap_adapter')

  use {
  "NTBBloodbath/rest.nvim",
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
        show_http_info = true,
        show_headers = true,
        -- executables or functions for formatting response body [optional]
        -- set them to nil if you want to disable them
        formatters = {
          json = "jq",
          html = function(body)
            return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
          end
        },
      },
      -- Jump to request line on run
      jump_to_request = true,
      env_file = '.env',
      custom_dynamic_variables = {},
      yank_dry_run = true,
    })
  end
}

  use {
      'phaazon/hop.nvim',
      branch = 'v2', -- optional but strongly recommended
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' },
      require('plugins.hop')
  }

  use {
      'lewis6991/gitsigns.nvim',
      tag = 'release', -- To use the latest release
      require('plugins.gitsigns')
  }

  use {
      'kyazdani42/nvim-web-devicons',
      require('nvim-web-devicons').setup({ default = true; })
  }

  -- auto complete
  use {
    'tzachar/cmp-tabnine',
    run='./install.sh'
  }

  -- icons
  use{'onsails/lspkind-nvim'}

  -- statusbar
  use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    require('lualine').setup {
        options = { theme = 'ayu_light' }
    }
  }

  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

  -- snippet core
  use {
    'L3MON4D3/LuaSnip',
    after = 'friendly-snippets',
    config = function()
        require('luasnip/loaders/from_vscode').load({
            paths = { '~/.local/share/nvim/site/pack/packer/start/friendly-snippets' }
        })
    end
  }

  -- snippets cmp
  use 'saadparwaiz1/cmp_luasnip'

  -- snippets for all languages
  use 'rafamadriz/friendly-snippets'

  use {
    'numToStr/Comment.nvim',
    require('Comment').setup()
  }

  use {
    'windwp/nvim-autopairs',
    require("nvim-autopairs").setup()
  }

  use {
      "kylechui/nvim-surround",
      config = function()
          require("nvim-surround").setup({
              -- Configuration here, or leave empty to use defaults
          })
      end
  }

  -- Go utilities
  use {
      "olexsmir/gopher.nvim",
      requires = {
          "nvim-lua/plenary.nvim",
          "nvim-treesitter/nvim-treesitter",
      }
    }

end)

