// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "rorschach",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Rorschach",
            targets: ["Rorschach"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Rorschach",
            dependencies: []),
        .testTarget(
            name: "RorschachTests",
            dependencies: ["Rorschach"]),
    ]
)
