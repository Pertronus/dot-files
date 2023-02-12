
local Terminal = require('toggleterm.terminal').Terminal

local btm = Terminal:new({
   cmd = "btm",
   hidden = true,
   direction = "float",
   float_opts = {
      border = "double"
   },
   on_open = function(term)
      vim.cmd("startinsert!")
      vim.api.nvim_buf_set_keymap( term.bufnr, "n", "q", "<cmd>close<cr>", { noremap = true, silent = true })
   end,
   on_close = function(_)
      vim.cmd("startinsert")
   end
})

function _btm_toggle()
   btm:toggle()
end


local lazy_git = Terminal:new({
   cmd = "lazygit",
   hidden = true,
   direction = "float",
   float_opts = {
      border = "double"
   },
   on_open = function(term)
      vim.cmd("startinsert!")
      vim.api.nvim_buf_set_keymap( term.bufnr, "n", "q", "<cmd>close<cr>", { noremap = true, silent = true })
   end,
   on_close = function(_)
      vim.cmd("startinsert")
   end
})

function _lazygit_toggle()
   lazy_git:toggle()
end
