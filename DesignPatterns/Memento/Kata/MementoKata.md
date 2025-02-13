# Memento Kata

Before attempting the kata, read the article, code, and tests.

Location of the files:

- `DesignPatterns/Memento/Article/MementoArticle.md`
- `DesignPatterns/Memento/Article/MementoArticleCode.swift`
- `DesignPatterns/Memento/Article/MementoArticleTests.swift`

The tests can either be run via Xcode or the command line.

To run them via Xcode:
- The `DesignPatterns/Memento` package directory can be opened in Xcode with: File -> Open (⌘ + O)
- Or by running the following command from the root directory: `xed DesignPatterns/Memento`

To run them via the command line:
- Navigate to the directory: `cd DesignPatterns/Memento`
- Run the following command: `swift test`
- To get an overview of the tests, run the following command: `swift test --list-tests`

## Tasks

Files:
- `DesignPatterns/Memento/Kata/MementoKataCode.swift`
- `DesignPatterns/Memento/Kata/MementoKataTests.swift`

### Task 1

- Implement redo functionality in `BagManager`.

- Hint: Redo states should be cleared when removing a product.

- Ensure that the undo functionality remains working as expected.

```shell
swift test --filter MementoKataTests.testTask1
```

### Task 2

- Implemented the updating of product quantities, and tie that in with the redo and undo functionality of `BagManager`.

- Each update should trigger a new state that needs to be saved.

Run the test via the command line with:

```shell
swift test --filter MementoKataTests.testTask2
```

## Final Check

Ensure that all tests pass via the command line with:

```shell
swift test --filter MementoKataTests
```
