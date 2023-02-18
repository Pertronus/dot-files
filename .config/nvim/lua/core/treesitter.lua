
require'nvim-treesitter.configs'.setup {
   ensure_installed = { "c", "lua", "rust", "php", "javascript", "typescript", "cpp", "json", "help"	 },

   sync_install = false,

   auto_install = true,

   highlight = {
      enable = true,
      disable = { "vim" },
      additional_vim_regex_highlighting = false,
   },
   indent = {
      enable = true,
   },
   rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
   }


}

-- Treesitter folding 
-- vim.wo.foldmethod = 'expr'

