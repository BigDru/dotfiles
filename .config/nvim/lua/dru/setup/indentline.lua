local M = {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    main = "ibl",
}

function M.config()
    local icons = require "dru.icons"

    require("ibl").setup {
        exclude =
        {
            buftypes =
            {
                "terminal",
                "nofile"
            },
            filetypes = {
                "help",
                "startify",
                "dashboard",
                "lazy",
                "neogitstatus",
                "NvimTree",
                "Trouble",
                "text",
            },
        },
        indent =
        {
            char = icons.ui.LineMiddle,
        }
    }

end

return M
