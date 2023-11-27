local ok, trouble = pcall(require, "trouble")
if not ok then
  return
end

trouble.setup({
  use_diagnostic_signs = true
})

require("utils").map({ 'n' }, "<space>di", ":TroubleToggle document_diagnostics <CR>")
