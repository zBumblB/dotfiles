vim.schedule(function ()
	vim.g.coq_settings = {
		["limits.completion_auto_timeout"] = 0.5,
		["keymap.bigger_preview"] = "<c-g>"
	}
	local lsp = require "lspconfig"
	require("packer").loader("coq_nvim coq.artifacts")

	-- c, c++
	lsp.ccls.setup(require("coq")().lsp_ensure_capabilities{
	})
end)




