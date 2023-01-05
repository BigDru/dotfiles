-- Note: requires nvim 0.7.0 or greater

-- reloads neovim whenever plugins.lua is saved
vim.api.nvim_create_autocmd('BufWritePost',
{
    group = vim.api.nvim_create_augroup('packer_user_config', { clear = true }),
    pattern = 'plugins.lua',
    command = 'source <afile> | PackerSync'
})

-- bootstrap packer
local ensure_packer = function()
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({
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

local function get_setup(name)
    -- TODO: make pcall
    return string.format('require(\'dru/setup/%s\')', name)
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("Packer not found")
    return
end

return packer.startup({
    function(use)
        use('wbthomason/packer.nvim') -- Packer manages itself

        use
        {
            "nvim-lua/plenary.nvim",
        }

        -- lualine
        use
        {
            'nvim-lualine/lualine.nvim',
            config = get_setup('lualine'),
            requires =
            {
                'kyazdani42/nvim-web-devicons',
            },
        }

        -- colorschemes
        use
        {
            'edeneast/nightfox.nvim',
            config = get_setup('colorscheme'),
        }

        -- highlights trailing whitespace
        -- TODO: see if treesitter can do this too!
        use
        {
            'ntpeters/vim-better-whitespace',
            config = get_setup('vim-better-whitespace'),
        }

        -- completion
        use
        {
            "hrsh7th/nvim-cmp",
            config = get_setup("cmp"),
            requires =
            {
                { "hrsh7th/cmp-buffer" },                   -- buffer completions
                { "hrsh7th/cmp-path" },                     -- path completions
                { "hrsh7th/cmp-cmdline" },                  -- vim commandline completions
                { "rafamadriz/friendly-snippets" },
                { "saadparwaiz1/cmp_luasnip" },             -- lua snips
                { "hrsh7th/cmp-nvim-lua" },                 -- nvim lua snips (api functions included!)
                { "hrsh7th/cmp-nvim-lsp" },                 -- language server protocol completion (requires setting up an LS)
                --{ "hrsh7th/cmp-calc" },

                { "L3MON4D3/LuaSnip" },                     --snipping engine
            },
        }

        -- LSP
        use
        {
            "neovim/nvim-lspconfig",                        -- enable LSP
            config = get_setup("mason"),
            requires =
            {
                { "williamboman/mason.nvim" },              -- Language Server installer
                { "williamboman/mason-lspconfig.nvim" },    -- Makes managing packages installed by mason easier
                { "VonHeikemen/lsp-zero.nvim" },            -- sets up installed LSPs with nvim-cmp automatically
            },
        }

        -- Telescope
        use
        {
            "nvim-telescope/telescope.nvim",
            config = get_setup("telescope"),
            requires =
            {
                { "nvim-telescope/telescope-fzy-native.nvim" },     -- precompiled fuzzy finder to speed up searches
            },
        }

        -- Trouble
        use
        {
            "folke/trouble.nvim",
            config = get_setup("trouble"),
            requires =
            {
                'kyazdani42/nvim-web-devicons',
            },
        }

        -- todo-comments
        use
        {
            "folke/todo-comments.nvim",
            config = get_setup("todo-comments"),
        }

        -- Treesitter
        use
        {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = get_setup("treesitter"),
            requires =
            {
                { "p00f/nvim-ts-rainbow" },
                --{ "nvim-treesitter/playground" }, -- useful for developing TS plugins or themes
                {
                    "windwp/nvim-autopairs",
                    config = get_setup("autopairs"),
                },
            }
        }

        -- Nvim tree
        use
        {
            "kyazdani42/nvim-tree.lua",
            config = get_setup("nvim-tree"),
            requires =
            {
                "kyazdani42/nvim-web-devicons",
            },
        }

        -- LaTex
        use
        {
            "lervag/vimtex",
            setup = get_setup("vimtex"),
        }

        -- Bufferline
        use
        {
            "akinsho/bufferline.nvim",
            config = get_setup("bufferline"),
            requires =
            {
                "moll/vim-bbye", -- used because the regular :bdelete is a bit buggy at times
            },
        }

        -- Gitsigns
        use
        {
            "lewis6991/gitsigns.nvim",
            config = get_setup("gitsigns"),
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
            threshold = 1, -- the amount in ms that a plugin's load time must be over for it to be included in the profile
        }
    }
})
