
local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty( fn.glob( install_path ) ) > 0 then
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e222a" })
    	print ("Cloning packer into " .. install_path .. " ...")
	fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }


	print "Installing packer and compile plugins ..."
	vim.cmd "packadd packer.nvim"
	local ok, packer = pcall( require, "plugins" )
	if not ok then
		vim.api.nvim_err_writeln("Failed to load plugins\n\n" .. packer )
		return;
	end
	vim.cmd "PackerSync"

else
	vim.cmd "packadd packer.nvim"
end

