local cmp_ok, cmp = pcall(require, 'cmp')
if not cmp_ok then
  return
end

-- Don't show the dumb matching stuff.
vim.opt.shortmess:append "c"

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mapping = cmp.mapping.preset.insert({
  ['<C-d>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-e>'] = cmp.mapping.close(),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-l>'] = cmp.mapping.confirm({ select = true }),
})

-- Global setup.
cmp.setup {
  experimental = {
    ghost_text = false,
    native_menu = false
  },
  mapping = cmp_mapping,
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer',                 keyword_length = 4 },
    { name = 'path' },
    { name = 'nvim_lsp_signature_help' }
  }),
  completion = {
    keyword_length = 2,
  },
}

-- `/` cmdline setup.
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- `:` cmdline setup.
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
