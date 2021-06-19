require'gitsigns'.setup()

-- Doesn't work otherwise. I Don't know WHYYYYYYYYY!??!?!!??
vim.cmd('au BufEnter * hi link GitSignsAdd GitGutterAdd')
vim.cmd('au BufEnter * hi link GitSignsChange GitGutterChange')
vim.cmd('au BufEnter * hi link GitSignsDelete GitGutterDelete')
