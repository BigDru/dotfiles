local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    print("Require nvim-tree failed")
    return
end

--disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup(
{
    disable_netrw = true,           -- disable Lexplore
    open_on_setup = false,
    open_on_setup_file = false,
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
        adaptive_size = true, -- resize window on each draw based on longest line
        centralize_selection = true,
        number = true,
        signcolumn = "no",
    },
    renderer =
    {
        add_trailing = true, -- folder slash
        group_empty = false,
        full_name = false,
        highlight_git = false, -- true hides open highlighting option below
        highlight_opened_files = "all",
        indent_width = 2, -- default value is 2
        indent_markers =
        {
            enable = true,
            inline_arrows = false,
        },
        icons =
        {
            show =
            {
                folder_arrow = false,
            },
        },
    },
    diagnostics =
    {
        enable = true,
    },
    filters =
    {
        dotfiles = false,
    },
})
