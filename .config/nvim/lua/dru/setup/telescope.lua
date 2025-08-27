local function build_fzf_native()
    if (vim.fn.has('win32')) then
        return "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && copy build\\Release\\* build\\"
    else
        return "make"
    end
end

local M =
{
    "nvim-telescope/telescope.nvim",
    dependencies =
    {
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = build_fzf_native(),
        },
        "nvim-lua/plenary.nvim",
    },
    lazy = false,
    cmd = "Telescope"
}

function M.config()
    local wk = require "which-key"
    wk.add
    {
        { "<leader>f", "", desc = "Telescope / Find" },

        {"<leader>fb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
        {"<leader>fc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
        {"<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
        {"<leader>fp", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", desc = "Projects" },
        {"<leader>ft", "<cmd>Telescope live_grep<cr>", desc = "Find Text" },
        {"<leader>fs", "<cmd>Telescope grep_string<cr>", desc = "Find String under cursor" },
        {"<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
        {"<leader>fH", "<cmd>Telescope highlights<cr>", desc = "Highlights" },
        {"<leader>fi", "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", desc = "Media" },
        {"<leader>fl", "<cmd>Telescope resume<cr>", desc = "Last Search" },
        {"<leader>fM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
        {"<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent File" },
        {"<leader>fR", "<cmd>Telescope registers<cr>", desc = "Registers" },
        {"<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
        {"<leader>fC", "<cmd>Telescope commands<cr>", desc = "Commands" },

        {"<leader>fw", desc = "Worktrees" },
        {"<leader>fww", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", desc = "Switch" },
        {"<leader>fwc", "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", desc = "Create" },

        {"<leader>b", "", desc = "Buffers" },
        {"<leader>bb", "<cmd>Telescope buffers previewer=false<cr>", desc = "Find" },

        {"<leader>g", "", desc = "Git" },
        {"<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file" },
        {"<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
        {"<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
        {"<leader>gC", "<cmd>Telescope git_bcommits<cr>", desc = "Checkout commit(for current file)" },

        {"<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" }
    }

    local telescope = require("telescope")
    telescope.setup({
        defaults =
        {
            path_display =
            {
                "smart",
            },
        },
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
    telescope.load_extension("git_worktree")
end

return M
