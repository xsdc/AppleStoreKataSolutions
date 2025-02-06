# Iterator Kata

Before attempting the kata, read the article, code, and tests.

Location of the files:

- `DesignPatterns/Iterator/Article/IteratorArticle.md`
- `DesignPatterns/Iterator/Article/IteratorArticleCode.swift`
- `DesignPatterns/Iterator/Article/IteratorArticleTests.swift`

The tests can either be run via Xcode or the command line.

To run them via Xcode:
- The `DesignPatterns/Iterator` package directory can be opened in Xcode with: File -> Open (⌘ + O)
- Or by running the following command from the root directory: `xed DesignPatterns/Iterator`

To run them via the command line:
- Navigate to the directory: `cd DesignPatterns/Iterator`
- Run the following command: `swift test`
- To get an overview of the tests, run the following command: `swift test --list-tests`

## Tasks

Files:
- `DesignPatterns/Iterator/Kata/IteratorKataCode.swift`
- `DesignPatterns/Iterator/Kata/IteratorKataTests.swift`

### Task 1

Complete the linked list implementation of the `CatalogIterator` protocol.

Run the test via the command line with:

```shell
swift test --filter IteratorKataTests.testTask1
```

### Task 2

Make the array implementation circular. Once the end of the array is reached, the iterator should start again from the beginning.

This could be useful for a carousel, for example.

Run the test via the command line with:

```shell
swift test --filter IteratorKataTests.testTask2
```

## Final Check

Ensure that all tests pass via the command line with:

```shell
swift test --filter IteratorKataTests
```
