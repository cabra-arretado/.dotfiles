local api = vim.api -- access the VIM Lua API
local autogroup = function(name)
  return api.nvim_create_augroup("FM: " .. name, { clear = true })
end

local general = autogroup('general')
local format = autogroup('format')
-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
  group = general,
  callback = function() vim.highlight.on_yank({ timeout = 300 }) end
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = general,
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- Python files
api.nvim_create_autocmd("FileType", {
  group = format,
  pattern = { 'python' },
  callback = function()
    -- vim.bo[0].expandtab = false
    vim.bo[0].shiftwidth = 4
  end
})

-- Terraform files
api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  group = format,
  pattern = '*.tf',
  command = [[set filetype=hcl]]
})

-- Go files
api.nvim_create_autocmd("FileType", {
  group = format,
  pattern = { 'go' },
  callback = function()
    vim.bo[0].expandtab = false
    vim.bo[0].shiftwidth = 4
    vim.bo[0].softtabstop = 4
    vim.bo[0].tabstop = 4
  end
})

