import Vapor
import HTTP

//let app = Droplet()
//app.config["app", "key"]?.string ?? ""

let app = Droplet(providers: [Provider.self])

// test route
app.get("/") { request in
    /*
    log.verbose("not so important")
    log.debug("something to debug")
    log.info("a nice information")
    log.warning("oh no, that won’t be good")
    log.error("ouch, an error did occur!")
     */
    return "Hello, World!"
}

let port = app.config["app", "port"]?.int ?? 80
app.serve()
