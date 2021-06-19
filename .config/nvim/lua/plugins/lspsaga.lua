local saga = require'lspsaga'

remap('n', 'gh', "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>")
remap('n', '<leader>ca', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>")
remap('v', '<leader>ca', ":<C-U>lua require('lspsaga.codeaction').code_action()<CR>")
remap('n', 'K', "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>")
remap('n', 'K', "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>")
remap('n', '<c-f>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
remap('n', '<c-d>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")
remap('n', 'gs', "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>")
remap('n', 'gr', "<cmd>lua require('lspsaga.rename').rename()<CR>")
remap('n', 'gd', "<cmd>lua require('lspsaga.provider').preview_definition()<CR>")
remap('n', '<leader>cd', "<cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>")
remap('n', '<leader>cc', "<cmd>lua require('lspsaga.diagnostic').show_cursor_diagnostics()<CR>")
remap('n', '<leader>j', "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_next()<CR>")
remap('n', '<leader>k', "<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_prev()<CR>")

saga.init_lsp_saga()
