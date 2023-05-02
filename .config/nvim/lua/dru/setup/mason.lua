local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
    vim.notify("Unable to load Mason")
    return
end

mason.setup()

local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
    vim.notify("Unable to load Mason-lspconfig")
    return
end

mason_lspconfig.setup()

local lsp_zero_ok, lsp_zero = pcall(require, "lsp-zero")
if not lsp_zero_ok then
    vim.notify("Unable to load lsp-zero")
    return
end

lsp_zero.preset("recommended")

lsp_zero.configure('lua_ls',
{
    settings =
    {
        Lua =
        {
            diagnostics =
            {
                globals = { "vim" },
            },
        },
    },
})

lsp_zero.setup()
