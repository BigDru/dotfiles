-- help options to see man
vim.opt.autoindent = true       -- Copy indent from current line when starting a new line
vim.opt.backup = false
vim.opt.cindent = false          -- Enables automatic C program indenting for cinkeys (default "0{,0},0),0],:,0#,!^F,o,O,e")
vim.opt.cmdheight = 2           -- more space in the command line for displaying messages
vim.opt.completeopt =           -- mostly for cmp (TODO: play with more)
{
    "menuone",                  -- use popup menu even when there is only one match
    --"preview",                  -- Show extra information about the currently selected completion in the preview window
    "noselect"                  -- Do not select a match in the menu (force user to select)
}
vim.opt.conceallevel = 0        -- shows `` in markdown files
vim.opt.cursorline = true
vim.opt.expandtab = true        -- expands tab into spaces
vim.opt.fileencoding = "utf-8"
vim.opt.fillchars:append('eob: ')   -- hide tilde at end of buffer
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.hlsearch = true         -- highlight all matches on a previous search pattern
vim.opt.ignorecase = false      -- ignore case in search pattern
vim.opt.incsearch = true        -- incremental search highlighting (as you type search pattern, matches are highlighted)
vim.opt.keywordprg = ":help"    -- Needed on windows (even WSL)
vim.opt.list = true             -- Enable list mode: show spaces, tabs, and eols
vim.opt.listchars = 'tab:►►►,space:·,nbsp:+,eol:↵'
vim.opt.mouse = "a"             -- enable all mouse support
vim.opt.mousemoveevent = true   -- deliver mouse move events to input queue
vim.opt.number = true           -- set numbers in file
vim.opt.numberwidth = 5         -- width of numbers column
vim.opt.pumheight = 10          -- popup menu height
vim.opt.relativenumber = false
vim.opt.shiftwidth = 0          -- controls how many cols text is indented with >> and <<. 0 means cols shifted == tabstop number
vim.opt.showmode = false        -- hides INSERT as we have custom bar
vim.opt.showtabline = 2         -- always show tab pages
vim.opt.signcolumn = "yes"      -- always show sign column (gray column on left of numbers) (prevents text shifting)
vim.opt.softtabstop = 0         -- if different from tabstop, spaces are used to make the difference. 0 means this feature is off
vim.opt.smartcase = false       -- overrides ignorecase option if search pattern contains upper case characters
vim.opt.smartindent = true     -- tabs on new lines (very annoying when set to true)
vim.opt.spelllang = "en"        -- for set spell (spellchecking)
vim.opt.splitbelow = true       -- horizontal splits are forced below
vim.opt.splitright = true       -- vertical splits are forced right
vim.opt.swapfile = false
vim.opt.tabstop = 4             -- visually, how many cols a tab should use
vim.opt.termguicolors = true    -- Enables 24-bit RBG color
vim.opt.timeoutlen = 1000       -- time to wait for a mapped sequenct to complete (ms)
vim.opt.undofile = true         -- creates a persistant file with undo history in the same directory
vim.opt.updatetime = 300        -- faster completion (4000 ms default)
vim.opt.wrap = true
vim.opt.writebackup = true      -- make a backup before overwritting a file
