// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "ChainOfResponsibility",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "ChainOfResponsibility",
            targets: [
                "ChainOfResponsibilityArticleCode",
                "ChainOfResponsibilityArticleTests",
                "ChainOfResponsibilityKataCode",
                "ChainOfResponsibilityKataTests",
                "ChainOfResponsibilityKataSolutionCode",
                "ChainOfResponsibilityKataSolutionTests",
            ])
    ],
    targets: [
        .target(
            name: "ChainOfResponsibilityArticleCode",
            path: "Article",
            sources: ["ChainOfResponsibilityArticleCode.swift"]
        ),
        .testTarget(
            name: "ChainOfResponsibilityArticleTests",
            dependencies: ["ChainOfResponsibilityArticleCode"],
            path: "Article",
            sources: ["ChainOfResponsibilityArticleTests.swift"]
        ),
        .target(
            name: "ChainOfResponsibilityKataCode",
            path: "Kata",
            sources: ["ChainOfResponsibilityKataCode.swift"]
        ),
        .testTarget(
            name: "ChainOfResponsibilityKataTests",
            dependencies: ["ChainOfResponsibilityKataCode"],
            path: "Kata",
            sources: ["ChainOfResponsibilityKataTests.swift"]
        ),
        .target(
            name: "ChainOfResponsibilityKataSolutionCode",
            path: "KataSolution",
            sources: ["ChainOfResponsibilityKataSolutionCode.swift"]
        ),
        .testTarget(
            name: "ChainOfResponsibilityKataSolutionTests",
            dependencies: ["ChainOfResponsibilityKataSolutionCode"],
            path: "KataSolution",
            sources: ["ChainOfResponsibilityKataSolutionTests.swift"]
        ),
    ]
)
