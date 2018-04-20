// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "SwiftyBeaverVapor",
    products: [
        .library(name: "SwiftyBeaverVapor", targets: ["SwiftyBeaverVapor"])
    ],
    dependencies: [
        .package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver.git", .upToNextMinor(from: "1.5.2")),
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0-rc.2"),
    ],
    targets: [
        .target(name: "SwiftyBeaverVapor", dependencies: ["SwiftyBeaver", "Vapor"]),
        .target(name: "SwiftyBeaverVaporExample", dependencies: ["SwiftyBeaverVapor"])
    ]
)
