local api = vim.api -- access the VIM Lua API
local autogroup = function(name)
  return api.nvim_create_augroup("FM: " .. name, { clear = true })
end

local general = autogroup('general')

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

-- Terraform files
api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  group = general,
  pattern = '*.tf',
  command = [[set filetype=hcl]]
})
