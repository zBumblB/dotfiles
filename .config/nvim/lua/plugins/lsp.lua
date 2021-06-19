local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end



-- local fn = vim.fn
-- local cfg = require'lspconfig'


-- -- c, c++
-- cfg.clangd.setup{ }


-- -- lua
-- local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'

-- cfg.sumneko_lua.setup {
-- 	cmd = {'/usr/bin/lua-language-server', "-E", sumneko_root_path .. "/main.lua"},
-- }

-- -- shell
-- cfg.bashls.setup { }
