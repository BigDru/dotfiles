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
