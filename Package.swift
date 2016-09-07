import PackageDescription

let package = Package(
    name: "SwiftyBeaverVapor",
    targets: [
        Target(name: "SwiftyBeaverVaporExample", dependencies: ["SwiftyBeaverVapor"])
    ],
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 0, minor: 17),
        .Package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver.git", majorVersion: 0, minor: 0)
    ]
)
