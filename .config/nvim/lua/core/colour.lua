
function colour_my_neovim(colour)
	colour = colour or 'catppuccin'
	vim.cmd.colorscheme(colour)
end

colour_my_neovim()
