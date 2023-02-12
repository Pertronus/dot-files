
require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = { "lua_ls" },
	automatic_installation = true
})

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function( _, bufnr )
	local bufopts = { buffer=bufnr, silent=true, noremap=true }
	vim.keymap.set( 'n', 'K', vim.lsp.buf.hover, bufopts )
	vim.keymap.set( 'n', 'gd', vim.lsp.buf.type_definition, bufopts )
	vim.keymap.set( 'n', 'gt', vim.lsp.buf.type_definition, bufopts )
	vim.keymap.set( 'n', 'gi', vim.lsp.buf.implementation, bufopts )
	vim.keymap.set( 'n', '<leader>dn', vim.diagnostic.goto_next, bufopts)
	vim.keymap.set( 'n', '<leader>dp', vim.diagnostic.goto_prev, bufopts)
	vim.keymap.set( 'n', '<leader>do', '<cmd>Telescope diagnostics<cr>', bufopts)
end

require("mason-lspconfig").setup_handlers {
	function (server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}
	end,
   ["rust_analyzer"] = function()
      local rt = require("rust-tools")

      rt.setup({
         server = {
            on_attach = function(_, bufnr)
               -- Hover actions
               vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
               -- Code action groups
               vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
            end,
         },
      })
   end,
	["lua_ls"] = function()
		lspconfig.lua_ls.setup {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
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



