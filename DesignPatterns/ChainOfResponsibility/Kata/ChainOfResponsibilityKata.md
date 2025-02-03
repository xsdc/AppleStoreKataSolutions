# Chain of Responsibility Kata

Before attempting the kata, read the article, code, and tests.

Location of the files:

- `DesignPatterns/ChainOfResponsibility/Article/ChainOfResponsibilityArticle.md`
- `DesignPatterns/ChainOfResponsibility/Article/ChainOfResponsibilityArticleCode.swift`
- `DesignPatterns/ChainOfResponsibility/Article/ChainOfResponsibilityArticleTests.swift`

The tests can either be run via Xcode or the command line.

To run them via Xcode:
- The `DesignPatterns/ChainOfResponsibility` package directory can be opened in Xcode with: File -> Open (⌘ + O)
- Or open the package by running the following command from the root directory: `xed DesignPatterns/ChainOfResponsibility`

To run them via the command line:
- Navigate to the directory: `cd DesignPatterns/ChainOfResponsibility`
- Run the following command: `swift test`
- To get an overview of the tests, run the following command: `swift test --list-tests`

## Tasks

Files:
- `DesignPatterns/ChainOfResponsibility/Kata/ChainOfResponsibilityKataCode.swift`
- `DesignPatterns/ChainOfResponsibility/Kata/ChainOfResponsibilityKataTests.swift`

### Task 1

Remove the stock check handler from the chain. See the following test: `testTask1`

The order of the handler queue should be:
1. Add to bag handler
2. Logging handler

For simplicity, the implementations are omitted.

Run the test via the command line with:

```shell
swift test --filter ChainOfResponsibilityKataTests.testTask1
```

### Task 2

Based on the the `StockCheckHandler`, create a new handler called `InStoreStockCheckHandler`.

- It should be initialized with a `storeCode` string.
- For simplicity, only return the failed path.
- In `InStoreStockCheckHandler` the handle method, set `request.productIsInStock` to `false`.
- Notice how this changes the flow taken by `AddToBagHandler`.

See the expected outputs in the test: `testTask2`

The handler queue order should be:
1. In-store stock check handler
2. Add to bag handler
3. Logging handler

Run the test via the command line with:

```shell
swift test --filter ChainOfResponsibilityKataTests.testTask2
```

## Final Check

Ensure that all tests pass via the command line with:

```shell
swift test --filter ChainOfResponsibilityKataTests
```
