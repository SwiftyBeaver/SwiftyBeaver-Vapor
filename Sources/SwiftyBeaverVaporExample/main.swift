//
//  main.swift
//  SwiftyBeaverVaporExample
//
//  Created by Sebastian Kreutzberger on 9/7/16.
//  Copyright © 2016 Sebastian Kreutzberger
//  Some rights reserved: http://opensource.org/licenses/MIT
//

import SwiftyBeaverVapor
import Vapor

do {
    let config = Config.default()
    let env = try Environment.detect()
    var services = Services.default()

    // create and register a test route
    let router = EngineRouter.default()
    router.get { request -> String in
        let log = try request.make(SwiftyBeaverLogger.self)

        log.verbose("not so important")
        log.debug("something to debug")
        log.info("a nice information")
        log.warning("oh no, that won’t be good")
        log.error("ouch, an error did occur!")

        return "Welcome!"
    }
    services.register(router, as: Router.self)

    // register the SwiftyBeaver Provider with Vapor
    try services.register(SwiftyBeaverProvider())

    // set-up SwiftyBeaver logging destinations (console, file, cloud, ...)
    // see http://docs.swiftybeaver.com/category/8-logging-destinations to learn more
    let console = ConsoleDestination() // log to Xcode Console in color
    let file = FileDestination() // log to file
    file.logFileURL = URL(fileURLWithPath: "/tmp/VaporLogs.log") // set log file

    // create the custom SwiftyBeaverConfig and register it with Vapor
    let myConfig = SwiftyBeaverConfig(destinations: [console, file])
    services.register(myConfig)

    let app = try Application(config: config, environment: env, services: services)

    try app.run()
} catch {
    print(error)
    exit(1)
}
