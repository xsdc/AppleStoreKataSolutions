# Composite Kata

Before attempting the kata, read the article, code, and tests.

Location of the files:

- `DesignPatterns/Composite/Article/CompositeArticle.md`
- `DesignPatterns/Composite/Article/CompositeArticleCode.swift`
- `DesignPatterns/Composite/Article/CompositeArticleTests.swift`

The tests can either be run via Xcode or the command line.

To run them via Xcode:
- The `DesignPatterns/Composite` package directory can be opened in Xcode with: File -> Open (⌘ + O)
- Or by running the following command from the root directory: `xed DesignPatterns/Composite`

To run them via the command line:
- Navigate to the directory: `cd DesignPatterns/Composite`
- Run the following command: `swift test`
- To get an overview of the tests, run the following command: `swift test --list-tests`

## Tasks

Files:
- `DesignPatterns/Composite/Kata/CompositeKataCode.swift`
- `DesignPatterns/Composite/Kata/CompositeKataTests.swift`

### Task 1

Implement the `AnalyticsIdentifiable` for categories. Return only the `id`.

Run the test via the command line with:

```shell
swift test --filter CompositeKataTests.testTask1
```

### Task 2

- Implement the `AnalyticsIdentifiable` for products.

- Return the product `id`, and append a dash, and then the parent category `id`.

- Only return the product `id` if the parent category is `nil`.

Run the test via the command line with:

```shell
swift test --filter CompositeKataTests.testTask2
```

## Final Check

Ensure that all tests pass via the command line with:

```shell
swift test --filter CompositeKataTests
```
