local dapui = require("dapui");
dapui.setup()

local dap = require("dap")


dap.listeners.after.event_initialized["dapui_config"]=function()
   dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"]=function()
   dapui.close()
end
dap.listeners.before.event_exited["dapui_config"]=function()
   dapui.close()
end

vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})

local bufopts = { silent=true, noremap=true }
vim.keymap.set('n', '<F5>', dap.continue, bufopts )
vim.keymap.set('n', '<F10>', dap.step_over, bufopts )
vim.keymap.set('n', '<F11>', dap.step_into, bufopts )
vim.keymap.set('n', '<F12>', dap.step_out, bufopts )
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, bufopts )

local extension_path = vim.env.HOME
.. "/.vscode-server-insiders/extensions/vadimcn.vscode-lldb-1.8.1/"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

dap.adapters.codelldb =  require("rust-tools.dap").get_codelldb_adapter(
   codelldb_path,
   liblldb_path
);

dap.configurations.rust = {
   {
      type = "codelldb",
      request = "launch",
      name = "Debug executable '${workspaceFolderBasename}'",
      program = '${workspaceFolder}/target/debug/${workspaceFolderBasename}',
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
      args = {},
      runInTerminal = false
   }
}

