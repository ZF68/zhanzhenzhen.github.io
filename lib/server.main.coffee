server = require "site/server"
shared = require "site/shared"
fsMod = require "fs"
server.onRequest (ctx) ->
    host = ctx.request.host
    path = ctx.request.path
    response = ctx.response
    if host.is "www.zhanzhenzhen.com"
        response.redirectHost "zhanzhenzhen.com"
    else if path.is "/"
        response.handleHome()
    else
        response.handleFile()
server.host =
    if shared.isDebug()
        "127.0.0.1"
    else
        undefined
server.httpPort = 50003
server.start()
