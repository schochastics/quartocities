local function isEmpty(s)
    return s == nil or s == ''
end

function Meta(m)
    -- check if page is under construction
    if m.construction then
        math.randomseed(os.time())
        math.random(); math.random(); math.random()
        r=math.random(5)
        quarto.doc.includeText("before-body", '<img src="img/construction/construction'..pandoc.utils.stringify(r) ..'.gif" class="mx-auto d-block">')
    end

    -- check if body background is different
    if isEmpty(m.body_bg) then
        local bg = [[<style>
        body {
            background: #0000ff url("img/bg/microfab.gif") top left;
        }
        </style>]]
        quarto.doc.includeText("in-header",bg)
    else
        local bg = '<style> body { background: #0000ff url("img/bg/'.. pandoc.utils.stringify(m.body_bg) ..'.gif") top left;}</style>'
        quarto.doc.includeText("in-header",bg)
    end

    -- check if navbar background is different
    if isEmpty(m.nav_bg) then
        local bg = [[<style>
        .navbar {
            background: #000000 url('img/bg/stars.gif') top left;
        }
        </style>]]
        quarto.doc.includeText("in-header",bg)
    else
        local bg = '<style> .navbar { background: #000000 url("img/bg/'.. pandoc.utils.stringify(m.nav_bg) ..'.gif") top left;}</style>'
        quarto.doc.includeText("in-header",bg)
    end

    -- check if there should be a gif in the title
    if not isEmpty(m.title_gif) then
        if pandoc.utils.stringify(m.title_gif) ~= "none" then
            local tgif = '<style> h1.title::before{background-image:url("img/'.. pandoc.utils.stringify(m.title_gif) ..'.gif");height: 2em;width: 2em;} </style>'
            quarto.doc.includeText("in-header",tgif)
        end
    end

end

