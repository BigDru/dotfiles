local M =
{
    "nvim-neorg/neorg",
    version = "v7.0.0",
    lazy = false,
}

function M.config()
    local neorg_ok, neorg = pcall(require, "neorg")
    if not neorg_ok then
        vim.notify("Unable to load Neorg")
        return
    end

    neorg.setup
    {
        load = {
            ["core.defaults"] = {}, -- loads default behaviour
            ["core.concealer"] = {}, -- Adds icons
            ["core.dirman"] = -- Manages Neorg workspaces
            {
                config =
                {
                    workspaces =
                    {
                        todo = "~/work/docs/todo/todo"
                    },
                },
            },
            ["core.integrations.treesitter"] = {},
            ["core.integrations.nvim-cmp"] = {},
        },
    }
end

return M
