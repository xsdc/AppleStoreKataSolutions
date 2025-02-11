// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "FactoryMethod",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "FactoryMethod",
            targets: [
                "FactoryMethodArticleCode",
                "FactoryMethodArticleTests",
                "FactoryMethodKataCode",
                "FactoryMethodKataTests",
                "FactoryMethodKataSolutionCode",
                "FactoryMethodKataSolutionTests",
            ])
    ],
    targets: [
        .target(
            name: "FactoryMethodArticleCode",
            path: "Article",
            sources: ["FactoryMethodArticleCode.swift"]
        ),
        .testTarget(
            name: "FactoryMethodArticleTests",
            dependencies: ["FactoryMethodArticleCode"],
            path: "Article",
            sources: ["FactoryMethodArticleTests.swift"]
        ),
        .target(
            name: "FactoryMethodKataCode",
            path: "Kata",
            sources: ["FactoryMethodKataCode.swift"]
        ),
        .testTarget(
            name: "FactoryMethodKataTests",
            dependencies: ["FactoryMethodKataCode"],
            path: "Kata",
            sources: ["FactoryMethodKataTests.swift"]
        ),
        .target(
            name: "FactoryMethodKataSolutionCode",
            path: "KataSolution",
            sources: ["FactoryMethodKataSolutionCode.swift"]
        ),
        .testTarget(
            name: "FactoryMethodKataSolutionTests",
            dependencies: ["FactoryMethodKataSolutionCode"],
            path: "KataSolution",
            sources: ["FactoryMethodKataSolutionTests.swift"]
        ),
    ]
)
