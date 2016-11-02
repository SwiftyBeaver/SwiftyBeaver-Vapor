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

    private let logProtocol: LogProtocol
    
    // is automatically called after adding of provider to droplet
    // sets SwiftyBeaverVapor as new logging protocol for the droplet
    public func boot(_ drop: Droplet) {
        drop.log = logProtocol
    }
    
    /// do not use, it is just required by protocol
    public init(config: Config) throws {
        logProtocol = SwiftyBeaverVapor(config: config)
    }
    
    /// add an array of SwiftyBeaver destination instances
    public init(destinations: [BaseDestination]) {
        logProtocol = SwiftyBeaverVapor(destinations: destinations)
    }
    
    
    // is automatically called directly after boot()
    public func afterInit(_ drop: Droplet) {
    }

    // is automatically called directly after afterInit()
    public func beforeRun(_: Droplet) {
    }
    
    public func beforeServe(_: Droplet) {
    }
}
