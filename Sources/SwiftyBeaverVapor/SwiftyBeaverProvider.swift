//
//  SwiftyBeaverProvider.swift
//  SwiftyBeaverVapor
//
//  Created by Sebastian Kreutzberger on 9/1/16.
//  Copyright © 2016 Sebastian Kreutzberger
//  Some rights reserved: http://opensource.org/licenses/MIT
//

import Vapor
import SwiftyBeaver

public final class SwiftyBeaverProvider: Vapor.Provider {
    private let logger: SwiftyBeaverVapor
    
    /// add an array of SwiftyBeaver destination instances
    public init(destinations: [BaseDestination]) {
        logger = SwiftyBeaverVapor(destinations: destinations)
    }
    
    // MARK: - Vapor.Provider
    
    public func register(_ services: inout Services) throws {
        services.register(Logger.self) { container -> SwiftyBeaverVapor in
            return self.logger
        }
    }
    
    public func didBoot(_ container: Container) throws -> EventLoopFuture<Void> {
        // do nothing
        return .done(on: container)
    }

}
