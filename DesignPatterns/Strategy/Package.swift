// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Strategy",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "Strategy",
            targets: [
                "StrategyArticleCode",
                "StrategyArticleTests",
                "StrategyKataCode",
                "StrategyKataTests",
                "StrategyKataSolutionCode",
                "StrategyKataSolutionTests",
            ])
    ],
    targets: [
        .target(
            name: "StrategyArticleCode",
            path: "Article",
            sources: ["StrategyArticleCode.swift"]
        ),
        .testTarget(
            name: "StrategyArticleTests",
            dependencies: ["StrategyArticleCode"],
            path: "Article",
            sources: ["StrategyArticleTests.swift"]
        ),
        .target(
            name: "StrategyKataCode",
            path: "Kata",
            sources: ["StrategyKataCode.swift"]
        ),
        .testTarget(
            name: "StrategyKataTests",
            dependencies: ["StrategyKataCode"],
            path: "Kata",
            sources: ["StrategyKataTests.swift"]
        ),
        .target(
            name: "StrategyKataSolutionCode",
            path: "KataSolution",
            sources: ["StrategyKataSolutionCode.swift"]
        ),
        .testTarget(
            name: "StrategyKataSolutionTests",
            dependencies: ["StrategyKataSolutionCode"],
            path: "KataSolution",
            sources: ["StrategyKataSolutionTests.swift"]
        ),
    ]
)
