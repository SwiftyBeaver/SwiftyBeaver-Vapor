import PackageDescription

let package = Package(
    name: "SwiftyBeaverProvider",
    targets: [
        Target(name: "SwiftyBeaverProvider-Example", dependencies: ["SwiftyBeaverProvider"])
    ],
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 2),
        .Package(url: "https://github.com/SwiftyBeaver/SwiftyBeaver.git", majorVersion: 1)
    ],
    exclude: [
        "Config",
        "Database",
        "Localization",
        "Public",
        "Resources",
    ]
)
