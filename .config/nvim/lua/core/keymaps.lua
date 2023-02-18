vim.g.mapleader = ','

-- Telescope keymaps

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fe', '<cmd>Telescope file_browser<cr>', {})

vim.keymap.set('n', '<leader>s', function()
   builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)


if vim.fn.executable "btm" == 1 then
   vim.keymap.set('n', '<leader>tt', '<cmd>lua _btm_toggle()<cr>', { noremap = true, silent = true })
end

if vim.fn.executable "lazygit" == 1 then
   vim.keymap.set('n', '<leader>tg', '<cmd>lua _lazygit_toggle()<cr>', { noremap = true, silent = true })
end


vim.g.mapleader = ","

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")


vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("n", "<leader>P", "\"+p")
vim.keymap.set("v", "<leader>p", "\"+p")


vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")


vim.keymap.set("n", "<leader>dap", '<cmd>lua require"dapui".toggle()<cr>', {})
