//
//  LinuxMain.swift
//  SwiftyBeaverProvider
//
//  Created by Gustavo Perdomo on 5/2/17.
//  Copyright © 2016 Sebastian Kreutzberger. Some rights reserved.
//

#if os(Linux)

import XCTest
@testable import AppTests

XCTMain([
    // AppTests
    testCase(RouteTests.allTests)
])

#endif
