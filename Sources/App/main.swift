import Vapor
import HTTP

//let app = Droplet()
//app.config["app", "key"]?.string ?? ""

let app = Droplet(providers: [SwiftyBeaverProvider.self])
let log = app.log.self // to avoid writing app.log all the time

// home route
app.get("/") { request in

    log.verbose("not so important")
    log.debug("something to debug")
    log.info("a nice information")
    log.warning("oh no, that won’t be good")
    log.error("ouch, an error did occur!")
    
    return "welcome!"
}

// 404
app.get("*") { request in
    return "the 404 page"
}

let port = app.config["app", "port"]?.int ?? 80
app.serve()
