local capabilities = require('cmp_nvim_lsp').default_capabilities()

local ih = require('inlay-hints')
local rt = require("rust-tools")
ih.setup()
local extension_path = vim.env.HOME
  .. "/.vscode-server-insiders/extensions/vadimcn.vscode-lldb-1.8.1/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

rt.setup({
  tools = {
      inlay_hints = {
         auto = false,
      },
      on_initialized = function()
         ih.set_all()
      end,
   },
   server = {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
         ih.on_attach(client, bufnr)
         -- Hover actions
         local bufopts = { buffer=bufnr, silent=true, noremap=true }
         vim.keymap.set("n", "<Leader>c", rt.hover_actions.hover_actions, bufopts)
         -- Code action groups
         vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, bufopts)
         vim.keymap.set( 'n', 'K', vim.lsp.buf.hover, bufopts )
         vim.keymap.set( 'n', 'gd', vim.lsp.buf.definition, bufopts )
         vim.keymap.set( 'n', 'gt', vim.lsp.buf.type_definition, bufopts )
         vim.keymap.set( 'n', 'gi', vim.lsp.buf.implementation, bufopts )
         vim.keymap.set( 'n', '<leader>dn', vim.diagnostic.goto_next, bufopts)
         vim.keymap.set( 'n', '<leader>dp', vim.diagnostic.goto_prev, bufopts)
         vim.keymap.set( 'n', '<leader>do', '<cmd>Telescope diagnostics<cr>', bufopts)
      end,
   },
   dap = {
      adapter = require("rust-tools.dap").get_codelldb_adapter(
         codelldb_path,
         liblldb_path
      ),
   },
})
