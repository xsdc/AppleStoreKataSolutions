// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Composite",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "Composite",
            targets: [
                "CompositeArticleCode",
                "CompositeArticleTests",
                "CompositeKataCode",
                "CompositeKataTests",
                "CompositeKataSolutionCode",
                "CompositeKataSolutionTests",
            ])
    ],
    targets: [
        .target(
            name: "CompositeArticleCode",
            path: "Article",
            sources: ["CompositeArticleCode.swift"]
        ),
        .testTarget(
            name: "CompositeArticleTests",
            dependencies: ["CompositeArticleCode"],
            path: "Article",
            sources: ["CompositeArticleTests.swift"]
        ),
        .target(
            name: "CompositeKataCode",
            path: "Kata",
            sources: ["CompositeKataCode.swift"]
        ),
        .testTarget(
            name: "CompositeKataTests",
            dependencies: ["CompositeKataCode"],
            path: "Kata",
            sources: ["CompositeKataTests.swift"]
        ),
        .target(
            name: "CompositeKataSolutionCode",
            path: "KataSolution",
            sources: ["CompositeKataSolutionCode.swift"]
        ),
        .testTarget(
            name: "CompositeKataSolutionTests",
            dependencies: ["CompositeKataSolutionCode"],
            path: "KataSolution",
            sources: ["CompositeKataSolutionTests.swift"]
        ),
    ]
)
