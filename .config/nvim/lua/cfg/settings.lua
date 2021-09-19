-- There's currently no :set equivalent in lua, you either set option globally
-- or locally. Those options are set directly with :set (through vim.cmd)
local cmd = vim.cmd

vim.wo.list = true -- display listchars
-- vim.o.listchars = 'tab:  ▸,trail:·,extends:#,nbsp:·' -- maybe "¬" for extends
vim.o.listchars = 'tab:  ,trail:·,extends:¬,nbsp:·'
vim.wo.number = true -- displays nr of curr line offset to other nrs
vim.wo.relativenumber = true -- show line numbers relative to current line
vim.wo.wrap = false -- display long lines as just one line
vim.o.ignorecase = true -- case insensitive search
vim.o.smartcase = true -- case sensitive iff there's an uppercase letter in search
vim.o.clipboard = 'unnamedplus' -- use system clipboard
vim.wo.foldmethod = 'marker' -- fold on markers ('{{{' and '}}})
vim.o.mouse = 'a' -- enable mouse support
cmd('set ts=2') -- tabstop - insert 4 spaces for a tab
cmd('set sw=2') -- shiftwidth - number of spaces used for indenting
vim.o.shiftround = true -- round indent to multiple of shiftwidth (including < and >)
vim.o.scrolloff = 4 -- keep some lines above and bellow cursor when scrolling
-- vim.o.formatoptions+='1' -- TODO
vim.o.shortmess = vim.o.shortmess .. 'c'  -- don't pass messages to ins-completion-menu
vim.o.lazyredraw = true -- don't redraw while executing macros and such
cmd('set noswapfile') -- don't create swap file
cmd('set undofile') -- persistent undos
-- vim.o.title = true -- TODO: titlestring
vim.wo.cursorline = true -- highlight current line
vim.o.termguicolors = true -- TODO: fix colorscheme
vim.o.fillchars='vert: '
vim.o.hidden = true
