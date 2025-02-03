// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Visitor",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "Visitor",
            targets: [
                "VisitorArticleCode",
                "VisitorArticleTests",
                "VisitorKataCode",
                "VisitorKataTests",
                "VisitorKataSolutionCode",
                "VisitorKataSolutionTests",
            ])
    ],
    targets: [
        .target(
            name: "VisitorArticleCode",
            path: "Article",
            sources: ["VisitorArticleCode.swift"]
        ),
        .testTarget(
            name: "VisitorArticleTests",
            dependencies: ["VisitorArticleCode"],
            path: "Article",
            sources: ["VisitorArticleTests.swift"]
        ),
        .target(
            name: "VisitorKataCode",
            path: "Kata",
            sources: ["VisitorKataCode.swift"]
        ),
        .testTarget(
            name: "VisitorKataTests",
            dependencies: ["VisitorKataCode"],
            path: "Kata",
            sources: ["VisitorKataTests.swift"]
        ),
        .target(
            name: "VisitorKataSolutionCode",
            path: "KataSolution",
            sources: ["VisitorKataSolutionCode.swift"]
        ),
        .testTarget(
            name: "VisitorKataSolutionTests",
            dependencies: ["VisitorKataSolutionCode"],
            path: "KataSolution",
            sources: ["VisitorKataSolutionTests.swift"]
        ),
    ]
)
