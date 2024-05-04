local M =
{
    "williamboman/mason-lspconfig.nvim",
    dependencies =
    {
        "williamboman/mason.nvim",
    },
}

function M.config()
    local servers =
    {
        "bashls",
        "biome",
        "clangd",
        "cssls",
        "eslint",
        "html",
        "jsonls",
        "lua_ls",
        "marksman",
        "tsserver",
        "yamlls",
    }

    require("mason").setup(
    {
        ui =
        {
            border = "rounded",
        },
    })

    require("mason-lspconfig").setup(
    {
        ensure_installed = servers,
    })
end

return M
