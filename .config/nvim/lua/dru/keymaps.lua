local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- noremap = no recurse map

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ensure ctrl+i isn't tab
keymap("n", "<C-i>", "<C-i>", opts)

-- Normal --
--TODO: Add a keymap for closing the buffer
--keymap("n", "<A-w>", "<cmd>:Bdelete<cr>", opts)

-- Better window navigation (m = alt)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Center search results
-- repeat search
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
-- whole word match under cursor
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
-- Partial match under cursor
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<cr>", opts)              -- increase size
keymap("n", "<C-Down>", ":resize -2<cr>", opts)            -- decrease size
keymap("n", "<C-Left>", ":vertical resize -2<cr>", opts)   -- increase size
keymap("n", "<C-Right>", ":vertical resize +2<cr>", opts)  -- decrease size

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<cr>", opts)
keymap("n", "<S-h>", ":bprev<cr>", opts)

-- Quit buffer
keymap("n", "<leader>bw", ":Bdelete<cr>", opts)

-- Insert
-- jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<cr>==", opts)
keymap("v", "<A-k>", ":m .-2<cr>==", opts)

-- If you select something in visual mode and then paste over it, the new text will overwrite your register.
--  This mapping will hold onto whatever is currently in your register so you can select something else and overwrite again
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<cr>gv-gv", opts)
keymap("x", "K", ":move '<-2<cr>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<cr>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<cr>gv-gv", opts)

-- keep register contents when pasting in visual mode
keymap("x", "p", [["_dP]], opts)

-- Nvim-Tree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "ZZ", ":NvimTreeClose<cr>ZZ", opts)
keymap("n", "ZQ", ":NvimTreeClose<cr>ZQ", opts)

-- Trouble
keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
keymap("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", opts)

-- Gitsigns
keymap("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<cr>", opts)
keymap("v", "<leader>hs", "<cmd>Gitsigns stage_hunk<cr>", opts)
keymap("n", "<leader>hr", "<cmd>Gitsigns reset_hunk<cr>", opts)
keymap("v", "<leader>hr", "<cmd>Gitsigns reset_hunk<cr>", opts)
keymap("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<cr>", opts)
keymap("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<cr>", opts)
keymap("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<cr>", opts)
keymap("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<cr>", opts)

-- Neorg
keymap("n", "<leader>tt", ":Neorg workspace todo<cr>", opts)

