-- Configure diagnostic display with custom signs
local icons = require("dru.icons")

vim.diagnostic.config({
    float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = true, -- Show source in diagnostic popup window
        header = "",
        prefix = "",
    },
    virtual_text = false,
    virtual_lines = false,
    signs = {
        active = true,
        text = {
            [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
            [vim.diagnostic.severity.WARN] = icons.diagnostics.Warn,
            [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
            [vim.diagnostic.severity.INFO] = icons.diagnostics.Info,
        },
    },
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

-- Enable inlay hints
vim.lsp.inlay_hint.enable(true)

-- Add additional capabilities supported by blink-cmp
-- local blink_status_ok, blink = pcall(require, "blink.cmp")
-- if blink_status_ok then
--     local ext_capabilities = vim.tbl_deep_extend("force", {}, lsp_capabilities, blink.get_lsp_capabilities())
--     -- Configure LSP servers using the new vim.lsp.config syntax
--     -- Default configuration for all servers
--     vim.lsp.config("*", {
--         capabilities = ext_capabilities,
--     })
-- end


local servers = {
    "angularls",
    "bashls",
    "biome",
    "clangd",
    "cssls",
    "cssmodules_ls",
    "css_variables",
    "dockerls",
    "eslint",
    "html",
    "jsonls",
    "lua_ls",
    "marksman",
    "ts_ls",
    "yamlls",
}

local lsp_default_capabilities = vim.lsp.protocol.make_client_capabilities()
for _, server in pairs(servers) do
    local opts =
    {
        capabilities = lsp_default_capabilities,
    }

    local require_ok, settings = pcall(require, "dru.lspsettings." .. server)
    if require_ok then
        opts = vim.tbl_deep_extend("force", settings, opts)
    end

    vim.lsp.config(server, opts)
    vim.lsp.enable(server)
end

local function safe_keyset(desc, mode, key, command, opts)
    opts.desc = desc
    local status, err = pcall(vim.keymap.set, mode, key, command, opts)
    if not status then
        local msg = string.format("Keymap error for '%s' (%s): %s\n%s", desc, key, err, debug.traceback())
        vim.notify(msg, vim.log.levels.ERROR)
    end
end

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        safe_keyset("Show LSP references", "n", "gr", vim.lsp.buf.references, opts)
        -- keymap.set("n", "gr", "<cmd>FzfLua lsp_references<CR>", opts)

        safe_keyset("Go to declaration", "n", "gD", vim.lsp.buf.declaration, opts)

        safe_keyset("Show LSP definitions", "n", "gd", vim.lsp.buf.definition, opts)
        -- keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", opts)

        -- keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", opts)
        safe_keyset("Show LSP implementations", "n", "gi", vim.lsp.buf.implementation, opts)

        -- keymap.set("n", "gt", "<cmd>FzfLua lsp_typedefs<CR>", opts)
        safe_keyset("Show LSP type definitions", "n", "gt", vim.lsp.buf.type_definition, opts)

        safe_keyset("See available code actions", { "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        safe_keyset("Smart rename", "n", "<leader>lr", vim.lsp.buf.rename, opts)

        safe_keyset("Show line diagnostics", "n", "gl", vim.diagnostic.open_float, opts)

        safe_keyset("Go to previous diagnostic", "n", "<leader>dk", function()
            vim.diagnostic.jump({ count = -1, float = true })
        end, opts)

        safe_keyset("Go to next diagnostic", "n", "<leader>dj", function()
            vim.diagnostic.jump({ count = 1, float = true })
        end, opts)

        safe_keyset("Show documentation for what is under cursor", "n", "K", vim.lsp.buf.hover, opts)

        safe_keyset("Show signature help", "n", "gs", vim.lsp.buf.signature_help, opts)

        -- opts.desc = "Show buffer diagnostics"
        -- keymap.set("n", "<leader>D", "<cmd>FzfLua diagnostics_document<CR>", opts)
    end,
})
