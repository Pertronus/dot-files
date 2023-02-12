return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use { "catppuccin/nvim", as = "catppuccin" }

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = {
         {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-file-browser.nvim'
         }
      }
	}

   use {"akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup()
   end}

	use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

	use { 'windwp/nvim-autopairs',
      config = function() require('nvim-autopairs').setup {} end
   }

	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}

	use ( 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } )


	use ( 'nvim-treesitter/playground' )
	use ( 'ThePrimeagen/harpoon' )
	use ( 'mbbill/undotree' )
	use ( 'tpope/vim-fugitive' )

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
         {'hrsh7th/cmp-cmdline'},
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

   use {
      'simrat39/rust-tools.nvim'
   }

   use { "rcarriga/nvim-dap-ui",
      requires =
         {
            "mfussenegger/nvim-dap",
            "theHamsta/nvim-dap-virtual-text"
         }
   }


end)


