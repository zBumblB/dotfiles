local execute = vim.api.nvim_command
local fn = vim.fn

-- install packer if not present
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
	execute 'packadd packer.nvim'
end

vim.cmd('autocmd BufWritePost plugins.lua PackerCompile')


return require('packer').startup(function(use)
	-- Packer can manage itself as an optional plugin
	use 'wbthomason/packer.nvim'

	-- Statusline
	use {
		'glepnir/galaxyline.nvim',
		branch = 'main',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function() require'plugins.galaxyline' end,
	}

	use {
		'terrortylor/nvim-comment',
		config = function() require'plugins.comment' end,
	}

	-- use {
	-- 	'kyazdani42/nvim-tree.lua',
	-- 	requires = 'kyazdani42/nvim-web-devicons',
	-- 	config = function() require'plugins.tree' end,
	-- }

	use {
		'junegunn/vim-easy-align',
		config = function() require'plugins.align' end,
	}

	-- Buffer bar
	use {
		'romgrk/barbar.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function() require'plugins.barbar' end,
	}

	use {
		'lewis6991/gitsigns.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		},
		config = function() require'plugins.gitsigns' end,
	}

	use {
		'windwp/nvim-autopairs',
		config = function() require'plugins.autopairs' end,
	}

	use {
		'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
		config = function() require'plugins.telescope' end,
	}

	use {
		'neovim/nvim-lspconfig',
	}

	use {
		'kabouzeid/nvim-lspinstall',
		config = function() require'plugins.lsp' end,
	}

	use {
		'nvim-lua/completion-nvim',
		config = function() require'plugins.completion' end,
	}


	use {
		'norcalli/snippets.nvim',
		config = function() require'plugins.snippets' end,
	}

	use {
		'glepnir/lspsaga.nvim',
		config = function() require'plugins.lspsaga' end,
		requires = 'neovim/nvim-lspconfig'
	}

	use 'tpope/vim-surround'

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function() require'plugins.treesitter' end,
	}

	use {
		'folke/which-key.nvim',
		config = function() require'plugins.whichkey' end,
	}

	use {
		'tpope/vim-obsession'
	}

	use {
		'christoomey/vim-tmux-navigator',
		config = function() require'plugins.tmux' end,
	}

	-- Colorscheme
	use 'sainnhe/gruvbox-material'
end)
