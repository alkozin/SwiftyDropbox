// swift-tools-version:5.6
///
/// Copyright (c) 2016 Dropbox, Inc. All rights reserved.
///

import PackageDescription

let package = Package(
    name: "SwiftyDropbox",
    platforms: [
        .macOS(.v10_13),
        .iOS(.v14),
    ],
    products: [
        .library(name: "SwiftyDropbox", targets: ["SwiftyDropbox"]),
        .library(name: "SwiftyDropboxObjC", targets: ["SwiftyDropboxObjC"]),
    ],
    dependencies: [
        .package(url: "https://github.com/The-Wand/Wand.git", .upToNextMajor(from: "2.0.11") ),
        .package(url: "https://github.com/The-Wand/Foundation.git", .upToNextMajor(from: "2.0.11") ),
    ],
    targets: [
        .target(
            name: "SwiftyDropbox",
            dependencies: [
                "Wand",
                .product(name: "WandFoundation", package: "Foundation")
            ],
            path: "Source/SwiftyDropbox",
            resources: [.process("PrivacyInfo.xcprivacy")]
        ),
        .target(
            name: "SwiftyDropboxObjC",
            dependencies: ["SwiftyDropbox"],
            path: "Source/SwiftyDropboxObjC",
            resources: [.process("PrivacyInfo.xcprivacy")]
        ),
        .testTarget(
            name: "SwiftyDropboxUnitTests",
            dependencies: ["SwiftyDropbox"]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
