
local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
local boot_strapping = false

if fn.empty( fn.glob( install_path ) ) > 0 then
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e222a" })
    	print ("Cloning packer into " .. install_path .. " ...")
	fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
	boot_strapping = true;
end

vim.cmd "packadd packer.nvim"
local ok, packer = pcall( require, "plugins" )
if not ok then
	vim.api.nvim_err_writeln("Failed to load plugins\n\n" .. packer )
	return;
end

if boot_strapping then
	vim.cmd "PackerSync"
end


require( "core" )

