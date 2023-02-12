
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
