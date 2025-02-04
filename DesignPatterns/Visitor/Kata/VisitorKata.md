
# Visitor Kata

Before attempting the kata, read the article, code, and tests.

Location of the files:

- `DesignPatterns/Visitor/Article/VisitorArticle.md`
- `DesignPatterns/Visitor/Article/VisitorArticleCode.swift`
- `DesignPatterns/Visitor/Article/VisitorArticleTests.swift`

The tests can either be run via Xcode or the command line.

To run them via Xcode:
- The `DesignPatterns/Visitor` package directory can be opened in Xcode with: File -> Open (⌘ + O)
- Or open the package by running the following command from the root directory: `xed DesignPatterns/Visitor`

To run them via the command line:
- Navigate to the directory: `cd DesignPatterns/Visitor`
- Run the following command: `swift test`
- To get an overview of the tests, run the following command: `swift test --list-tests`

## Kata code

Files: `DesignPatterns/Visitor/Kata/VisitorKataCode.swift`

### Task 1

In addition to the current concrete visitors, add a sales tax visitor that calculates the sales tax for a product.

- Include the sales tax visitor under the correct definition

- The sales tax should be a variable initialised with the class.

### Task 2

In addition to the `Visitor` protocol, an async version has been defined: `AsyncVisitor`.

- Update the `VisitorAccepting` protocol to accept asynchronous visitors.

- Update the concrete elements to stay in conformance.

- Add a new concrete visitor called `StockCheckVisitor` that conforms to `AsyncVisitor` instead of `Visitor`.

- The stock check visitor `VisitorResult` typealias should be assigned to the `Result<Bool, Error>` type.

- The `StockCheckVisitor` should be initialised with a `storeCode` variable of type `String`.

- For simplicity, the `StockCheckVisitor` visit method should return `.success(false)`.

## Kata tests

Files: `DesignPatterns/Visitor/Kata/VisitorKataTests.swift`

### Task 1

Test method: `testSalesTaxVisitorWith10Percent()`

- Test the sales tax visitor with a rate of 10%.

- The test should verify the sales tax visitor for `MacBookProProduct` and `VisionProProduct`.

Run the test via the command line with:

```shell
swift test --filter VisitorKataTests.testTask1
```

### Task 2

Test method: `testSalesTaxVisitorWith15Percent()`

- Test the sales tax visitor with a rate of 15%.

- The test should verify the sales tax visitor for `MacBookProProduct` and `VisionProProduct`.

Run the test via the command line with:

```shell
swift test --filter VisitorKataTests.testTask2
```

### Task 3

Test method: `testAsyncStockCheckVisitor()`

- The test should verify that the stock check visitor for `MacBookProProduct` and `VisionProProduct` both return a `Result` type with the success type being `false`.

Run the test via the command line with:

```shell
swift test --filter VisitorKataTests.testTask3
```

## Final Check

Ensure that all tests pass:

```shell
swift test --filter VisitorKataTests
```
