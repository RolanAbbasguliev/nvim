local lsp_zero = require('lsp-zero');
lsp_zero.extend_lspconfig();

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "tsserver", "html", "cssls", "clangd", "emmet_ls", "gopls"}
})

local on_attach = function(_, bufnr)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

require("lspconfig").lua_ls.setup {
    on_attach = on_attach
}

require("lspconfig").tsserver.setup {
    on_attach = on_attach
}

require("lspconfig").html.setup {
    on_attach = on_attach
}

require("lspconfig").cssls.setup {
    on_attach = on_attach
}

require("lspconfig").clangd.setup {
    on_attach = on_attach;
}

require("lspconfig").emmet_ls.setup {
    on_attach = on_attach;
}

require("lspconfig").gopls.setup {
    on_attach = on_attach;
}
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  mapping = {
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    -- ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    -- ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  }
})


