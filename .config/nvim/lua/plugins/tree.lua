vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_disable_netrw = 1
vim.g.nvim_tree_hide_dotfiles = 1
remap('n', '<C-n>', ':NvimTreeToggle<CR>')
remap('n', '<leader>r', ':NvimTreeRefresh<CR>')
remap('n', '<leader>n', ':NvimTreeFindFile<CR>')

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
	-- ["<CR>"] = ":YourVimFunction()<cr>",
	-- ["u"] = ":lua require'some_module'.some_function()<cr>",

	-- default mappings
	["<CR>"]   = tree_cb("edit"),
	["o"]   = tree_cb("edit"),
	["c"]      = tree_cb("cd"),
	["v"]      = tree_cb("vsplit"),
	["<C-o>"]  = tree_cb("split"),
	["<"]      = tree_cb("prev_sibling"),
	[">"]      = tree_cb("next_sibling"),
	["<Tab>"]  = tree_cb("preview"),
	["I"]      = tree_cb("toggle_ignored"),
	["h"]      = tree_cb("toggle_dotfiles"),
	["R"]      = tree_cb("refresh"),
	["a"]      = tree_cb("create"),
	["d"]      = tree_cb("remove"),
	["r"]      = tree_cb("rename"),
	["<C-r>"]  = tree_cb("full_rename"),
	["x"]      = tree_cb("cut"),
	["y"]      = tree_cb("copy"),
	["p"]      = tree_cb("paste"),
	["gp"]     = tree_cb("prev_git_item"),
	["gn"]     = tree_cb("next_git_item"),
	["<S-CR>"] = tree_cb("dir_up"),
	["q"]      = tree_cb("close"),
}
