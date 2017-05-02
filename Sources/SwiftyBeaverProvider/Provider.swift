//
//  Provider.swift
//  SwiftyBeaverProvider
//
//  Created by Gustavo Perdomo on 5/2/17.
//  Copyright © 2016 Sebastian Kreutzberger
//  Some rights reserved: http://opensource.org/licenses/MIT
//

import Vapor
import SwiftyBeaver

public final class Provider: Vapor.Provider {
    public static let repositoryName = "swiftybeaver-provider"
    
    public init(config: Config) throws { }
    
    public func boot(_ config: Config) throws {
        config.addConfigurable(log: SwiftyBeaverLogger.init, name: "swiftybeaver")
    }
    
    public func boot(_ drop: Droplet) throws { }
    
    public func beforeRun(_ drop: Droplet) { }
}
