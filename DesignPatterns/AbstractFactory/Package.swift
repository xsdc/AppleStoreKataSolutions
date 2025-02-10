// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "AbstractFactory",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "AbstractFactory",
            targets: [
                "AbstractFactoryArticleCode",
                "AbstractFactoryArticleTests",
                "AbstractFactoryKataCode",
                "AbstractFactoryKataTests",
                "AbstractFactoryKataSolutionCode",
                "AbstractFactoryKataSolutionTests",
            ])
    ],
    targets: [
        .target(
            name: "AbstractFactoryArticleCode",
            path: "Article",
            sources: ["AbstractFactoryArticleCode.swift"]
        ),
        .testTarget(
            name: "AbstractFactoryArticleTests",
            dependencies: ["AbstractFactoryArticleCode"],
            path: "Article",
            sources: ["AbstractFactoryArticleTests.swift"]
        ),
        .target(
            name: "AbstractFactoryKataCode",
            path: "Kata",
            sources: ["AbstractFactoryKataCode.swift"]
        ),
        .testTarget(
            name: "AbstractFactoryKataTests",
            dependencies: ["AbstractFactoryKataCode"],
            path: "Kata",
            sources: ["AbstractFactoryKataTests.swift"]
        ),
        .target(
            name: "AbstractFactoryKataSolutionCode",
            path: "KataSolution",
            sources: ["AbstractFactoryKataSolutionCode.swift"]
        ),
        .testTarget(
            name: "AbstractFactoryKataSolutionTests",
            dependencies: ["AbstractFactoryKataSolutionCode"],
            path: "KataSolution",
            sources: ["AbstractFactoryKataSolutionTests.swift"]
        ),
    ]
)
