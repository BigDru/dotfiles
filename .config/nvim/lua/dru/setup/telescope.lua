local M =
{
    "nvim-telescope/telescope.nvim",
    dependencies =
    {
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
        "nvim-lua/plenary.nvim",
    },
    lazy = false,
    cmd = "Telescope"
}

function M.config()
    local status_ok, telescope = pcall(require, "telescope")
    if not status_ok then
        print("Telescope require failed")
        return
    end

    local status_ok, wk = pcall(require, "which-key")
    if not status_ok then
        print("which-key require failed in telescope")
        return
    end
    local wk = require "which-key"
    wk.register
    {
        ["<leader>f"] = { "", "Telescope / Find" },

        ["<leader>fb"] = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        ["<leader>fc"] = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find files" },
        ["<leader>fp"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
        ["<leader>ft"] = { "<cmd>Telescope live_grep<cr>", "Find Text" },
        ["<leader>fs"] = { "<cmd>Telescope grep_string<cr>", "Find String" },
        ["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", "Help" },
        ["<leader>fH"] = { "<cmd>Telescope highlights<cr>", "Highlights" },
        ["<leader>fi"] = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
        ["<leader>fl"] = { "<cmd>Telescope resume<cr>", "Last Search" },
        ["<leader>fM"] = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        ["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
        ["<leader>fR"] = { "<cmd>Telescope registers<cr>", "Registers" },
        ["<leader>fk"] = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        ["<leader>fC"] = { "<cmd>Telescope commands<cr>", "Commands" },

        ["<leader>b"] = { "", "Buffers" },
        ["<leader>bb"] = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },

        ["<leader>g"] = { "", "Git" },
        ["<leader>go"] = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        ["<leader>gb"] = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        ["<leader>gc"] = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        ["<leader>gC"] = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)" },

        ["<leader>g"] = { "", "LSP" },
        ["<leader>ls"] = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" }
    }

    telescope.setup({
        pickers =
        {
            find_files =
            {
                hidden = true,
            },
            live_grep =
            {
                additional_args = function(opts)
                    return {"--hidden"}
                end
            },
        },
        extensions =
        {
            fzf =
            {
                fuzzy = true,                    -- false will only do exact matching
                override_generic_sorter = true,  -- override the generic sorter
                override_file_sorter = true,     -- override the file sorter
                case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            }
        },
    })

    telescope.load_extension("fzf")
end

return M
