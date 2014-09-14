server = require("site/server")
server.config =
    handler: (ctx) ->
        host = ctx.request.host
        path = ctx.request.path
        response = ctx.response
        if host.is "www.zhanzhenzhen.com"
            response.redirectHost "zhanzhenzhen.com"
        else
            response.dispatchToFsScan()
    port: 50003
server.start()
