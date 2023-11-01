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
