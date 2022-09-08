-- bootstrap packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        'git', 
        'clone', 
        '--depth', 
        '1', 
        'https://github.com/wbthomason/packer.nvim', 
        install_path
    })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
-- !bootstrap packer

-- Note: requires nvim 0.7.0 or greater
vim.api.nvim_create_autocmd('BufWritePost', 
{
    group = group_id,
    pattern = 'plugins.lua',
    command = 'source <afile> | PackerCompile'
})

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- lualine
    use 
    {
        'nvim-lualine/lualine.nvim',
        event = 'VimEnter',
        config = function()
            require('lualine').setup()
        end,
        requires = 
        { 
            'kyazdani42/nvim-web-devicons', 
            opt = true ,
        },
    }

    if packer_bootsrap then
        require('packer').sync()
    end
end)

