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
    
    /**
     Called before the Droplet begins serving
     which is @noreturn.
     */
    public func beforeRun(_: Droplet) {
        //print("before run of SwiftyBeaverProvider")
    }

    
    public let provided: Providable
    
    /// do not use
    public init(config: Config) throws {
        let log = SwiftyBeaverVapor(config: config)
        provided = Providable(log: log)
    }
    
    /// add an array of SwiftyBeaver destination instances
    public init(destinations: [BaseDestination]) {
        let log = SwiftyBeaverVapor(destinations: destinations)
        provided = Providable(log: log)
    }
    
    
    public func afterInit(_ drop: Droplet) {
    }
    
    public func beforeServe(_: Droplet) {
    }
}
