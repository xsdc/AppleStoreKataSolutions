// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Memento",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "Memento",
            targets: [
                "MementoArticleCode",
                "MementoArticleTests",
                "MementoKataCode",
                "MementoKataTests",
                "MementoKataSolutionCode",
                "MementoKataSolutionTests",
            ])
    ],
    targets: [
        .target(
            name: "MementoArticleCode",
            path: "Article",
            sources: ["MementoArticleCode.swift"]
        ),
        .testTarget(
            name: "MementoArticleTests",
            dependencies: ["MementoArticleCode"],
            path: "Article",
            sources: ["MementoArticleTests.swift"]
        ),
        .target(
            name: "MementoKataCode",
            path: "Kata",
            sources: ["MementoKataCode.swift"]
        ),
        .testTarget(
            name: "MementoKataTests",
            dependencies: ["MementoKataCode"],
            path: "Kata",
            sources: ["MementoKataTests.swift"]
        ),
        .target(
            name: "MementoKataSolutionCode",
            path: "KataSolution",
            sources: ["MementoKataSolutionCode.swift"]
        ),
        .testTarget(
            name: "MementoKataSolutionTests",
            dependencies: ["MementoKataSolutionCode"],
            path: "KataSolution",
            sources: ["MementoKataSolutionTests.swift"]
        ),
    ]
)
