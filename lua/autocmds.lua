local api = vim.api -- access the VIM Lua API
local autogroup = function(name)
  return api.nvim_create_augroup("CreatedByMe__" .. name, {clear = true})
end

local myGroup = autogroup('general')
-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
  group = myGroup,
  callback = function() vim.highlight.on_yank({ timeout = 300 }) end
})

-- Lua formatting
api.nvim_create_autocmd("FileType", {
  group = myGroup,
  pattern = 'lua',
  callback = function()
    vim.bo[0].expandtab = true
    vim.bo[0].shiftwidth = 2
  end
})

-- TS to work with Terraform files
api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  group = myGroup,
  pattern = '*.tf',
  command = [[set filetype=hcl]]
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = myGroup,
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})
