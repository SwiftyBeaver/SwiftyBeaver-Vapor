// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "SwiftyBeaverVapor",
    products: [
        .library(name: "SwiftyBeaverVapor", targets: ["SwiftyBeaverVapor"])
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
        .package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver.git", .upToNextMajor(from: "1.9.0"))
    ],
    targets: [
        .target(name: "SwiftyBeaverVapor", dependencies: ["Vapor", "SwiftyBeaver"])
    ]
)
