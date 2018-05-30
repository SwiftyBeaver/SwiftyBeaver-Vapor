//
//  SwiftyBeaverVapor.swift
//  SwiftyBeaverVapor
//
//  Created by Sebastian Kreutzberger on 9/1/16.
//  Copyright © 2016 Sebastian Kreutzberger
//  Some rights reserved: http://opensource.org/licenses/MIT
//

import Foundation
import Vapor
import SwiftyBeaver

public final class SwiftyBeaverVapor: Logger {
    public var enabled: [LogLevel]
    private var sb = SwiftyBeaver.self
    
    /// do not use
    public init(config: Config) {
        enabled = LogLevel.all
    }
    
    public init(destinations: [BaseDestination]) {
        for destination in destinations {
            sb.addDestination(destination)
        }
        enabled = LogLevel.all
    }
    
    // can be used once the pull request which changes the logging interface is merged in Vapor
    public func log(_ string: String, at level: LogLevel, file: String = #file, function: String = #function, line: UInt = #line, column: UInt = #column) {
    
        if enabled.contains(level) {
            
            var sbLevel: SwiftyBeaver.Level = .error
            
            // match the protocol logging levels with the ones of SwiftyBeaver
            switch level {
            case .verbose:
                sbLevel = .verbose
            case .debug:
                sbLevel = .debug
            case .info:
                sbLevel = .info
            case .warning:
                sbLevel = .warning
            default:
                // for error and fatal
                sbLevel = .error
            }
            
            // log to SwiftyBeaver
            sb.custom(level: sbLevel, message: string, file: file, function: function, line: Int(bitPattern: line))
        }
    }

}

extension SwiftyBeaverVapor: Service {}

extension LogLevel {
    public static var all: [LogLevel] {
        return [
            LogLevel.debug,
            LogLevel.info,
            LogLevel.verbose,
            LogLevel.fatal,
            LogLevel.error,
            LogLevel.warning
        ]
    }
}

extension LogLevel: Equatable {
    static public func == (lhs: LogLevel, rhs: LogLevel) -> Bool {
        return lhs.description == rhs.description
    }
}
