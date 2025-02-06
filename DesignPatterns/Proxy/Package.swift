// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Proxy",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "Proxy",
            targets: [
                "ProxyArticleCode",
                "ProxyArticleTests",
                "ProxyKataCode",
                "ProxyKataTests",
                "ProxyKataSolutionCode",
                "ProxyKataSolutionTests",
            ])
    ],
    targets: [
        .target(
            name: "ProxyArticleCode",
            path: "Article",
            sources: ["ProxyArticleCode.swift"]
        ),
        .testTarget(
            name: "ProxyArticleTests",
            dependencies: ["ProxyArticleCode"],
            path: "Article",
            sources: ["ProxyArticleTests.swift"]
        ),
        .target(
            name: "ProxyKataCode",
            path: "Kata",
            sources: ["ProxyKataCode.swift"]
        ),
        .testTarget(
            name: "ProxyKataTests",
            dependencies: ["ProxyKataCode"],
            path: "Kata",
            sources: ["ProxyKataTests.swift"]
        ),
        .target(
            name: "ProxyKataSolutionCode",
            path: "KataSolution",
            sources: ["ProxyKataSolutionCode.swift"]
        ),
        .testTarget(
            name: "ProxyKataSolutionTests",
            dependencies: ["ProxyKataSolutionCode"],
            path: "KataSolution",
            sources: ["ProxyKataSolutionTests.swift"]
        ),
    ]
)
