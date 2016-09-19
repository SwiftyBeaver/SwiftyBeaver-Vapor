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

public final class SwiftyBeaverVapor: Log {
    
    public var enabled: [LogLevel]
    private var sb = SwiftyBeaver.self
    
    public init(config: Config) {
        let console = ConsoleDestination()  // log to Xcode Console
        
        let file = FileDestination()  // log to default swiftybeaver.log file
        file.logFileURL = URL(string: "file:///tmp/VaporLogs.log")!
        sb.addDestination(console)
        sb.addDestination(file)
        
        enabled = LogLevel.all
    }
    
    // can be used once the pull request which changes the logging interface is merged in Vapor
    public func log(_ level: LogLevel, message: String, file: String = #file, function: String = #function, line: Int = #line) {
    
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
            sb.custom(level: sbLevel, message: message, file: file, function: function, line: line)
        }
    }

}
