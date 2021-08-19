----------------- Mappings
local function prequire(...)
local status, lib = pcall(require, ...)
if (status) then return lib end
    return nil
end

local ls = prequire('luasnip')

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

_G.tab_complete = function()
    if ls and ls.expand_or_jumpable() then
        return t "<Plug>luasnip-expand-or-jump"
	elseif vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn['compe#complete']()
    end
end
_G.s_tab_complete = function()
    if ls and ls.jumpable(-1) then
        return t "<Plug>luasnip-jump-prev"
    elseif vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    else
        return t "<S-Tab>"
    end
end

remap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
remap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
remap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
remap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
remap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
remap("s", "<C-E>", "<Plug>luasnip-next-choice", {})

---------------- Snippets
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local ps = ls.parser.parse_snippet

function datetime(args, format)
	return os.date(format, os.time())
end

ls.snippets = {
	all = {
		-- [[ date {{{
		-- TODO: make this dynamic (%date(format) will call datetime with format)
		s({
			trig = "%date",
			name = "date",
			dscr = "print current date in y-m-d format.",
		}, {
			f(datetime, {}, '%Y-%m-%d')
		}), --}}} date ]]
		-- [[ time {{{
		s({
			trig = "%time",
			name = "time",
			dscr = "print current time in h:m format.",
		}, {
			f(datetime, {}, '%H:%M')
		}), --}}} time ]]
		-- [[ lorem {{{
		-- TODO: dynamic lorem(#c) will output #c dummy characters
		s({
			trig = "lorem",
			name = "lorem",
			dscr = "dummy text",
		}, {
				t("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
		}), --}}} lorem ]]
		-- TODO: add license snippets (wtfpl and beerware)
		
	},
	lua = {
		-- [[ function {{{
		ps({
			trig = "func",
			name = "function",
			dscr = "basic function template",
		},
			"function ${1:function_name}(${2:args})\n" ..
			"\t${0:body}\n" ..
			"end"
		), --}}} function ]]
		-- [[ if {{{
		ps({
			trig = "if",
			name = "if",
			dscr = "basic if block",
		},
			"if ${1:condition} then\n" ..
			"\t${2:body}\n" ..
			"end\n"
		), --}}} if ]]
		-- [[ for {{{
		ps({
			trig = "for",
			name = "for",
			dscr = "basic for template",
		},
			"for ${1:i = 0, do stuff} do\n" ..
			"\t${2:body}\n" ..
			"end\n"
		), --}}} for ]]
		-- [[ forin {{{
		ps({
			trig = "forin",
			name = "forin",
			dscr = "for k, v in ipairs(table) do",
		},
			"for ${1:k, v} in ${2:ipairs(xs)} do\n" ..
			"\t${3:body}\n" ..
			"end\n"
		), --}}} forin ]]
		-- [[ print table {{{
		ps({
			trig = "print_table",
			name = "print table",
			dscr = "print table",
		},
			"for k, v in ipairs(${1:table}) do\n" ..
			"\tprint(k, v)\n" ..
			"end\n"
		), --}}} print table ]]
		

		-- [[ snippet {{{
		ps({
			trig = ".snip",
			name = "snippet",
			dscr = "snippet template",
		},
			"-- [[ ${1:snippet name} {" .. "{{\n" ..
			"s({\n" ..
			"\ttrig = \"${2:trigger}\",\n" ..
			"\tname = \"${1}\",\n" ..
			"\tdscr = \"${3:description}\",\n" ..
			"}, {\n" ..
			"\t${4:-- expansion}\n" ..
			"}), --}}" .. "} ${1} ]" .. "]\n"
		), --}}} snippet ]]
		-- [[ ps snippet {{{
		ps({
			trig = ".psnip",
			name = "ps snippet",
			dscr = "snippet template",
		},
			"-- [[ ${1:snippet name} {" .. "{{\n" ..
			"ps({\n" ..
			"\ttrig = \"${2:trigger}\",\n" ..
			"\tname = \"${1}\",\n" ..
			"\tdscr = \"${3:description}\",\n" ..
			"},\n" ..
			"\t\"${4:expansion}\"\n" ..
			"), --}}" .. "} ${1} ]" .. "]\n"
		), --}}} ps snippet ]]
	},
	c = {
		-- [[ main {{{
		ps({
			trig = "main",
			name = "main",
			dscr = "int main(argc, argv)",
		},
			"int main(int argc, char **argv)\n" ..
			"{\n" ..
			"\t${0:body}\n" ..
			"}"
		), --}}} main ]]
		
	}
}
