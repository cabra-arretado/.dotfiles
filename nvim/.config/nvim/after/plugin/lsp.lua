local config_ok, lsp_config = pcall(require, "lspconfig")
if not config_ok then
  return
end

local zero_ok, lsp_zero = pcall(require, "lsp-zero")
if not zero_ok then
  return
end

local lsp = lsp_zero.preset({
  name = "recommended",
  sign_icons = {
    error = "",
    warn = "",
    hint = "",
    info = "",
  },
})

------------- LSP Mappings ----------------

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local lsp_map = function(modes, lhs, rhs, desc)
    local options = { noremap = true, silent = true, buffer = bufnr }
    if desc then
      options.desc = 'LSP: ' .. desc
    end
    vim.keymap.set(modes, lhs, rhs, options)
  end

  local telescope = require('telescope.builtin')
  lsp_map({ 'n', 'v' }, 'gd', vim.lsp.buf.definition, '[G]o to [d]efinition')
  lsp_map({ 'n', 'v' }, '<space>kk', vim.lsp.buf.hover, 'Hover over')
  lsp_map({ 'n', 'v' }, 'gi', vim.lsp.buf.implementation, '[G]o to [I]mplementation')
  lsp_map({ 'n', 'v' }, '<space>kh', vim.lsp.buf.signature_help, '[S]ignature [H]elp')
  lsp_map({ 'i' }, '<C-h>', vim.lsp.buf.signature_help, '[S]ignature [H]elp')
  lsp_map({ 'n', 'v' }, '<space>wa', vim.lsp.buf.add_workspace_folder, 'Add Worspace Folder')
  lsp_map({ 'n', 'v' }, '<space>wr', vim.lsp.buf.remove_workspace_folder, 'Remove Worspace Folder')
  lsp_map({ 'n', 'v' }, '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, 'Print Workspace Folder List')
  lsp_map({ 'n', 'v' }, 'gD', vim.lsp.buf.type_definition, 'Type Definition')
  lsp_map({ 'n', 'v' }, '<space>d', vim.diagnostic.open_float, 'Open Line Diagnostic')
  lsp_map({ 'n', 'v' }, '<space>rs', vim.lsp.buf.rename, '[R]ename Symbol')
  lsp_map({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action)
  lsp_map({ 'n', 'v' }, '<space>f', function()
    vim.lsp.buf.format({ async = true })
  end, '[F]ormat doc')
  lsp_map({ 'n', 'v' }, '<F6>', vim.diagnostic.hide, 'Hide LSP suggestions')
  lsp_map({ 'n', 'v' }, '<space>e', vim.diagnostic.open_float, 'Show Diagnostic')
  lsp_map({ 'n', 'v' }, '[d', vim.diagnostic.goto_prev, 'Previous Diagnostic')
  lsp_map({ 'n', 'v' }, ']d', vim.diagnostic.goto_next, 'Next Diagnostic')
  lsp_map({ 'n', 'v' }, '<space>q', vim.diagnostic.setloclist, 'Diagnostic List')
  lsp_map({ 'n', 'v' }, 'gr', telescope.lsp_references, 'Go to [R]eferences')
  lsp_map({ 'n', 'v' }, '<space>qf', telescope.quickfix, '[Q]uickfix')
  lsp_map({ 'n', 'v' }, '<space>ws', telescope.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  lsp_map({ 'n', 'v' }, '<space>ds', telescope.lsp_document_symbols, '[D]ocument [S]ymbols')

  if client.name == "eslint" then
    lsp_map({'n', 'v'}, "<leader>e", ":EslintFixAll<cr>")
  end
end

lsp_zero.on_attach(on_attach)

local lsp_flags = {
  debounce_text_changes = 150,
}

vim.diagnostic.config({
  virtual_text = true,
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

local ensure_installed = {
  'pyright',
  'tsserver',
  'gopls',
  'rust_analyzer',
  'eslint',
  'jsonls',
}

-- Mason Setup
require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = ensure_installed,
  automatic_installation = true,
})
lsp_zero.setup_servers(ensure_installed)

if vim.fn.executable('lua-language-server') == 1 then
  lsp_config.lua_ls.setup {
    -- REPO: https://github.com/LuaLS/lua-language-server
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    -- on_attach = on_attach,
    flags = lsp_flags,
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace",
        },
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { 'vim' },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  }
end
