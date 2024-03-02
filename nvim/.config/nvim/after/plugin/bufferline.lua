vim.opt.termguicolors = true

local present, bufferline = pcall(require, "bufferline")

if not present then
  return
end

bufferline.setup {
  options = {
    diagnostics = 'nvim_lsp',
    style = 'padded_slant',
    mode = 'buffers',
    indicator = {
      icon = '|',
      style = 'icon',
    },
    buffer_close_icon = 'x',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    separator_style = "thick",
    offsets = {
      {
        filetype = "neo-tree",
        text = "File Explorer",
        highlight = "Directory",
        separator = true
      }
    }
  }
}
