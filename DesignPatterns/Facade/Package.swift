// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Facade",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "Facade",
            targets: [
                "FacadeArticleCode",
                "FacadeArticleTests",
                "FacadeKataCode",
                "FacadeKataTests",
                "FacadeKataSolutionCode",
                "FacadeKataSolutionTests",
            ])
    ],
    targets: [
        .target(
            name: "FacadeArticleCode",
            path: "Article",
            sources: ["FacadeArticleCode.swift"]
        ),
        .testTarget(
            name: "FacadeArticleTests",
            dependencies: ["FacadeArticleCode"],
            path: "Article",
            sources: ["FacadeArticleTests.swift"]
        ),
        .target(
            name: "FacadeKataCode",
            path: "Kata",
            sources: ["FacadeKataCode.swift"]
        ),
        .testTarget(
            name: "FacadeKataTests",
            dependencies: ["FacadeKataCode"],
            path: "Kata",
            sources: ["FacadeKataTests.swift"]
        ),
        .target(
            name: "FacadeKataSolutionCode",
            path: "KataSolution",
            sources: ["FacadeKataSolutionCode.swift"]
        ),
        .testTarget(
            name: "FacadeKataSolutionTests",
            dependencies: ["FacadeKataSolutionCode"],
            path: "KataSolution",
            sources: ["FacadeKataSolutionTests.swift"]
        ),
    ]
)
