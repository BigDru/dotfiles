-- Note: requires nvim 0.7.0 or greater
vim.api.nvim_create_autocmd('BufWritePost', 
{
    group = vim.api.nvim_create_augroup('packer_user_config', { clear = true }),
    pattern = 'plugins.lua',
    command = 'source <afile> | PackerSync'
})

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
    vim.api.nvim_command('packadd packer.nvim')
    print("Packer bootstrapped")
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
-- !bootstrap packer

function get_setup(name)
    return string.format('require(\'dru/setup/%s\')', name)
end

return require('packer').startup({
    function(use)
        use('wbthomason/packer.nvim') -- Packer manages itself

        -- May be used by other plugins:
        -- use 'nvim-lua/popup.nvim' -- Implementation of Popup API 
        -- use 'nvim-lua/plenary.nvim' -- Useful lua functions used in lots of plugins

        -- lualine
        use
        {
            'nvim-lualine/lualine.nvim',
            config = get_setup('lualine'),
            --event = 'VimEnter',
            requires = 
            { 
                'kyazdani42/nvim-web-devicons', 
                opt = true,
            },
        }

        use 'RRethy/nvim-base16'

        if packer_bootstrap then
            print("Packer synced")
            require('packer').sync()
        end
    end,
    config = 
    {
        display = {
            open_fn = require('packer.util').float,
        },
        profile = {
            enable = true,
            threshold = 1, -- the amount in ms that a plugin's loat time must be over for it to be included in the profile
        }
    }
})
