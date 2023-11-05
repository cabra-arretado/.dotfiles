local ok, neotree = pcall(require, "neo-tree")

if not ok then
  return
end

neotree.setup({
  filesystem = {
    filtered_items = {
      visible = true,
    },
  },
  source_selector = {
    winbar = true,
    content_layout = "center",
  }
})
