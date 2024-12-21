local M =
{
    "lewis6991/gitsigns.nvim",
}

function M.config()
    local gitsigns_status_ok, gitsigns = pcall(require, "gitsigns")
    if not gitsigns_status_ok then
        print("gitsigns include failed")
        return
    end

    local icons = require("dru.icons")

    gitsigns.setup
    {
        signs =
        {
            add = { text = icons.ui.BoldLineLeft },
            change = { text = icons.ui.BoldLineLeft },
            delete = { text = icons.ui.Triangle },
            topdelete = { text = icons.ui.Triangle },
            changedelete = { text = icons.ui.BoldLineLeft },
            untracked    = { text = icons.ui.BoldLineDashedMiddle },
        },
        signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir =
        {
            interval = 1000,
            follow_files = true
        },
        attach_to_untracked = true,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts =
        {
            virt_text = true,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
            delay = 1000,
            ignore_whitespace = false,
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000, -- Disable if file is longer than this (in lines)
        preview_config =
        {
            -- Options passed to nvim_open_win
            border = 'single',
            style = 'minimal',
            relative = 'cursor',
            row = 0,
            col = 1
        },
    }
end

return M
