shared = require "site/shared"
client = require "site/client"
#manuals = require "./client.manuals.coffee"
ui = client.ui
web = npmMate.web

books = [
    "programming"
]

blogs = [
    "2015-04-23-苹果手表"
]

loads =
    books.map((book) -> {type: "book", filename: book + ".xhtml"})
    .concat(blogs.map((blog) -> {type: "blog", filename: blog + ".xhtml"}))
Promise.all(loads.map((item) -> web.get(item.filename)))
.then (x) ->
    x.forEach (item, index) ->
        loads[index].text = item.body

window.loads = loads
return

ui.root.add(
    new ui.Stack(
        {
            width: "auto"
            aspectRatio: 1.25
            horizontal: true
            backgroundPaint: "rgb(255,255,255)"
            padding: new ui.Padding("1rem", 0, "1rem", 0)
        }
        toc = new ui.Stack(width: 0.2, childSpacing: "0.3rem", padding: new ui.Padding(0, "2rem", 0, 0))
        contentElement
        tags
    )
)


ui.root.setPaint("rgb(51,51,51)")

oldPath = null
uriUpdateHandler = ->
    path = location.pathname
    if path == oldPath then return

    ui.root.empty()

    if path == "/"
        ui.setRem(0.015625)
        ui.root.setBackgroundPaint("rgb(255,255,255)")
        ui.root.add new ui.Stack(
            {
                width: "auto"
                height: "auto"
                childAlignment: "center"
                childSpacing: "1.8rem"
            }
            new ui.Text({fontSize: 5}, "Zizisoft")
            new ui.Text({fontSize: 1.8, pointer: "link", click: -> client.setUri("/site")}, "Site")
            new ui.Text({fontSize: 1.8, pointer: "link", click: -> client.setUri("/mate")}, "Mate")
            new ui.Text({fontSize: 1.8, pointer: "link", click: -> client.setUri("/wishlist")}, "Wishlist")
            new ui.Text(
                {
                    pointer: "link"
                    click: -> location.href = "mailto:webmaster@zizisoft.com"
                }
                "Contact"
            )
        )
    else if path in ["/site", "/mate", "/wishlist"]
        manuals.show(path)

    oldPath = path

client.onLoad(uriUpdateHandler)
client.onUriChange(uriUpdateHandler)
