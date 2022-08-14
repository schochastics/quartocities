function hammer3()
   local hammer  = '<img src="img/mchammer.gif" class="img-fluid" style="margin:auto;width:30%">'
   hammer3 = '<div style="margin: auto;width:30%; padding-top:1em;padding-bottom:1em">' ..hammer .. hammer .. hammer .. '</div>'
    return pandoc.RawBlock('html', hammer3)
end

local function isEmpty(s)
    return s == nil or s == ''
end

function btn(args,kwargs)
    local type_str =  pandoc.utils.stringify(args[1])
    if #args==1 then
        text_str = type_str
    else
        text_str =  pandoc.utils.stringify(args[2])
    end
    local link_str = pandoc.utils.stringify(kwargs["link"])
    if not isEmpty(link_str) then
        text_str = '<a href="' .. link_str .. '">' .. text_str ..'</a>'
    end
    local btn = '<button type="button" class="btn btn-' .. type_str ..'">' .. text_str ..'</button>'
    return pandoc.RawBlock('html', btn)
end

function divider(args)
    local type_str = pandoc.utils.stringify(args[1])
    local divider = '<img src="img/divider' .. type_str ..'.gif" width=100%>'
    return pandoc.RawBlock('html', divider)
end

function twitter(handle)
    local output = '<a href="https://twitter.com/' .. pandoc.utils.stringify(handle) .. '"><img src="img/twitter.gif"></a>'
    return pandoc.RawBlock('html', output)
end
  
function github(handle)
    local output = '<a href="https://github.com/' .. pandoc.utils.stringify(handle) .. '"><img src="img/hacker.gif"></a>'
    return pandoc.RawBlock('html', output)
end