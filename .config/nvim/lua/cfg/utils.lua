local fn = vim.fn

function HandleURL()
    -- TODO update uri scheme
    local url = fn.matchstr(fn.getline('.'), '[a-z]*:\\/\\/[^ >,;]*')

    if (url ~= '') then
        print(url)
        fn.system({'xdg-open', url})
    else
        print('No URL found in line')
    end

end

-- Make it a bit cleaner
function remap(mode, binding, action, cfg)
    cfg = cfg or {noremap = true, silent = true}
    vim.api.nvim_set_keymap(mode, binding, action, cfg)
end
