vim.o.completeopt = "menuone,noselect"

vim.cmd('inoremap <silent><expr> <C-Space> compe#complete()')
vim.cmd('inoremap <silent><expr> <CR>      compe#confirm(luaeval("require \'nvim-autopairs\'.autopairs_cr()"))')
vim.cmd('inoremap <silent><expr> <C-e>     compe#close(\'<C-e>\')')
vim.cmd('inoremap <silent><expr> <C-f>     compe#scroll({ \'delta\': +4 })')
vim.cmd('inoremap <silent><expr> <C-d>     compe#scroll({ \'delta\': -4 })')

require'compe'.setup({
	source = {
		path = true,
		nvim_lsp = true,
		nvim_lua = true,
		luasnip = true,
	},
})
