// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Iterator",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "Iterator",
            targets: [
                "IteratorArticleCode",
                "IteratorArticleTests",
                "IteratorKataCode",
                "IteratorKataTests",
                "IteratorKataSolutionCode",
                "IteratorKataSolutionTests",
            ])
    ],
    targets: [
        .target(
            name: "IteratorArticleCode",
            path: "Article",
            sources: ["IteratorArticleCode.swift"]
        ),
        .testTarget(
            name: "IteratorArticleTests",
            dependencies: ["IteratorArticleCode"],
            path: "Article",
            sources: ["IteratorArticleTests.swift"]
        ),
        .target(
            name: "IteratorKataCode",
            path: "Kata",
            sources: ["IteratorKataCode.swift"]
        ),
        .testTarget(
            name: "IteratorKataTests",
            dependencies: ["IteratorKataCode"],
            path: "Kata",
            sources: ["IteratorKataTests.swift"]
        ),
        .target(
            name: "IteratorKataSolutionCode",
            path: "KataSolution",
            sources: ["IteratorKataSolutionCode.swift"]
        ),
        .testTarget(
            name: "IteratorKataSolutionTests",
            dependencies: ["IteratorKataSolutionCode"],
            path: "KataSolution",
            sources: ["IteratorKataSolutionTests.swift"]
        ),
    ]
)
