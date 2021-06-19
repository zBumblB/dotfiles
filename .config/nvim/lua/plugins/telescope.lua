require'telescope'.setup { }

function O.edit_config()
	require'telescope.builtin'.find_files {
		cwd = "~/.config",
		find_command = { 'fd', '-L', '-E', 'BraveSoftware' },
	}
end

function O.edit_projects()
	require'telescope.builtin'.find_files {
		cwd = "$PROJECTS",
		find_command = { 'fd', '-L' },
	}
end

remap('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
remap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
remap('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
remap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
remap('n', '<leader>fc', "<cmd>lua O.edit_config()<cr>")
remap('n', '<leader>fp', "<cmd>lua O.edit_projects()<cr>")
