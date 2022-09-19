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
            requires =
            {
                'kyazdani42/nvim-web-devicons',
                opt = true,
            },
        }

        -- colorschemes
        use
        {
            'RRethy/nvim-base16',
            config = get_setup('nvim-base16'),
        }

        -- highlights trailing whitespace
        -- Note: see if treesitter can do this too!
        use
        {
            'ntpeters/vim-better-whitespace',
            config = get_setup('vim-better-whitespace'),
        }

        -- completion
        use
        {
            "hrsh7th/nvim-cmp",
            requires =
            {
                { "saadparwaiz1/cmp_luasnip" },             -- lua snips
                { "hrsh7th/cmp-nvim-lua" },                 -- nvim lua snips (api functions included!)
                { "hrsh7th/cmp-buffer" },                   -- buffer completions
                { "hrsh7th/cmp-path" },                     -- path completions
                { "hrsh7th/cmp-cmdline" },                  -- vim commandline completions
                { "rafamadriz/friendly-snippets" },
                { "hrsh7th/cmp-nvim-lsp" },                 -- language server protocol completion (requires setting up an LS)
                --{ "hrsh7th/cmp-calc" },

                { "L3MON4D3/LuaSnip" },                     --snipping engine
            },
            config = get_setup("cmp"),
        }

        -- LSP
        use
        {
            "neovim/nvim-lspconfig",                        -- enable LSP
            requires =
            {
                { "williamboman/mason.nvim" },              -- Language Server installer
                { "williamboman/mason-lspconfig.nvim" },    -- Makes managing packages installed by mason easier
                { "VonHeikemen/lsp-zero.nvim" },            -- sets up installed LSPs with nvim-cmp automatically
            },
            config = get_setup("mason"),
        }

        -- Telescope
        use
        {
            "nvim-telescope/telescope.nvim",
            requires =
            {
                { "nvim-lua/plenary.nvim" },
                { "nvim-telescope/telescope-fzy-native.nvim" },     -- precompiled fuzzy finder to speed up searches
            },
            config = get_setup("telescope"),
        }

        -- Bootstrap
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
