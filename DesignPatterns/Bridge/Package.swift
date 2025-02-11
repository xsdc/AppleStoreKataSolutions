// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Bridge",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "Bridge",
            targets: [
                "BridgeArticleCode",
                "BridgeArticleTests",
                "BridgeKataCode",
                "BridgeKataTests",
                "BridgeKataSolutionCode",
                "BridgeKataSolutionTests",
            ])
    ],
    targets: [
        .target(
            name: "BridgeArticleCode",
            path: "Article",
            sources: ["BridgeArticleCode.swift"]
        ),
        .testTarget(
            name: "BridgeArticleTests",
            dependencies: ["BridgeArticleCode"],
            path: "Article",
            sources: ["BridgeArticleTests.swift"]
        ),
        .target(
            name: "BridgeKataCode",
            path: "Kata",
            sources: ["BridgeKataCode.swift"]
        ),
        .testTarget(
            name: "BridgeKataTests",
            dependencies: ["BridgeKataCode"],
            path: "Kata",
            sources: ["BridgeKataTests.swift"]
        ),
        .target(
            name: "BridgeKataSolutionCode",
            path: "KataSolution",
            sources: ["BridgeKataSolutionCode.swift"]
        ),
        .testTarget(
            name: "BridgeKataSolutionTests",
            dependencies: ["BridgeKataSolutionCode"],
            path: "KataSolution",
            sources: ["BridgeKataSolutionTests.swift"]
        ),
    ]
)
