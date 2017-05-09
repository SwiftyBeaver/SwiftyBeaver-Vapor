//
//  Setup.swift
//  SwiftyBeaverProvider
//
//  Created by Gustavo Perdomo on 5/2/17.
//  Copyright © 2016 Sebastian Kreutzberger. Some rights reserved.
//

@_exported import Vapor
import SwiftyBeaverProvider

extension Droplet {
    public func setup() throws {
        try collection(Routes(log: self.log))
    }
}

extension Config {
    public func setup() throws {
        try addProvider(SwiftyBeaverProvider.Provider.self)
    }
}
