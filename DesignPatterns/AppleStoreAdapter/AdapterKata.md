# Adapter Kata

Before attempting the kata, read the article, the code, and tests.

Location of the files:

- `DesignPatterns/AppleStoreAdapter/AdapterArticle.md`
- `DesignPatterns/AppleStoreAdapter/Sources/AdapterArticleCode.swift`
- `DesignPatterns/AppleStoreAdapter/Tests/AdapterArticleTests.swift`

## Kata code

File: `Sources/AdapterKataCode.swift`

### Task 1

Complete the implementation of the new recommendation engine adapter: `PopularityBasedRecommendationEngineAdapter`.

Run the test with:

```shell
swift test --filter AppleStoreAdapter.Kata/testPopularityBasedRecommendationEngineAdapter
```

### Task 2

Complete the implementation of the `dateIntroduced` property for the `Product` struct in `MachineLearningRecommendationEngineAdapter`.

Run the test with:

```shell
swift test --filter AppleStoreAdapter.Kata/testMachineLearningRecommendationEngineAdapter
```

### Task 3

Complete the implementation of the `dateIntroduced` property for the `Product` struct in `HistoryRecommendationEngineAdapter`.

Run the test with:

```shell
swift test --filter AppleStoreAdapter.Kata/testHistoryRecommendationEngineAdapter
```

## Final Check

Ensure that all tests pass:

```shell
swift test --filter AppleStoreAdapter.Kata
```
