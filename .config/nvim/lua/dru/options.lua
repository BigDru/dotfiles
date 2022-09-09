--vim.opt.keywordprg = ":help"  -- Needed on windows
vim.opt.autoindent = true
vim.opt.backup = false
vim.opt.cmdheight = 2	   	-- more space in the command line for displaying messages
vim.opt.completeopt =		-- mostly for cmp (TODO: play with more) 
{ 
	"menuone", 
	"preview", 
	"noselect" 
} 	
vim.opt.conceallevel = 0	-- shows `` in markdown files
vim.opt.cursorline = true
vim.opt.expandtab = true    	-- expands tab into spaces
vim.opt.fileencoding = "utf-8"
vim.opt.hlsearch = true
vim.opt.ignorecase = false
vim.opt.incsearch = true
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.pumheight = 10		-- popup menu height
vim.opt.relativenumber = false
vim.opt.shiftwidth = 0      	-- controls how many cols text is indented with >> and <<. 0 means cols shifted == tabstop number
--vim.opt.showmode = false		-- hides INSERT as we have custom bar
vim.opt.showtabline = 2		-- always show tabs
vim.opt.signcolumn = "yes"	-- prevent text shifting 
vim.opt.softtabstop = 0     	-- if different from tabstop, spaces are used to make the difference. 0 means this feature is off
vim.opt.smartcase = false
vim.opt.smartindent = true	-- tabs on new lines
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 4             -- visually, how many cols a tab should use
vim.opt.timeoutlen = 1000	-- time to wait for a mapped sequenct to complete (ms)
vim.opt.undofile = true		-- creates a persistant file with undo history in the same directory
vim.opt.updatetime = 300	-- faster completion (4000 ms default)
vim.opt.wrap = false
vim.opt.writebackup = true	-- 
