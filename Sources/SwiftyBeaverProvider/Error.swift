//
//  Error.swift
//  SwiftyBeaverProvider
//
//  Created by Gustavo Perdomo on 5/2/17.
//  Copyright © 2016 Sebastian Kreutzberger. Some rights reserved.
//

import Debugging

public enum SwiftyBeaverProviderError: Error {
    case missingDestinations
}

extension SwiftyBeaverProviderError: Debuggable {
    public var reason: String {
        switch self {
        case .missingDestinations:
            return "At least one destination type is required."
        }
    }

    public var identifier: String {
        switch self {
        case .missingDestinations:
            return "missingDestinations"
        }
    }

    public var possibleCauses: [String] {
        switch self {
        case .missingDestinations:
            return [
                "You have not specified `console`, `file` or `platform` in the `swiftybeaver` file."
            ]
        }
    }

    public var suggestedFixes: [String] {
        return [
            "Ensure you have properly configured the SwiftyBeaverProvider package according to the documentation"
        ]
    }

    public var documentationLinks: [String] {
        return [
            "https://github.com/SwiftyBeaver/SwiftyBeaver-Vapor/"
        ]
    }
}
