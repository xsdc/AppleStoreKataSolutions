# Adapter Kata

Before attempting the kata, read the article, code, and tests.

Location of the files:

- `DesignPatterns/AppleStoreAdapter/AdapterArticle.md`
- `DesignPatterns/AppleStoreAdapter/Sources/AdapterArticleCode.swift`
- `DesignPatterns/AppleStoreAdapter/Tests/AdapterArticleTests.swift`

The tests can either be run via Xcode or the command line.

To run them via Xcode:
- The `DesignPatterns/Adapter` package directory can be opened in Xcode with: File -> Open (⌘ + O)
- Or open the package by running the following command from the root directory: `xed DesignPatterns/Adapter`

To run them via the command line:
- Navigate to the directory: `cd DesignPatterns/Adapter`
- Run the following command: `swift test`
- To get an overview of the tests, run the following command: `swift test --list-tests`

## Tasks

Files:
- `DesignPatterns/Adapter/Kata/AdapterKataCode.swift`
- `DesignPatterns/Adapter/Kata/AdapterKataTests.swift`

### Task 1

Complete the implementation of the new recommendation engine adapter: `PopularityBasedRecommendationEngineAdapter`.

Run the test with:

```shell
swift test --filter AdapterKataTests.testTask1
```

### Task 2

Complete the implementation of the `dateIntroduced` property for the `Product` struct in `MachineLearningRecommendationEngineAdapter`.

Run the test with:

```shell
swift test --filter AdapterKataTests.testTask2
```

### Task 3

Complete the implementation of the `dateIntroduced` property for the `Product` struct in `HistoryRecommendationEngineAdapter`.

Run the test with:

```shell
swift test --filter AdapterKataTests.testTask3
```

## Final Check

Ensure that all tests pass:

```shell
swift test --filter AdapterKataTests
```
