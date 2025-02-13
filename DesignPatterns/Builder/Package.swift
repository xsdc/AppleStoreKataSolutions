// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Builder",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "Builder",
            targets: [
                "BuilderArticleCode",
                "BuilderArticleTests",
                "BuilderKataCode",
                "BuilderKataTests",
                "BuilderKataSolutionCode",
                "BuilderKataSolutionTests",
            ])
    ],
    targets: [
        .target(
            name: "BuilderArticleCode",
            path: "Article",
            sources: ["BuilderArticleCode.swift"]
        ),
        .testTarget(
            name: "BuilderArticleTests",
            dependencies: ["BuilderArticleCode"],
            path: "Article",
            sources: ["BuilderArticleTests.swift"]
        ),
        .target(
            name: "BuilderKataCode",
            path: "Kata",
            sources: ["BuilderKataCode.swift"]
        ),
        .testTarget(
            name: "BuilderKataTests",
            dependencies: ["BuilderKataCode"],
            path: "Kata",
            sources: ["BuilderKataTests.swift"]
        ),
        .target(
            name: "BuilderKataSolutionCode",
            path: "KataSolution",
            sources: ["BuilderKataSolutionCode.swift"]
        ),
        .testTarget(
            name: "BuilderKataSolutionTests",
            dependencies: ["BuilderKataSolutionCode"],
            path: "KataSolution",
            sources: ["BuilderKataSolutionTests.swift"]
        ),
    ]
)
