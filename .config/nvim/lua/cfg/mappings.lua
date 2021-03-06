-- NOTE: Plugin specific mappings are located in their respective configs
local remap = _G.remap

vim.g.mapleader = " "

-- Yes.
remap('t', '<Esc>', '<C-\\><C-n>')
remap('n', 'Y', 'y$')

---- Can't have silent
remap('n', ';', ':', {noremap = true})
remap('v', ';', ':', {noremap = true})

-- Handle url under cursor
remap('n', '<leader>u', ':lua HandleURL()<CR>')

-- Toggle cursor column
remap('n', '<leader>s', ':set cuc!<CR>')

-- Unhighlight on esc
remap('n', '<Esc>', ':noh<CR><C-l>')

-- Make searching not suck by default
remap('n', '/', '/\\v', {noremap = true})
remap('v', '/', '/\\v', {noremap = true})

-- j and k act as expected when lines wrapped
remap('n', 'j', 'gj')
remap('n', 'k', 'gk')

-- Window Navigation

---- Normal Mode
remap('n', '<C-h>', '<C-w>h')
remap('n', '<C-j>', '<C-w>j')
remap('n', '<C-k>', '<C-w>k')
remap('n', '<C-l>', '<C-w>l')

---- Terminal mode
remap('t', '<C-h>', '<C-\\><C-N><C-w>h')
remap('t', '<C-j>', '<C-\\><C-N><C-w>j')
remap('t', '<C-k>', '<C-\\><C-N><C-w>k')
remap('t', '<C-l>', '<C-\\><C-N><C-w>l')

-- Tab navigation TODO

-- Folds
remap('n', 'z0', ':set foldlevel=0<CR>') -- close folds
remap('n', 'z1', ':set foldlevel=1<CR>')

---- Insert mode
remap('i', '<C-h>', '<C-\\><C-N><C-w>h')
remap('i', '<C-j>', '<C-\\><C-N><C-w>j')
remap('i', '<C-k>', '<C-\\><C-N><C-w>k')
remap('i', '<C-l>', '<C-\\><C-N><C-w>l')

-- Resize windows with arrows
remap('n', '<C-Up>',    'resize -2')
remap('n', '<C-Down>',  'resize +2')
remap('n', '<C-Left>',  'vertical resize -2')
remap('n', '<C-Right>', 'vertical resize -2')

-- Open window
remap('n', '<C-o>', ':vnew<CR>')

-- Re-enter visual when indenting
remap('v', '<', '<gv')
remap('v', '>', '>gv')

-- Tab switch buffer
remap('n', '<TAB>', ':bnext<CR>')
remap('n', '<S-TAB>', ':bprev<CR>')

-- Move block of text in visual mode
remap('x', 'K', ':move \'<-2<CR>gv-gv')
remap('x', 'J', ':move \'>+1<CR>gv-gv')

-- Escape exit pum
function _G.smart_exit()
	return vim.v.completed_item.abbr ~= nil and t'<C-e>' or t'<esc>'
end
remap('i', '<esc>', 'v:lua.smart_exit()', {expr = true, noremap = true})
