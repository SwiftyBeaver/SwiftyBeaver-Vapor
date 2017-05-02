//
//  SwiftyBeaverLogger.swift
//  SwiftyBeaverProvider
//
//  Created by Gustavo Perdomo on 5/2/17.
//  Copyright © 2016 Sebastian Kreutzberger
//  Some rights reserved: http://opensource.org/licenses/MIT
//

import Vapor
import SwiftyBeaver
import Foundation

public final class SwiftyBeaverLogger: LogProtocol {
    public var enabled: [LogLevel]
    private var sb: SwiftyBeaver.Type = SwiftyBeaver.self
    
    public init(destinations: [BaseDestination]) {
        for destination in destinations {
            sb.addDestination(destination)
        }
        enabled = LogLevel.all
    }
    
    public func log(_ level: LogLevel, message: String, file: String, function: String, line: Int) {
        if LogLevel.all.contains(level) {
            // log to SwiftyBeaver
            sb.custom(level: level.sbStyle, message: message, file: file, function: function, line: line)
        }
    }
}

extension SwiftyBeaverLogger: ConfigInitializable {
    public convenience init(config: Config) throws {
        guard let swiftybeaver = config["swiftybeaver"]?.object else {
            throw ConfigError.missingFile("swiftybeaver")
        }
        
        var destinations = [BaseDestination]()
        
        if let _ = swiftybeaver["console"]?.bool {
            destinations.append(ConsoleDestination())
        }
        
        if let path = swiftybeaver["file"]?.string {
            let file = FileDestination()  // log to file
            file.logFileURL = URL(fileURLWithPath: path) // set log file
            destinations.append(file)
        }
        
        if let platform = swiftybeaver["platform"]?.object {
            guard let appId = platform["appId"]?.string else {
                throw ConfigError.missing(key: ["appId"], file: "swiftybeaver", desiredType: String.self)
            }
            
            guard let appSecret = platform["appSecret"]?.string else {
                throw ConfigError.missing(key: ["appSecret"], file: "swiftybeaver", desiredType: String.self)
            }
            
            guard let encryptionKey = platform["encryptionKey"]?.string else {
                throw ConfigError.missing(key: ["encryptionKey"], file: "swiftybeaver", desiredType: String.self)
            }
            
            let sbp = SBPlatformDestination(appID: appId, appSecret: appSecret, encryptionKey: encryptionKey)

            destinations.append(sbp)
        }
        
        guard destinations.count > 0 else {
            throw SwiftyBeaverProviderError.missingDestinations
        }
        
        self.init(destinations: destinations)
    }
}

extension LogLevel {
    var sbStyle: SwiftyBeaver.Level {
        switch self {
        case .verbose:
            return .verbose
        case .debug, .custom(_):
            return .debug
        case .info:
            return .info
        case .warning:
            return .warning
        case .error, .fatal:
            return .error
        }
    }
}
