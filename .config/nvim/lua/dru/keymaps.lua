local opts = { noremap = true, silent = true }
-- noremap = no recurse map

vim.api.nvim_set_keymap("", "<Space>", "<Nop>", opts)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
vim.api.nvim_set_keymap("n", "<C-Up>", ":resize +2<cr>", opts)              -- increase size
vim.api.nvim_set_keymap("n", "<C-Down>", ":resize -2<cr>", opts)            -- decrease size
vim.api.nvim_set_keymap("n", "<C-Left>", ":vertical resize -2<cr>", opts)   -- increase size
vim.api.nvim_set_keymap("n", "<C-Right>", ":vertical resize +2<cr>", opts)  -- decrease size

-- Navigate buffers
--vim.api.nvim_set_keymap("n", "<S-l>", ":bnext<cr>", opts)
--vim.api.nvim_set_keymap("n", "<S-h>", ":bprev<cr>", opts)

-- Insert
-- jk fast to enter
vim.api.nvim_set_keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
vim.api.nvim_set_keymap("v", "<", "<gv", opts)
vim.api.nvim_set_keymap("v", ">", ">gv", opts)

-- Move text up and down
vim.api.nvim_set_keymap("v", "<A-j>", ":m .+1<cr>==", opts)
vim.api.nvim_set_keymap("v", "<A-k>", ":m .-2<cr>==", opts)

-- If you select something in visual mode and then paste over it, the new text will overwrite your register.
--  This mapping will hold onto whatever is currently in your register so you can select something else and overwrite again
vim.api.nvim_set_keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
vim.api.nvim_set_keymap("x", "J", ":move '>+1<cr>gv-gv", opts)
vim.api.nvim_set_keymap("x", "K", ":move '<-2<cr>gv-gv", opts)
vim.api.nvim_set_keymap("x", "<A-j>", ":move '>+1<cr>gv-gv", opts)
vim.api.nvim_set_keymap("x", "<A-k>", ":move '<-2<cr>gv-gv", opts)

-- Nvim-Tree
vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
vim.api.nvim_set_keymap("n", "ZZ", ":NvimTreeClose<cr>ZZ", opts)
vim.api.nvim_set_keymap("n", "ZQ", ":NvimTreeClose<cr>ZQ", opts)

-- Telescope
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)

-- Trouble
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
vim.api.nvim_set_keymap("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", opts)

-- Navigate buffers
vim.api.nvim_set_keymap("n", "<S-l>", ":bnext<cr>", opts)
vim.api.nvim_set_keymap("n", "<S-h>", ":bprev<cr>", opts)
