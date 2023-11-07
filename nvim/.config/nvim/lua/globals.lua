P = function(value)
--[[ Function that print a table content in the screen. To be used in Neovim development  --]]
  print(vim.inspect(value))
  return value
end

function Save_file()
  -- save file using vim.api
  vim.api.nvim_command('silent! w')
  vim.notify(vim.fn.expand('%:t') .. ' saved')
end

