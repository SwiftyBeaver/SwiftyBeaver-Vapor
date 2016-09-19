import PackageDescription

let package = Package(
    name: "SwiftyBeaverVapor",
    targets: [
        Target(name: "SwiftyBeaverVaporExample", dependencies: ["SwiftyBeaverVapor"])
    ],
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 1),
        .Package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver.git", majorVersion: 1)
    ]
)
