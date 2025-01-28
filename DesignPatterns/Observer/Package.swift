// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Observer",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "Observer",
            targets: [
                "ObserverArticleCode",
                "ObserverArticleTests",
                "ObserverKataCode",
                "ObserverKataTests",
                "ObserverKataSolutionCode",
                "ObserverKataSolutionTests",
            ])
    ],
    targets: [
        .target(
            name: "ObserverArticleCode",
            path: "Article",
            sources: ["ObserverArticleCode.swift"]
        ),
        .testTarget(
            name: "ObserverArticleTests",
            dependencies: ["ObserverArticleCode"],
            path: "Article",
            sources: ["ObserverArticleTests.swift"]
        ),
        .target(
            name: "ObserverKataCode",
            path: "Kata",
            sources: ["ObserverKataCode.swift"]
        ),
        .testTarget(
            name: "ObserverKataTests",
            dependencies: ["ObserverKataCode"],
            path: "Kata",
            sources: ["ObserverKataTests.swift"]
        ),
        .target(
            name: "ObserverKataSolutionCode",
            path: "KataSolution",
            sources: ["ObserverKataSolutionCode.swift"]
        ),
        .testTarget(
            name: "ObserverKataSolutionTests",
            dependencies: ["ObserverKataSolutionCode"],
            path: "KataSolution",
            sources: ["ObserverKataSolutionTests.swift"]
        ),
    ]
)
