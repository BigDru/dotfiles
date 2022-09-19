require("mason").setup()
require("mason-lspconfig").setup()

local zero = require("lsp-zero")
zero.preset("recommended")
zero.setup()
