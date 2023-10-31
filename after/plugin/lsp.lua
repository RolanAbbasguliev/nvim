local lsp = require("lsp-zero")

lsp.preset("recommended")

require('lsp-zero').setup_servers({'tsserver', 'eslint', 'rust_analyzer'})

