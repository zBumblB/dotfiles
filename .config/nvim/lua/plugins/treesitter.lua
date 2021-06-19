require'nvim-treesitter.configs'.setup {
	ensure_installed = 'all',
	keymaps = {
		init_selection = 'gtt',
		node_incremental = 'gtn',
		scope_incremental = 'gts',
		node_decremental = 'gtd',
	},
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
		disable = {"python"},
	},
	autotag = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = 1000,
	}
}
