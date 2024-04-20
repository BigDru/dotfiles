local M = 
{
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
}

function M.config()
    vim.cmd.colorscheme "nightfox"
    vim.cmd [[ set background=dark ]]
end

return M
