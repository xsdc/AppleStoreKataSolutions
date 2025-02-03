// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Decorator",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "Decorator",
            targets: [
                "DecoratorArticleCode",
                "DecoratorArticleTests",
                "DecoratorKataCode",
                "DecoratorKataTests",
                "DecoratorKataSolutionCode",
                "DecoratorKataSolutionTests",
            ])
    ],
    targets: [
        .target(
            name: "DecoratorArticleCode",
            path: "Article",
            sources: ["DecoratorArticleCode.swift"]
        ),
        .testTarget(
            name: "DecoratorArticleTests",
            dependencies: ["DecoratorArticleCode"],
            path: "Article",
            sources: ["DecoratorArticleTests.swift"]
        ),
        .target(
            name: "DecoratorKataCode",
            path: "Kata",
            sources: ["DecoratorKataCode.swift"]
        ),
        .testTarget(
            name: "DecoratorKataTests",
            dependencies: ["DecoratorKataCode"],
            path: "Kata",
            sources: ["DecoratorKataTests.swift"]
        ),
        .target(
            name: "DecoratorKataSolutionCode",
            path: "KataSolution",
            sources: ["DecoratorKataSolutionCode.swift"]
        ),
        .testTarget(
            name: "DecoratorKataSolutionTests",
            dependencies: ["DecoratorKataSolutionCode"],
            path: "KataSolution",
            sources: ["DecoratorKataSolutionTests.swift"]
        ),
    ]
)
