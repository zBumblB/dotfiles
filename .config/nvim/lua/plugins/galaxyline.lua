vim.o.showmode = false -- Handled by the bar

local fn = vim.fn
local gl = require'galaxyline'
local section = gl.section
local devicons = require'nvim-web-devicons'
local condition = require('galaxyline.condition')
local colors = O.colors
devicons.setup()
function get_file_info() return fn.expand('%:t'), fn.expand('%:e'), {default = true} end

function hide_in_width()
	squeeze_width = fn.winwidth(0) / 2
	return squeeze_width > 45
end

-- Get background and foreground colors from the colorscheme
local bgcolor = fn.synIDattr(fn.hlID('StatusLine'), 'bg')
local fgcolor = fn.synIDattr(fn.hlID('StatusLine'), 'fg')

local Mode = { -- :h mode() for more info
	['n']  = colors.red,
	['no'] = colors.red,
	['v']  = colors.blue,
	['V']  = colors.blue,
	[''] = colors.blue,
	['s']  = colors.orange,
	['S']  = colors.orange,
	[''] = colors.orange,
	['i']  = colors.green,
	['ic'] = colors.yellow,
	['R']  = colors.violet,
	['c']  = colors.magenta,
	['cv'] = colors.red,
	['ce'] = colors.red,
	['r']  = colors.cyan,
	['rm'] = colors.cyan,
	['r?'] = colors.cyan,
	['!']  = colors.red,
	['t']  = colors.red,
}

local Component = {
	Box = { Box =
	{
		separator = ' ',
		separator_highlight = { 'NONE', bgcolor },
		provider = function() return '▊' end,
		highlight = { colors.blue, bgcolor },
	} },
	Icon = { FileIcon =
	{
		provider = 'FileIcon',
		highlight = { require'galaxyline.provider_fileinfo'.get_file_icon_color, bgcolor },
	} },
	Mode = { ViMode =
	{
		separator = ' ',
		separator_highlight = { 'NONE', bgcolor },
		provider = { space, function()
			local mode_color = Mode[fn.mode(true)] or Mode[fn.mode(false)]
			vim.cmd('hi! GalaxyViMode guifg='.. mode_color..' guibg='..bgcolor)
			return '▊' -- 
		end, },
	} },
	FileSize = { FileSize =
	{
		provider = 'FileSize',
		highlight = { fgcolor, bgcolor },
	} },
	FileName = { FileName =
	{
		provider = 'FileName',
		highlight = { colors.magenta, bgcolor, 'bold' },
	} },
	Position = { LineInfo =
	{
		provider = function() return string.format(" %3d:%-2d ", fn.line('.'), fn.col('.')) end,
		highlight = { fgcolor, bgcolor },
	} },
	LinePercent = { Percent = {
		provider = function()
			local current = fn.line('.')
			local total = fn.line('$')
			if current == 1 then return 'Top '
			elseif current == total then return 'Bot '
			else
				local percent = math.modf((current/total)*100)
				return percent .. '% '
			end
		end,
		highlight = { fgcolor, bgcolor, 'bold' },
	} },
	Error = { DiagnosticError =
	{
		provider = 'DiagnosticError',
		icon = ' ',
		highlight = { colors.red, bgcolor },
	} },
	Warning = { DiagnosticWarn =
	{
		provider = 'DiagnosticWarn',
		icon = ' ',
		highlight = { colors.yellow, bgcolor },
	} },
	Hint = { DiagnosticHint =
	{
		provider = 'DiagnosticHint',
		icon = ' ',
		highlight = { colors.cyan, bgcolor },
	} },
	Info = { DiagnosticInfo =
	{
		provider = 'DiagnosticInfo',
		icon = ' ',
		highlight = { colors.blue, bgcolor },
	} },
	LSPClient = { ShowLSPClient =
	{
		provider = 'GetLspClient',
		condition = function()
			local tbl = {['dashboard'] = true,['']=true}
			return not tbl[vim.bo.filetype]
		end,
		icon = 'LSP:',
		highlight = { colors.cyan, bgcolor, 'bold' },
	} },
	Encoding = { FileEncode =
	{
		provider = 'FileEncode',
		condition = hide_in_width,
		highlight = { colors.green, bgcolor, 'bold' },
	} },
	Format = { FileFormat =
	{
		provider = 'FileFormat',
		condition = hide_in_width,
		separator = ' ',
		separator_highlight = { 'NONE', bgcolor },
		highlight = { colors.green, bgcolor, 'bold' },
	} },
	GitIcon = { GitIcon = {
		provider = function() return '  ' end,
		condition = condition.check_git_workspace,
		separator = ' ',
		separator_highlight = { 'NONE', bgcolor },
		highlight = { colors.violet, bgcolor, 'bold' },
	} },
	GitBranch = { GitBranch = {
		provider = 'GitBranch',
		condition = condition.check_git_workspace,
		highlight = { colors.violet, bgcolor, 'bold' },
	} },
	DiffAdd = { DiffAdd = {
		provider = 'DiffAdd',
		condition = hide_in_width,
		icon = '  ',
		highlight = { colors.green, bgcolor },
	} },
	DiffModified = { DiffModified = {
		provider = 'DiffModified',
		condition = hide_in_width,
		icon = ' 柳',
		highlight = { colors.orange, bgcolor },
	} },
	DiffRemove = { DiffRemove = {
		provider = 'DiffRemove',
		condition = hide_in_width,
		icon = '  ',
		highlight = { colors.red, bgcolor },
	} },
	GitSigns = { GitSigns =
	{ -- Don't use with DiffAdd/remove/modify
		provider = function()
--			return fn.get('b:', 'gitsigns_status', '')
			return vim.b.gitsigns_status
		end,
		icon = ' ',
		highlight = { colors.orange, bgcolor }
	} },
}

section.left = {
	Component.Mode,
	Component.FileSize,
	Component.Icon,
	Component.FileName,
	Component.Position,
	Component.LinePercent,
}

section.mid = {
	Component.LSPClient,
	Component.Error,
	Component.Warning,
	Component.Hint,
	Component.Info,
}

section.right = {
	Component.Encoding,
	Component.Format,
	Component.GitIcon,
	Component.GitBranch,
	Component.DiffAdd,
	Component.DiffModified,
	Component.DiffRemove,
	Component.Mode,
}
