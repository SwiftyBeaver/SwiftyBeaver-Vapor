//
//  main.swift
//  SwiftyBeaverVaporExample
//
//  Created by Sebastian Kreutzberger on 9/7/16.
//  Copyright © 2016 Sebastian Kreutzberger
//  Some rights reserved: http://opensource.org/licenses/MIT
//

import Foundation
import Vapor
import SwiftyBeaverVapor
import SwiftyBeaver

// set-up SwiftyBeaver logging destinations (console, file, cloud, ...)
// see http://docs.swiftybeaver.com/category/8-logging-destinations to learn more
let console = ConsoleDestination()  // log to Xcode Console in color
let file = FileDestination()  // log to file
file.logFileURL = URL(string: "file:///tmp/VaporLogs.log")! // set log file

// add SwiftyBeaver destination instances to SwiftyBeaver Logging Provider
let sbProvider = SwiftyBeaverProvider(destinations: [console, file])

// create Droplet
let app = Droplet(initializedProviders: [sbProvider])
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
    log.warning("called non-existing page \(request.uri)")
    return "the 404 page"
}

app.run()
