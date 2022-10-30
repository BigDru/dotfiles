local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    vim.notify("Failed loading treesitter configs")
    return
end

configs.setup
{
    ensure_installed = "all",
    sync_install = false,
    ignore_install = { "" },
    highlight =
    {
        enable = true,
        disable = { "" },
        additional_vim_regex_highlighting = true,
    },
    indent =
    {
        enable = true,
        disable =
        {
            -- provide list of strings for parsers that aren't indenting well.
            -- Chris@machine offered "yaml" as an example
        },
    },
}
