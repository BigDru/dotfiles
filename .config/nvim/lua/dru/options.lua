vim.opt.keywordprg = ":help"

vim.opt.number = true
vim.opt.numberwidth = 5

vim.opt.cursorline = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.swapfile = false

vim.opt.autoindent = true
vim.opt.tabstop = 4         -- visually, how many cols a tab should use
vim.opt.expandtab = true    -- expands tab into spaces
vim.opt.shiftwidth = 0      -- controls how many  cols text is indented with >> and <<. 0 means cols shifter == tabstop number
vim.opt.softtabstop = 0     -- if different from tabstop, spaces are used to make the difference. 0 means this feature is off
