// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Prototype",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "Prototype",
            targets: [
                "PrototypeArticleCode",
                "PrototypeArticleTests",
                "PrototypeKataCode",
                "PrototypeKataTests",
                "PrototypeKataSolutionCode",
                "PrototypeKataSolutionTests",
            ])
    ],
    targets: [
        .target(
            name: "PrototypeArticleCode",
            path: "Article",
            sources: ["PrototypeArticleCode.swift"]
        ),
        .testTarget(
            name: "PrototypeArticleTests",
            dependencies: ["PrototypeArticleCode"],
            path: "Article",
            sources: ["PrototypeArticleTests.swift"]
        ),
        .target(
            name: "PrototypeKataCode",
            path: "Kata",
            sources: ["PrototypeKataCode.swift"]
        ),
        .testTarget(
            name: "PrototypeKataTests",
            dependencies: ["PrototypeKataCode"],
            path: "Kata",
            sources: ["PrototypeKataTests.swift"]
        ),
        .target(
            name: "PrototypeKataSolutionCode",
            path: "KataSolution",
            sources: ["PrototypeKataSolutionCode.swift"]
        ),
        .testTarget(
            name: "PrototypeKataSolutionTests",
            dependencies: ["PrototypeKataSolutionCode"],
            path: "KataSolution",
            sources: ["PrototypeKataSolutionTests.swift"]
        ),
    ]
)
