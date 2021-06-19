-- vim.cmd('imap <tab> <Plug>(completion_smart_tab)')
-- vim.cmd('imap <s-tab> <Plug>(completion_smart_s_tab)')

vim.cmd('inoremap <expr> <Tab>   pumvisible() ? "\\<C-n>" : "\\<Tab>"')
vim.cmd('inoremap <expr> <S-Tab>   pumvisible() ? "\\<C-p>" : "\\<S-Tab>"')
vim.cmd('imap <silent> <c-p> <Plug>(completion_trigger)')

_G.completion_matching_smart_case = 1
vim.cmd('au BufEnter * lua require"completion".on_attach()')
vim.o.completeopt = 'menuone,noinsert,noselect'
_G.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
vim.cmd("let completion_enable_snippet='snippets.nvim'")
