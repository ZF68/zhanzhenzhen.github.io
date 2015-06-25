shared = require "site/shared"
client = require "site/client"
#manuals = require "./client.manuals.coffee"
ui = client.ui
web = npmMate.web

parseElement = (s) -> (new DOMParser()).parseFromString(s, "application/xml").documentElement
articleTime = (element) ->
    metas = Array.from(element.getElementsByTagName("meta"))
    meta = metas.singleOrNull((meta) -> meta.getAttribute("property") == "dc:date")
    if meta? then meta.getAttribute("content") else null
articleTitle = (element) ->
    element.getElementsByTagName("title")[0].textContent

books = [
    "programming"
]

blogs = [
    "屏幕分辨率多少才完美"
    "玄米抹茶的做法"
    "苹果手表"
]

ui.setRem(0.02)

loads =
    books.map((book) -> {type: "book", filename: book + ".xhtml", name: book})
    .concat(blogs.map((blog) -> {type: "blog", filename: blog + ".xhtml", name: blog}))
Promise.all(loads.map((item) -> web.get(item.filename)))
.then (x) ->

    x.forEach (item, index) ->
        load = loads[index]
        load.text = item.body
        load.element = parseElement(item.body)
        load.time = articleTime(load.element)
        load.title = articleTitle(load.element)

    contentElement = new ui.Element(
        {
            width: 0.8
            overflow: "scroll"
            lineHeight: 1.5
            selectable: true
            pointer: "auto"
            padding: "0.5rem"
            backgroundPaint: "rgb(255,255,255)"
        }
    )
    ui.root.add(
        new ui.Stack(
            {
                width: "auto"
                aspectRatio: 1.25
                horizontal: true
                backgroundPaint: "rgb(255,255,255)"
                padding: new ui.Padding("1rem", 0, "1rem", 0)
            }
            leftCol = new ui.Stack(width: 0.2, childSpacing: "0.3rem", padding: new ui.Padding(0, "2rem", 0, 0))
            contentElement
            rightCol = new ui.Stack(width: 0.2, childSpacing: "0.3rem", padding: new ui.Padding(0, "2rem", 0, 0))
        )
    )
    loads.filter((m) -> m.type == "book").forEach((book) ->
        leftCol.add(new ui.Text(book.title, {
            padding: new ui.Padding("0.5rem")
            backgroundPaint: "rgb(224,224,224)"
            pointer: "link"
            click: -> client.setUri("/" + book.name)
        }))
    )
    loads.filter((m) -> m.type == "blog").forEach((blog) ->
        date = new Date(blog.time)
        dateStr = date.getUTCFullYear().pad(4) + "-" +
            (date.getUTCMonth() + 1).pad(2) + "-" +
            date.getUTCDate().pad(2)
        rightCol.add(new ui.Stack(
            {
                height: "auto"
                padding: new ui.Padding("0.5rem")
                backgroundPaint: "rgb(224,224,224)"
                pointer: "link"
                click: -> client.setUri("/" + blog.name)
            }
            new ui.Text(blog.title)
            new ui.Text(dateStr, {fontSize: 0.7})
        ))
    )

    oldPath = null
    uriUpdateHandler = ->
        path = decodeURI(location.pathname)
        if path == oldPath then return

        contentElement.empty()

        if path == "/"
            window.contentElement = contentElement
            contentElement.raw.innerHTML = loads[0].element.getElementsByTagName("body")[0].innerHTML
        else
            contentElement.raw.innerHTML = loads.single((m) ->
                m.filename == path.substr(1) + ".xhtml"
            ).element.getElementsByTagName("body")[0].innerHTML

        oldPath = path

    uriUpdateHandler()
    client.onUriChange(uriUpdateHandler)

window.loads = loads
