LAZY_PLUGIN_SPEC = {}

function spec(item)
    table.insert(LAZY_PLUGIN_SPEC, { import = item })
end

spec "dru.setup.autopairs"
spec "dru.setup.bufferline"
spec "dru.setup.cmp"
spec "dru.setup.colorscheme"
spec "dru.setup.gitsigns"
spec "dru.setup.lualine"
spec "dru.setup.mason"
spec "dru.setup.nvim-tree"
spec "dru.setup.neorg"
spec "dru.setup.telescope"
spec "dru.setup.todo-comments"
spec "dru.setup.treesitter"
spec "dru.setup.trouble"
spec "dru.setup.vim-better-whitespace"
spec "dru.setup.vimtex"
spec "dru.setup.whichkey"
