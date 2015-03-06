server = require "site/server"
fsMod = require "fs"
server.onRequest (ctx) ->
    host = ctx.request.host
    path = ctx.request.path
    response = ctx.response
    if host.is "www.zhanzhenzhen.com"
        response.redirectHost "zhanzhenzhen.com"
    else
        response.handleFile()
server.httpPort = 50003
server.start()
