P = function(value)
--[[ Function that print a table content in the screen. To be used in Neovim development  --]]
  print(vim.inspect(value))
  return value
end

function Set_env()
  -- Function to set environment variables from .env file
    local env = vim.env
    local env_file = os.getenv("HOME") .. '/dotfiles/nvim/.env'
    local file = io.open(env_file, "r")
    if file == nil then
        vim.notify("Environment file not found: " .. env_file)
        return
    end
    for line in file:lines() do
        local key, value = line:match("^([^=]+)=(.*)$")
        if key ~= nil then
            env[key] = value
        end
    end
    file:close()
end
