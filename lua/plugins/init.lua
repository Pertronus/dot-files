return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

   use {
      'sainnhe/everforest',
      config = function()
         vim.cmd('colorscheme everforest')
      end
   }

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { {'nvim-lua/plenary.nvim'} }
	}


   use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

   use ( 'windwp/nvim-autopairs' )

   use {
      'nvim-tree/nvim-tree.lua',
      requires = {
         'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
   }

   use ( 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } )


   use ( 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } )
   use ( 'nvim-treesitter/playground' )
   use ( 'ThePrimeagen/harpoon' )
   use ( 'mbbill/undotree' )
   use ( 'tpope/vim-fugitive' )

   use ( 'mfussenegger/nvim-dap' )

   use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
         require("trouble").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
         }
      end
   }

   use {
      'VonHeikemen/lsp-zero.nvim',
      requires = {
         -- LSP Support
         {'neovim/nvim-lspconfig'},
         {'williamboman/mason.nvim'},
         {'williamboman/mason-lspconfig.nvim'},

         -- Autocompletion
         {'hrsh7th/nvim-cmp'},
         {'hrsh7th/cmp-buffer'},
         {'hrsh7th/cmp-path'},
         {'saadparwaiz1/cmp_luasnip'},
         {'hrsh7th/cmp-nvim-lsp'},
         {'hrsh7th/cmp-nvim-lua'},

         -- Snippets
         {'L3MON4D3/LuaSnip'},
         {'rafamadriz/friendly-snippets'},
      }
   }


end)


