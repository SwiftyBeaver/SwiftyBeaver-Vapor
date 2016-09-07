//
//  VaporSwiftyBeaver.swift
//  VaporSwiftyBeaver
//
//  Created by Sebastian Kreutzberger on 9/1/16.
//  Copyright © 2016 Sebastian Kreutzberger
//  Some rights reserved: http://opensource.org/licenses/MIT
//

import Foundation
import Vapor
import SwiftyBeaver

public final class VaporSwiftyBeaver: Log {
    
    public var enabled: [LogLevel]
    private var sb = SwiftyBeaver.self
    
    public init(config: Config) {
        let console = ConsoleDestination()  // log to Xcode Console
        console.detailOutput = false
        
        let file = FileDestination()  // log to default swiftybeaver.log file
        file.detailOutput = false
        
        //file.logFileURL = URL(string: "~/Desktop/VaporSwiftyBeaver.log") // later: adjust via config
        sb.addDestination(console)
        sb.addDestination(file)
        
        enabled = LogLevel.all
    }
    
    // limited logging until the pull request is approved
    public func log(_ level: LogLevel, message: String) {
        if enabled.contains(level) {
            
            var sbLevel: SwiftyBeaver.Level = .Error
            
            // match the protocol logging levels with the ones of SwiftyBeaver
            switch level {
            case .verbose:
                sbLevel = .Verbose
            case .debug:
                sbLevel = .Debug
            case .info:
                sbLevel = .Info
            case .warning:
                sbLevel = .Warning
            default:
                // for error and fatal
                sbLevel = .Error
            }
            
            // log to SwiftyBeaver
            sb.custom(level: sbLevel, message: message, path: "", function: "", line: 0)
            
        }

    }
    
    /*
    // can be used once the pull request which changes the logging interface is merged in Vapor
    public func log(_ level: LogLevel, message: String, path: String = #file, function: String = #function, line: Int = #line) {
    
        if enabled.contains(level) {
            
            // match the protocol logging levels with the ones of SwiftyBeaver
            switch level {
            case .verbose:
                sb.verbose("verbose message '\(message)' from \(path), function \(function), line \(line)")
            case .debug:
                sb.debug("debug message '\(message)' from \(path), function \(function), line \(line)")
            case .info:
                sb.info(message)
            case .warning:
                sb.debug(message)
            default:
                // for error and fatal
                sb.error(message)
            }
        }
    }
     */

}
