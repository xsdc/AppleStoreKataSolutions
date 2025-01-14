# Apple Store: Design Pattern Katas

### Overview

- This collection of katas is designed to help you understand and apply classic design patterns within the context of the Apple Store domain.

- Each design pattern has a dedicated folder in the `DesignPatterns` folder.

- For example, the Visitor pattern resides in `DesignPatterns/AppleStoreVisitor`.

- Before diving into each kata, take some time to read the articles and understand the design pattern being covered.

## Instructions: Article code

- In each design pattern folder, the example code from its article is included with corresponding tests, eg. `DesignPatterns/AppleStoreVisitor/Sources/VisitorArticleCode.swift` and `DesignPatterns/AppleStoreVisitor/Tests/VisitorArticleCodeTests.swift`

- The article code is provided as a starting point for each kata.

- To run the article code tests, navigate to the root of each pattern, and run:

```shell
cd DesignPatterns/AppleStoreVisitor
swift test --filter ArticleCode
```

## Instructions: Kata

- Alongside the article code is the kata source and test files, eg. `DesignPatterns/AppleStoreVisitor/Sources/VisitorKata.swift` and `DesignPatterns/AppleStoreVisitor/Tests/VisitorKataTests.swift`

- These will include failing tests. To run them:

```shell
swift test --filter Kata
```

- To complete each kata, refer to the markdown file containing the challenges in the design pattern root directory, eg. `DesignPatterns/AppleStoreVisitor/VisitorKata.md`

- These will contain challenges that are needed to be completed.
