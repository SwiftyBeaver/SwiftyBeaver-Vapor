//
//  SwiftyBeaverProvider.swift
//  SwiftyBeaverVapor
//
//  Created by Sebastian Kreutzberger on 9/1/16.
//  Copyright © 2016 Sebastian Kreutzberger
//  Some rights reserved: http://opensource.org/licenses/MIT
//

import SwiftyBeaver
import Vapor

public final class SwiftyBeaverProvider: Provider {
    public init() { }
    
    public func register(_ services: inout Services) throws {
        services.register(SwiftyBeaverConfig.self)
        services.register(SwiftyBeaverLogger.self)
    }

    public func didBoot(_ container: Container) throws -> EventLoopFuture<Void> {
        return .done(on: container)
    }
}
