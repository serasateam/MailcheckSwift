// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MailcheckSwift",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MailcheckSwift",
            targets: ["MailcheckSwift"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Quick.git", from: "1.3.2"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "7.3.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "MailcheckSwift",
            dependencies: [
            "Quick",
            "Nimble"
            ]),
        .testTarget(
            name: "MailcheckSwiftTests",
            dependencies: ["MailcheckSwift"]),
    ]
)
