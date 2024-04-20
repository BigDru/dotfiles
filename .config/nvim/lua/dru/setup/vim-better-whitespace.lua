local M =
{
    "ntpeters/vim-better-whitespace",
    lazy = false,
}

function M.config()
    vim.api.nvim_create_autocmd(
    { 'BufWritePre' },
    {
        pattern = { '*' },
        command = [[%s/\s\+$//e]],
    })

    vim.api.nvim_create_autocmd(
    { 'BufWritePre' },
    {
        pattern = '*',
        command = 'retab',
    })
end

return M
