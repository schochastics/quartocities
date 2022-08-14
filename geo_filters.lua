function Meta(m)
    if m.construction then
        math.randomseed(os.time())
        math.random(); math.random(); math.random()
        r=math.random(5)
        quarto.doc.includeText("before-body", '<img src="img/construction'..pandoc.utils.stringify(r) ..'.gif" style="margin-left:25%">')
    end
end
