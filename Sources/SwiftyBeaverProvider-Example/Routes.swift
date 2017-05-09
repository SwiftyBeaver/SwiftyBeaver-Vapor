//
//  Routes.swift
//  SwiftyBeaverProvider
//
//  Created by Gustavo Perdomo on 5/2/17.
//  Copyright © 2016 Sebastian Kreutzberger. Some rights reserved.
//

import Vapor

final class Routes: RouteCollection {
    private let log: LogProtocol

    init(log: LogProtocol) {
        self.log = log
    }

    func build(_ builder: RouteBuilder) throws {
        builder.get("/") { _ in

            self.log.verbose("not so important")
            self.log.debug("something to debug")
            self.log.info("a nice information")
            self.log.warning("oh no, that won’t be good")
            self.log.error("ouch, an error did occur!")

            return "welcome!"
        }
    }
}
