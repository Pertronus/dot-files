local opt_arr = {
   number 		   = true,
   relativenumber = true,
   signcolumn     = 'yes',
   mouse          = 'a',
   tabstop 	      = 3,
   softtabstop 	= 3,
   shiftwidth 	   = 3,
   expandtab 	   = true,
   smarttab 	   = true,
   autoindent     = true,
   wrap           = true,
   ruler          = true,
   cmdheight      = 2,
   laststatus     = 2,
   cursorline     = true,
   showtabline    = 2,
   writebackup    = false,
   background     = 'dark',
   splitbelow     = true,
   splitright     = true,
   pumheight      = 10,
   updatetime     = 300,
   timeoutlen     = 500,
   hidden         = true,
   fileencoding   = 'utf-8',
   fileformat     = 'unix',
   formatoptions  = '-=cro',
   backup         = false,
   swapfile       = false,
   undodir        = os.getenv("HOME") .. "/.vim/undodir",
   undofile       = true,
   incsearch      = true,
   hlsearch       = false,
   scrolloff      = 8,
   colorcolumn    = "80"
}

for opt, val in pairs( opt_arr ) do
   if type( val ) == 'string' then
      local idx, _ = val:find( '=' )
      if idx ~= nil then
         local op = val:sub(1, idx)
         val = val:sub( idx+1 )

         if op == '-=' then
            for i = 1, #val do
               vim.o[opt], _ = vim.o[opt]:gsub( val:sub(i, i), '')
            end
         elseif op == '+=' then
            for i = 1, #val do
               local c =  vim.o[opt]:gsub( val:sub(i, i) )
               idx, _ = val:find( c )
               if idx ~= nil then
                  vim.o[opt] = vim.o[opt] .. c
               end
            end
         end
         goto continue
      end
   end
   vim.o[opt] = val
   ::continue::
end


vim.cmd([[ 
    augroup php_files
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.api set filetype=php
    augroup END
]])



