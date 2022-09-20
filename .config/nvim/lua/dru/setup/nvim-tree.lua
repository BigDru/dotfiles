local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    print("Require nvim-tree failed")
    return
end

nvim_tree.setup(
{
    disable_netrw = true,           -- disable Lexplore
    open_on_setup = true,
    open_on_setup_file = true,
    open_on_tab = true,
    hijack_cursor = true,
    prefer_startup_root = false,    -- default value is false
    update_focused_file =
    {
        enable = true,
        update_root = true,
    },
    view =
    {
        adaptive_size = true,
        centralize_selection = true,
        number = true,
    },
    diagnostics = {
        enable = true,
    },
})
