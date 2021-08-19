local lsp = require "lspconfig"

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

-- c, c++
lsp.ccls.setup {
	capabilities = capabilities,
}

-- rust
lsp.rust_analyzer.setup {
	capabilities = capabilities,
}
