local M =
{
    "ThePrimeagen/git-worktree.nvim",
}

function M.config()
    local status_ok, git_worktree = pcall(require, "git-worktree")
    if not status_ok then
        vim.notify("git-worktree failed to load")
        return
    end

    git_worktree.setup(
    {
        -- change_directory_command = <str> -- default: "cd",
        -- update_on_change = <boolean> -- default: true,
        -- update_on_change_command = <str> -- default: "e .",
        -- clearjumps_on_change = <boolean> -- default: true,
        -- autopush = <boolean> -- default: false,
    })
end

return M
