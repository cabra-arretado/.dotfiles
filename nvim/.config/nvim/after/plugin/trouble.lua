local ok, trouble = pcall(require, "trouble")
if not ok then
	return
end
trouble.setup({
  use_diagnostic_signs = true
})
local nnoremap = require("utils").nnoremap
nnoremap("<Leader>di", ":TroubleToggle document_diagnostics <CR>")
