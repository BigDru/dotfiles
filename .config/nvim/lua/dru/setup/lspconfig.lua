local M =
{
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies =
    {
        "folke/neodev.nvim"
    },
}

local function map_lsp_keys(buffer)
    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_buf_set_keymap

    keymap(buffer, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
    keymap(buffer, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
    keymap(buffer, "n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
    keymap(buffer, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
    keymap(buffer, "n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
    keymap(buffer, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
    keymap(buffer, "n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
end

M.on_attach = function(client, buffer)
    map_lsp_keys(buffer)
end

function M.common_capabilities()
    local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if status_ok then
        return cmp_nvim_lsp.default_capabilities()
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport =
    {
        properties =
        {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    }

    return capabilities
end

function M.config()
    local lspconfig = require("lspconfig")
    local icons = require("dru.icons")

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

    local default_diagnostic_config =
    {
        signs =
        {
            active = true,
            values =
            {
                { name = "DiagnosticSignError", text = icons.diagnostics.Error },
                { name = "DiagnosticSignWarn", text = icons.diagnostics.Warn },
                { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
                { name = "DiagnosticSignInfo", text = icons.diagnostics.Info },
            },
        },
        --virtual_text = false,
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float =
        {
            focusable = true,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(default_diagnostic_config)

    for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
        vim.fn.sign_define(sign.name,
        {
            texthl = sign.name,
            text = sign.text,
            numhl = sign.name,
        })
    end

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
    require("lspconfig.ui.windows").default_options.border = "rounded"

    for _, server in pairs(servers) do
        local opts =
        {
            on_attach = M.on_attach,
            capabilities = M.common_capabilities(),
        }

        local require_ok, settings = pcall(require, "dru.lspsettings." .. server)
        if require_ok then
            opts = vim.tbl_deep_extend("force", settings, opts)
        end

        if server == "lua_ls" then
            require("neodev").setup()
        end

        lspconfig[server].setup(opts)
    end
end

return M
