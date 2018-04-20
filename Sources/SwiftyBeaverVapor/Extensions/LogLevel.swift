//
// Created by nathanh on 4/19/18.
//

import SwiftyBeaver
import Vapor

extension LogLevel {
    public static var all: [LogLevel] {
        return [
            .verbose,
            .debug,
            .info,
            .warning,
            .error,
            .fatal
        ]
    }

    public var mappedToSwiftyBeaver: SwiftyBeaver.Level {
        switch self {
        case .verbose: return .verbose
        case .debug: return .debug
        case .info: return .info
        case .warning: return .warning
        default: return .error
        }
    }
}

// MARK: Equatable

extension LogLevel: Equatable {
    public static func == (lhs: LogLevel, rhs: LogLevel) -> Bool {
        switch (lhs, rhs) {
        case (.verbose, .verbose),
             (.debug, .debug),
             (.info, .info),
             (.warning, .warning),
             (.error, .error),
             (.fatal, .fatal): return true
        case (let .custom(customLeft), let .custom(customRight)):
            return customLeft == customRight
        default: return false
        }
    }
}
