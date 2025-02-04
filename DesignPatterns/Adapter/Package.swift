// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Adapter",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "Adapter",
            targets: [
                "AdapterArticleCode",
                "AdapterArticleTests",
                "AdapterKataCode",
                "AdapterKataTests",
                "AdapterKataSolutionCode",
                "AdapterKataSolutionTests",
            ])
    ],
    targets: [
        .target(
            name: "AdapterArticleCode",
            path: "Article",
            sources: ["AdapterArticleCode.swift"]
        ),
        .testTarget(
            name: "AdapterArticleTests",
            dependencies: ["AdapterArticleCode"],
            path: "Article",
            sources: ["AdapterArticleTests.swift"]
        ),
        .target(
            name: "AdapterKataCode",
            path: "Kata",
            sources: ["AdapterKataCode.swift"]
        ),
        .testTarget(
            name: "AdapterKataTests",
            dependencies: ["AdapterKataCode"],
            path: "Kata",
            sources: ["AdapterKataTests.swift"]
        ),
        .target(
            name: "AdapterKataSolutionCode",
            path: "KataSolution",
            sources: ["AdapterKataSolutionCode.swift"]
        ),
        .testTarget(
            name: "AdapterKataSolutionTests",
            dependencies: ["AdapterKataSolutionCode"],
            path: "KataSolution",
            sources: ["AdapterKataSolutionTests.swift"]
        ),
    ]
)
