// swift-tools-version:5.2

// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
//  Created by Sam Deane on 16/03/2021.
//  All code (c) 2021 - present day, Elegant Chaos.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import PackageDescription

let package = Package(
    name: "UserDefaultsExtensions",
    platforms: [
        .macOS(.v10_13), .iOS(.v13), .tvOS(.v13), .watchOS(.v6)
    ],
    products: [
        .library(
            name: "UserDefaultsExtensions",
            targets: ["UserDefaultsExtensions"]),
    ],
    dependencies: [
        .package(url: "https://github.com/elegantchaos/XCTestExtensions.git", from: "1.2.0")
    ],
    targets: [
        .target(
            name: "UserDefaultsExtensions",
            dependencies: []),
        .testTarget(
            name: "UserDefaultsExtensionsTests",
            dependencies: ["UserDefaultsExtensions", "XCTestExtensions"]),
    ]
)
