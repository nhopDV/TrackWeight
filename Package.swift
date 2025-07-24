// swift-tools-version: 6.0

import PackageDescription

let swiftSettings: [SwiftSetting] = [
    .enableUpcomingFeature("ExistentialAny"),
]

let package = Package(
    name: "TrackWeight",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "OpenMultitouchSupport",
            targets: ["OpenMultitouchSupport"]
        ),
        .library(
            name: "TrackWeight",
            targets: ["TrackWeight"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "OpenMultitouchSupportXCF",
            url: "https://github.com/Kyome22/OpenMultitouchSupport/releases/download/3.0.3/OpenMultitouchSupportXCF.xcframework.zip",
            checksum: "9ffe72a65f0107e87a003485ab9530e772a6b45953af2f7d0cc41665d1873dea"
        ),
        .target(
            name: "OpenMultitouchSupport",
            dependencies: ["OpenMultitouchSupportXCF"],
            swiftSettings: swiftSettings
        ),
        .target(
            name: "TrackWeight",
            dependencies: ["OpenMultitouchSupport"],
            path: "TrackWeight",
            exclude: ["Assets.xcassets", "Preview Content", "TrackWeight.entitlements"]
        ),
        .testTarget(
            name: "TrackWeightTests",
            dependencies: ["TrackWeight"],
            path: "Tests/TrackWeightTests"
        )
    ]
)
