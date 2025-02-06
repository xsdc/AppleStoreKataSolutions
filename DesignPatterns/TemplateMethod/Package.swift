// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "TemplateMethod",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "TemplateMethod",
            targets: [
                "TemplateMethodArticleCode",
                "TemplateMethodArticleTests",
                "TemplateMethodKataCode",
                "TemplateMethodKataTests",
                "TemplateMethodKataSolutionCode",
                "TemplateMethodKataSolutionTests",
            ])
    ],
    targets: [
        .target(
            name: "TemplateMethodArticleCode",
            path: "Article",
            sources: ["TemplateMethodArticleCode.swift"]
        ),
        .testTarget(
            name: "TemplateMethodArticleTests",
            dependencies: ["TemplateMethodArticleCode"],
            path: "Article",
            sources: ["TemplateMethodArticleTests.swift"]
        ),
        .target(
            name: "TemplateMethodKataCode",
            path: "Kata",
            sources: ["TemplateMethodKataCode.swift"]
        ),
        .testTarget(
            name: "TemplateMethodKataTests",
            dependencies: ["TemplateMethodKataCode"],
            path: "Kata",
            sources: ["TemplateMethodKataTests.swift"]
        ),
        .target(
            name: "TemplateMethodKataSolutionCode",
            path: "KataSolution",
            sources: ["TemplateMethodKataSolutionCode.swift"]
        ),
        .testTarget(
            name: "TemplateMethodKataSolutionTests",
            dependencies: ["TemplateMethodKataSolutionCode"],
            path: "KataSolution",
            sources: ["TemplateMethodKataSolutionTests.swift"]
        ),
    ]
)
