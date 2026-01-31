return
{
    cmd =
    {
        vim.fn.stdpath("data") .. "/mason/bin/java-language-server",
    },
    handlers = {
        -- Suppress the dynamic registration error by providing a custom handler
        ["client/registerCapability"] = function(err, result, ctx)
            -- Safely handle registration even if result is incomplete
            if not result or not result.registrations then
                return
            end
            return vim.lsp.handlers["client/registerCapability"](err, result, ctx)
        end,
    },
}
