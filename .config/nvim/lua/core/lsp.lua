
local ih = require('inlay-hints')
ih.setup()
require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = { "lua_ls" },
	automatic_installation = true
})

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function( client, bufnr )
   ih.on_attach(client, bufnr)
   ih.set_all()

	local bufopts = { buffer=bufnr, silent=true, noremap=true }
	vim.keymap.set( 'n', 'K', vim.lsp.buf.hover, bufopts )
	vim.keymap.set( 'n', 'gd', vim.lsp.buf.definition, bufopts )
	vim.keymap.set( 'n', 'gt', vim.lsp.buf.type_definition, bufopts )
	vim.keymap.set( 'n', 'gi', vim.lsp.buf.implementation, bufopts )
	vim.keymap.set( 'n', '<leader>dn', vim.diagnostic.goto_next, bufopts)
	vim.keymap.set( 'n', '<leader>dp', vim.diagnostic.goto_prev, bufopts)
	vim.keymap.set( 'n', '<leader>do', '<cmd>Telescope diagnostics<cr>', bufopts)
end

require("mason-lspconfig").setup_handlers {
	function (server_name) -- default handler (optional)
      -- NOTE(HAyes): Rust is handled by rust tools
      if server_name == 'rust_analyzer' then
         return
      end
		require("lspconfig")[server_name].setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}
	end,
   ["intelephense"] = function()
      require'lspconfig'.intelephense.setup{
         root_dir = function(_)
            return vim.loop.cwd()
         end,
         settings = {
            intelephense = {
               files = {
                  maxSize = 10000000;
                  associations = {
                     "*.php",
                     "*.phtml",
                     "*.inc",
                     "*.api"
                  }
               };
               environment = {
                  shortOpenTag = true
               };
               client = {
                  disableInlayHints = false
               }
            }
         },
         capabilities = capabilities,
         on_attach = on_attach,
      }
   end,
   ["lua_ls"] = function()
      lspconfig.lua_ls.setup {
         on_attach = on_attach,
         capabilities = capabilities,
         settings = {
            Lua = {
               hint = {
                  enable = true
               },
               diagnostics = {
                  globals = { "vim" },
                  disable = { 'lowercase-global' }
               },
               workspace = {
                  library = vim.api.nvim_get_runtime_file("", true),
                  checkThirdParty = false
               },
               telemetry = {
                  enable = false,
               }
            }
         }
      }
   end
}



