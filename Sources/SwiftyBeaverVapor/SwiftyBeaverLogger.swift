//
//  SwiftyBeaverVapor.swift
//  SwiftyBeaverVapor
//
//  Created by Sebastian Kreutzberger on 9/1/16.
//  Copyright © 2016 Sebastian Kreutzberger
//  Some rights reserved: http://opensource.org/licenses/MIT
//

import SwiftyBeaver
import Vapor

public final class SwiftyBeaverLogger {
    private let config: SwiftyBeaverConfig

    public init(config: SwiftyBeaverConfig) {
        self.config = config

        for destination in config.destinations {
            SwiftyBeaver.addDestination(destination)
        }
    }
}

// MARK: Logger

extension SwiftyBeaverLogger: Logger {
    public func log(
        _ string: String,
        at level: LogLevel,
        file: String = #file,
        function: String = #function,
        line: UInt = #line,
        column: UInt = #column
    ) {
        guard config.logLevelsEnabled.contains(level) else { return }

        SwiftyBeaver.custom(level: level.mappedToSwiftyBeaver, message: string)
    }
}

// MARK: ServiceType

extension SwiftyBeaverLogger: ServiceType {
    public static var serviceSupports: [Any.Type] {
        return [Logger.self]
    }

    public static func makeService(for worker: Container) throws -> Self {
        return .init(config: SwiftyBeaverConfig())
    }
}
