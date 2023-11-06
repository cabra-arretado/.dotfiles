local c_present, cmp = pcall(require, 'cmp')
if not c_present then
  return
end

local l_present, luasnip = pcall(require, 'luasnip')
if not l_present then
  return
end

local cmp_select = { behavior = cmp.SelectBehavior.Select }
-- Global setup.
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  experimental = {
    ghost_text = true,
    native_menu = false
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<M-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<M-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<M-y>'] = cmp.mapping.confirm({ select = true }),
    ["<M-Space>"] = cmp.mapping.complete(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'nvim_lsp_signature_help' }
  }),
  completion = {
    keyword_length = 1,
  }
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
