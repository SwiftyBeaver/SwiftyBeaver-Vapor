//
// Created by nathanh on 4/19/18.
//

import SwiftyBeaver
import Vapor

public struct SwiftyBeaverConfig {
    public let destinations: [BaseDestination]
    public let logLevelsEnabled: [LogLevel]

    public init(
        destinations: [BaseDestination] = [ConsoleDestination()],
        logLevelsEnabled: [LogLevel] = LogLevel.all
    ) {
        self.destinations = destinations
        self.logLevelsEnabled = logLevelsEnabled
    }
}

// MARK: ServiceType

extension SwiftyBeaverConfig: ServiceType {
    public static func makeService(for worker: Container) throws -> SwiftyBeaverConfig {
        return .init()
    }
}
