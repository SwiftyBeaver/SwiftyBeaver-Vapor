//
//  VaporSwiftyBeaver.swift
//  VaporSwiftyBeaver
//
//  Created by Sebastian Kreutzberger on 9/1/16.
//  Copyright © 2016 Sebastian Kreutzberger
//  Some rights reserved: http://opensource.org/licenses/MIT
//

import Vapor
import SwiftyBeaver

public final class VaporSwiftyBeaver: Log {
    
    public var enabled: [LogLevel]
    public var log = SwiftyBeaver.self
    
    public init(config: Config) {
        let console = ConsoleDestination()  // log to Xcode Console
        let file = FileDestination()  // log to default swiftybeaver.log file
        log.addDestination(console)
        log.addDestination(file)
        
        enabled = LogLevel.all
    }
    
    public func log(_ level: LogLevel, message: String) {
        if enabled.contains(level) {
            print("SBLogger \(level): \(message)")
            // soon: actually use SwiftyBeaver here :D
            
            //console.output(message, style: level.consoleStyle)
        }
    }
}
