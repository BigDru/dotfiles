local M =
{
    "polarmutex/git-worktree.nvim",
    dependencies =
    {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    }
}

function M.config()
    local status_ok, git_worktree = pcall(require, "git-worktree")
    if not status_ok then
        vim.notify("git-worktree failed to load")
        return
    end
end

return M
